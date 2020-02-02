from socket import *
import os
import db

ADDR = ('0.0.0.0', 8888)

# 创建用户存储字典 {name:address}
allapps = {}
allhrs = {}
db = db.Database()

def do_login(s,account,password,addr):
    if db.selecthrcount(account,password)[0][0] == 1:
        allhrs[account] = addr
        s.sendto(b'OK',allhrs[account])
    elif db.selectappcount(account,password)[0][0] == 1:
        allapps[account] = addr
        s.sendto(b'OK',allapps[account])

#账户登录后立即加载聊天记录
def initchatrecord(s,fromaccount,toaccount,addr):
    records = db.selectchatrecord(fromaccount, toaccount)
    if fromaccount in allapps:
        allapps[fromaccount] = addr
        for i in range(len(records)):
            s.sendto(records[i][0].encode(), allapps[fromaccount])
    else:
        allhrs[fromaccount] = addr
        for i in range(len(records)):
            s.sendto(records[i][0].encode(), allhrs[fromaccount])

# 将所有hr和app用户添加到用户存储字典中
def addapps():
    allapp = db.selallapps()
    for app in allapp:
        allapps[app[0]] = ''
    return allapps

def addhrs():
    allhr = db.selectallhrs()
    for hr in allhr:
        allhrs[hr[0]] = ''
    return allhrs

# 求职者和hr相互发消息
def do_chat(s, fromaccount, text, toaccount, addr=''):
    msg = "\n%s : %s" % (fromaccount, text)
    if fromaccount in allhrs:
        for i in allapps:
            if i != fromaccount and i == toaccount:
                if addr == '' or addr is None:
                    db.insertchatrecord(fromaccount, toaccount, text, 0)
                    return
                allapps[toaccount] = addr
                db.insertchatrecord(fromaccount, toaccount, text, 1)
                db.updatechatrecord(toaccount)
                s.sendto(msg.encode(), allapps[toaccount])
    if fromaccount in allapps:
        for i in allhrs:
            if i != fromaccount and i == toaccount:
                if allhrs[toaccount] == '' or allhrs[toaccount] is None:
                    db.insertchatrecord(fromaccount,toaccount,text,0)
                    return
                else:
                    db.insertchatrecord(fromaccount, toaccount, text, 1)
                    db.updatechatrecord(toaccount)
                    s.sendto(msg.encode(),allhrs[toaccount])

# 接受请求，分发任务
def do_request(s):
    while True:
        # 所有请求都在这里接受
        data, addr = s.recvfrom(1024)
        tmp = data.decode().split(' ')  # 拆分请求
        # 任务分发 (CHAT QUIT)
        if tmp[0] == "LOGIN":
            do_login(s,tmp[1],tmp[2],addr)
        elif tmp[0] == "CHAT":
            if tmp[1] in allapps:
                do_chat(s, tmp[1], tmp[2],tmp[3],allhrs[tmp[3]])
            elif tmp[1] in allhrs:
                do_chat(s, tmp[1], tmp[2], tmp[3], allapps[tmp[3]])
        elif tmp[0] == "INITCHATRECORD":
            if tmp[1] in allapps:
                initchatrecord(s,tmp[1],tmp[2],addr)
            elif tmp[1] in allhrs:
                initchatrecord(s, tmp[1], tmp[2], addr)


# 搭建网络
def main():
    # udp服务端网络
    s = socket(AF_INET, SOCK_DGRAM)
    s.bind(ADDR)

    addapps()
    addhrs()
    pid = os.fork()
    if pid < 0:
        print("Server Error...")
        return
    elif pid == 0:
        pass
    else:
        # 请求处理函数
        do_request(s)

if __name__ == '__main__':
    main()