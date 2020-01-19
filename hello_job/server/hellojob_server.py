"""
ftp 文件服务器，服务端
env: python3.6
多线程并发，socket
"""

import sys
from socket import *
from threading import Thread

# 全局变量
from hello_job.other.controller import Controller

HOST = '0.0.0.0'
PORT = 8402
ADDR = (HOST, PORT)


# 文件处理功能
def applicant_flow():
    pass


class FTPServer(Thread):
    def __init__(self, connfd):
        super().__init__()
        self.connfd = connfd
        self.random_code = "123456"

        self.controller = Controller(self.connfd)

    # def verify_code(self):
    #     str_code = ""
    #     for i in range(6):
    #         str_code += str(random.randint(0, 9))
    #     return str_code

    def login_applicant(self, data):
        print(data)
        self.connfd.send(b"Hello")

    # 处理客户端请求
    def run(self):
        # 循环接受请求
        while True:
            data = self.connfd.recv(1024).decode()
            print("Request:", data)
            client_request = data.split(",", 1)
            print(client_request)
            if not data:
                return
            self.client_request[0](client_request[1])

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
