"""
ftp 文件服务器，服务端
env: python3.6
多线程并发，socket
"""
import json
import random
import sys
from socket import *
from threading import Thread

# 全局变量
from hello_job.client.sendmail import MailCode
from hello_job.server.handle.applicant.applicant_regist import verify_user_login_information, register
from hello_job.server.handle.applicant.search_position import get_position
from hello_job.server.handle.enterprise.search_applicant import search_applicant

HOST = '0.0.0.0'
PORT = 8402
ADDR = (HOST, PORT)


# 文件处理功能
def applicant_flow():
    pass


# 文件处理功能
class HelloJobServer(Thread):
    def __init__(self, connfd):
        super().__init__()
        self.connfd = connfd
        self.random_code = ""

    def verify_code(self):
        str_code = ""
        for i in range(6):
            str_code += str(random.randint(0, 9))
        return str_code

    # 处理客户端请求
    def run(self):
        # 循环接受请求
        while True:
            recv_msg = self.connfd.recv(1024).decode()
            recv_msg = json.loads(recv_msg)
            print("Request:", recv_msg)
            print(recv_msg)
            if not recv_msg:
                return
            # 应聘者登录系统
            if recv_msg["request_type"] == "p_login_verification":
                # Mysql查询账号密码的正确性   张志强
                verify_user_login_information(self.connfd, recv_msg["data"])
            elif recv_msg["request_type"] == "mail_register_code":
                self.random_code = self.verify_code()
                print(self.random_code)
                if MailCode(recv_msg["data"]["mailaddr"], self.random_code).mail_task():
                    self.connfd.send(b"mailaddr ok")
                else:
                    self.connfd.send(b"mailaddr error")
            elif recv_msg["request_type"] == "submit_register":
                print(self.random_code)
                if self.random_code == recv_msg["data"]["verify_code"]:
                    if register(self.connfd, recv_msg["data"]):
                        print("注册成功")
                        # Mysql储存client_request账号(邮箱地址)  孙国建
                        self.connfd.send("register success".encode())
                else:
                    self.connfd.send("code error".encode())
            elif recv_msg["request_type"] == "search_position":
                get_position(self.connfd, recv_msg["data"])
            elif recv_msg["request_type"] == "initiate_chat":
                initiate_chat(self.connfd, recv_msg["data"])
            elif recv_msg["request_type"] == "search_applicant":
                search_applicant(self.connfd, recv_msg["data"])
            elif recv_msg["request_type"] == "upload_resume":
                upload_resume(self.connfd, recv_msg["data"])
            elif recv_msg["request_type"] == "download_resume":
                download_resume(self.connfd, recv_msg["data"])


# 网络功能
def main():
    # 创建监听套接字
    s = socket()
    s.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
    s.bind(ADDR)
    s.listen(3)

    print('Listen the port 8042...')
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
        t = HelloJobServer(c)
        t.setDaemon(True)
        t.start()


if __name__ == '__main__':
    main()
