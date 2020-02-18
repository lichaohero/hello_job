"""
char room 客户端
"""
from socket import *
import os
import sys
import json
import time

# 服务器地址
ADDR = ('127.0.0.1', 8402)
fromname = ""
toname = ""

# 发送消息
def send_msg(s,fromaccount,toaccount):
    while True:
        try:
            text = input("消息:")
            data = {"request_type": "p_send_msg", "data":
                {"From": fromname, "To": toname, "send_time": time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()),
                 "send_content": text}}
        except KeyboardInterrupt:
            text = 'quit'
        if not text:
            continue
        if text == 'quit':
            msg = {"request_type":"QUIT " ,"account":fromaccount}
            s.sendto(json.dumps(msg).encode(),ADDR) # 退出
            sys.exit("退出聊天")
        msg = json.dumps(data).encode()
        print("客户端msg:",msg)
        s.sendto(msg,ADDR)

# 接受消息
def recv_msg(s):
    while True:
        data,addr = s.recvfrom(2048)
        print(data.decode()+"\n消息：",end="")

# 登录处理
def do_login(s):
    while True:
        global fromname
        fromname = input("你的账号:")
        pwd = input("密码:")
        msg = {"request_type":"LOGIN","data":{
            "username":fromname,"pwd":pwd
        }}
        s.sendto(json.dumps(msg).encode(), ADDR)  # 发请求
        # 接受反馈
        data,addr = s.recvfrom(128)
        if data.decode() == 'LOGIN OK':
            return True
        else:
            # 得到失败原因
            print(data.decode())

# 网络搭建
def main():
    s = socket(AF_INET, SOCK_DGRAM)
    if do_login(s):
        # 如果登录成功，创建新的进程
        pid = os.fork()
        if pid < 0:
            sys.exit("服务器异常....")
        elif pid == 0:
            recv_msg(s)  # 收消息
        else:
            global toname
            toname = input("请输入您要给谁发消息:")
            print("fromname:",fromname)
            msg = {"request_type":"INITCHATRECORD","From":fromname,
                   'To':toname}
            s.sendto(json.dumps(msg).encode(), ADDR)
            send_msg(s, fromname, toname)  # 发送消息

if __name__ == '__main__':
    main()