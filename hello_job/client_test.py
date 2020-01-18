from socket import *

connfd = socket()
connfd.connect(('127.0.0.1', 8402))

connfd.send("login_applicant,lichao".encode())
data = connfd.recv(1024).decode()
print(data)
