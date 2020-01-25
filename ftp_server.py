"""
ftp 文件服务器，服务端
env: python3.6
多线程并发，socket
"""

from socket import *
from threading import Thread
import sys
import random
from register import db

# 全局变量
from sendmail import MailCode

HOST = '0.0.0.0'
PORT = 8402
ADDR = (HOST,PORT)


# 文件处理功能
class FTPServer(Thread):
    def __init__(self,connfd):
        super().__init__()
        self.connfd = connfd
        self.random_code = ""


    def verify_code(self):
        str_code = ""
        for i in range(6):
            str_code += str(random.randint(0,9))
        return str_code

    #验证求职者能否注册
    def register(self,data):
        datalist = data.split(',')
        print("datalist[3]:",datalist[3])
        vali_result = db.Database().selectapplicant(datalist[1], datalist[3])
        print("vali_result：",vali_result)
        if vali_result:
            if vali_result[0][0] == datalist[1]:
                self.connfd.send('user already exists'.encode())
                return
            if vali_result[0][2] == datalist[3]:
                self.connfd.send('email already exists'.encode())
                return
        num = db.Database().insertapplicant(datalist[1], datalist[2], datalist[3])
        return num



    # 处理客户端请求
    def run(self):
        # 循环接受请求
        while True:
            data = self.connfd.recv(1024).decode()
            client_request = data.split(",")
            if not data:
                return
            if client_request[0] == "login verification":
                #Mysql查询账号密码的正确性
                self.connfd.send(b"Hello")
            if client_request[0] == "mail_register_code":
                self.random_code = self.verify_code()
                print(self.random_code)
                MailCode(client_request[1],self.random_code).mail_task()
            if client_request[0] == "submit_register":
                if self.random_code == client_request[3]:
                    #Mysql储存client_request账号(邮箱地址)
                    if self.register(data):
                        self.connfd.send("register_success".encode())
                else:
                    self.connfd.send("验证码错误".encode())


# 网络功能
def main():
    # 创建监听套接字
    s = socket()
    s.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
    s.bind(ADDR)
    s.listen(3)

    print('Listen the port 8888...')
    # 循环等待客户端连接
    while True:
        try:
            c, addr = s.accept()
            print("Connect from", addr)
        except KeyboardInterrupt:
            s.close()
            sys.exit("服务器退出")
        except Exception as e:
            print(e)
            continue

        # 客户端连接 ，创建线程
        t = FTPServer(c)
        t.setDaemon(True)
        t.start()

if __name__ == '__main__':
    main()