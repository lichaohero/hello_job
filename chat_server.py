from socket import *
import os
import db
import json
import time

ADDR = ('0.0.0.0', 8402)

# 创建用户存储字典 {name:address}
allapps = {}
allhrs = {}
db = db.Database()

# 登录账户与ip映射
def do_login(account,password,addr):
    if db.selecthrcount(account,password)[0][0] == 1:
        allhrs[account] = addr
        return True
    elif db.selectappcount(account,password)[0][0] == 1:
        allapps[account] = addr
        return True
    return False

#账户登录后立即加载聊天记录
def initchatrecord(s,fromaccount,toaccount,addr):
    records = db.selectchatrecord(fromaccount, toaccount)
    if fromaccount in allapps:
        allapps[fromaccount] = addr
        for i in range(len(records)):
            s.sendto((str(records[i][4])+"\n"+records[i][0]).encode(), allapps[fromaccount])
    else:
        allhrs[fromaccount] = addr
        for i in range(len(records)):
            s.sendto((str(records[i][4])+"\n"+records[i][0]).encode(), allhrs[fromaccount])

# 将所有求职者添加到用户存储字典中
def addapps():
    allapp = db.selallapps()
    for app in allapp:
        allapps[app[0]] = ''
    return allapps
# 将所有hr添加到用户存储字典中
def addhrs():
    allhr = db.selectallhrs()
    for hr in allhr:
        allhrs[hr[0]] = ''
    return allhrs

# 求职者和hr相互发消息并保存消息记录
def do_chat(s, fromaccount, text, toaccount, send_time,addr=''):
    msg = "\n%s : %s : %s" % (str(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())), fromaccount,text)
    if fromaccount in allhrs:
        for i in allapps:
            if i != fromaccount and i == toaccount:
                if addr == '' or addr is None:
                    db.insertchatrecord(fromaccount, toaccount, text, 0,send_time)
                    return
                allapps[toaccount] = addr
                db.insertchatrecord(fromaccount, toaccount, text, 1,send_time)
                db.updatechatrecord(toaccount)
                s.sendto(msg.encode(), allapps[toaccount])
    if fromaccount in allapps:
        for i in allhrs:
            if i != fromaccount and i == toaccount:
                if allhrs[toaccount] == '' or allhrs[toaccount] is None:
                    db.insertchatrecord(fromaccount,toaccount,text,0,send_time)
                    return
                else:
                    db.insertchatrecord(fromaccount, toaccount, text, 1,send_time)
                    db.updatechatrecord(toaccount)
                    s.sendto(msg.encode(),allhrs[toaccount])

# 接受请求，分发任务
def do_request(s):
    while True:
        # 所有请求都在这里接受
        data, addr = s.recvfrom(1024)
        request = json.loads(data)
        if request["request_type"] == "LOGIN":
            if do_login(request["data"]["username"],request["data"]["pwd"],addr):
                s.sendto(b'LOGIN OK',addr)
        elif request["request_type"] == "INITCHATRECORD":
            initchatrecord(s,request["From"],request["To"],addr)
        elif request["request_type"] == "p_send_msg":
            if request["data"]["From"] in allapps:
                do_chat(s, request["data"]["From"], request["data"]["send_content"],request["data"]["To"],request["data"]["send_time"],allhrs[request["data"]["To"]])
            elif request["data"]["From"] in allhrs:
                do_chat(s, request["data"]["From"], request["data"]["send_content"], request["data"]["To"], request["data"]["send_time"],allapps[request["data"]["To"]])
        elif request["request_type"] == "QUIT":
            if request["account"] in allhrs:
                allhrs[request["account"]] = ""
            elif request["account"] in allapps:
                allapps[request["account"]] = ""

# 搭建网络
def main():
    # udp服务端网络
    s = socket(AF_INET, SOCK_DGRAM)
    s.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
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