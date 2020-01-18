class Controller:
    def __init__(self, connfd):
        self.connfd = connfd

    def login_applicant(self, data):
        print(data)
        self.connfd.send(b"Hello")

    # def mail_register_code(self, data):
    #     self.random_code = self.verify_code()
    #     print(self.random_code)
    #     MailCode(client_request[1], self.random_code).mail_task()
    #
    # def submit_register(self, data):
    #     if self.random_code == client_request[3]:
    #         # Mysql储存client_request账号(邮箱地址)  孙国建
    #         self.connfd.send("register_success".encode())
    #     else:
    #         self.connfd.send("验证码错误".encode())
    #
    # def search_position(self, data):
    #     get_position(client_request)
