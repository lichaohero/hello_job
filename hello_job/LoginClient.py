from tkinter import *
from socket import *
import sys
import time

ADDR = ('127.0.0.1', 8402)
hj_sock = socket()
hj_sock.connect(ADDR)
root = Tk()
root.title('Hello Job')


class LoginPage(object):
    def __init__(self, master):
        self.window = master
        # 设置标题
        self.window.title('Hello Job')
        # 设置窗口大小
        self.width = 800
        self.height = 600
        self.imagefile = PhotoImage(file=r'backimg.PNG')
        # 用户名输入框
        self.var_usr_name = StringVar()
        # 密码输入框
        self.var_usr_pwd = StringVar()
        # 获取屏幕尺寸以计算布局参数，使窗口居屏幕中央
        # Label(self.window, text='密码', font=("黑体", 15)).place(x=500, y=300)
        self.background_img()
        self.window_postion()
        self.controls_postion()

    def controls_postion(self):

        # 标签 用户名密码
        Label(self.window, text='账号:', font=("黑体", 15)).place(x=250, y=250)
        Label(self.window, text='密码:', font=("黑体", 15)).place(x=250, y=300)

        Entry(self.window, textvariable=self.var_usr_name, font=("黑体", 15)).place(x=330, y=250)
        Entry(self.window, textvariable=self.var_usr_pwd, show='*', font=("黑体", 15)).place(x=330, y=300)
        # 登录 注册按钮
        Button(self.window, text='登录', command=self.user_login, font=("黑体", 15)).place(x=250, y=350)
        Button(self.window, text='注册', command=self.user_register, font=("黑体", 15)).place(x=350, y=350)
        Button(self.window, text="退出", command=self.user_quit, font=("黑体", 15)).place(x=450, y=350)

    def window_postion(self):
        alignstr = '%dx%d+%d+%d' % (
            self.width, self.height, (self.window.winfo_screenwidth() - self.width) / 2,
            (self.window.winfo_screenheight() - self.height) / 2)
        self.window.geometry(alignstr)
        # 设置窗口是否可变长、宽，True：可变，False：不可变
        self.window.resizable(width=False, height=False)

    def background_img(self):
        canvas = Canvas(self.window, height=1000, width=800)
        image = canvas.create_image(0, 0, anchor='nw', image=self.imagefile)
        canvas.pack(side='top')

    def user_login(self):
        user_name = self.var_usr_name.get()
        user_pwd = self.var_usr_pwd.get()
        if not user_name:
            Label(self.window, text='账号不能为空', font=("黑体", 15)).place(x=550, y=250)
        if not user_pwd:
            Label(self.window, text='密码不能为空', font=("黑体", 15)).place(x=550, y=300)
        hj_sock.send(b"login verification,%s,%s" % (user_name.encode(), user_pwd.encode()))


        data = hj_sock.recv(128).decode()
        if data == "账号不存在":
            Label(self.window, text='账号不存在', font=("黑体", 15)).place(x=550, y=250)
        if data == "密码错误":
            Label(self.window, text='密码错误', font=("黑体", 15)).place(x=550, y=300)
        if data == "个人登录":
            pass
        if data == "企业登录":
            pass

    def user_register(self):
        RegisterPage(self.window)

    def user_quit(self):
        self.window.destroy()
        hj_sock.close()

    # def main(self):
    #     mainloop()
    # 进入消息循环


class RegisterPage:
    def __init__(self, master):
        self.window = Toplevel(master)
        self.window.title('Register Account')
        self.width = 800
        self.height = 600
        self.new_user = StringVar()
        self.new_pwd = StringVar()
        self.confirm_pwd = StringVar()
        self.verify_code = StringVar()
        self.createpage()
        self.window_postion()

    def createpage(self):
        # 标签 用户名密码
        Label(self.window, text='(请填写邮箱地址)', font=("黑体", 15)).place(x=550, y=200)
        Label(self.window, text='输入账号:', font=("黑体", 15)).place(x=250, y=200)
        Label(self.window, text='输入密码:', font=("黑体", 15)).place(x=250, y=250)
        Label(self.window, text='确认密码:', font=("黑体", 15)).place(x=250, y=300)
        Label(self.window, text='验证码:', font=("黑体", 15)).place(x=250, y=350)
        Entry(self.window, textvariable=self.new_user, font=("黑体", 15)).place(x=330, y=200)
        Entry(self.window, textvariable=self.new_pwd, show='*', font=("黑体", 15)).place(x=330, y=250)
        Entry(self.window, textvariable=self.confirm_pwd, show='*', font=("黑体", 15)).place(x=330, y=300)
        Entry(self.window, textvariable=self.verify_code, font=("黑体", 15)).place(x=330, y=350)
        Button(self.window, text="获取验证码", command=self.get_code, font=("黑体", 15)).place(x=550, y=350)
        Button(self.window, text="确认", command=self.submit_regist, font=("黑体", 15)).place(x=350, y=450)
        Button(self.window, text="退出", command=self.user_quit, font=("黑体", 15)).place(x=450, y=450)

    def window_postion(self):
        alignstr = '%dx%d+%d+%d' % (
            self.width, self.height, (self.window.winfo_screenwidth() - self.width) / 2,
            (self.window.winfo_screenheight() - self.height) / 2)
        self.window.geometry(alignstr)
        # 设置窗口是否可变长、宽，True：可变，False：不可变
        self.window.resizable(width=False, height=False)

    def get_code(self):
        new_user = self.new_user.get()
        print(new_user)
        hj_sock.send(b"mail_register_code,%s" % (new_user.encode()))

    def submit_regist(self):
        new_user = self.new_user.get()
        new_pwd = self.new_pwd.get()
        verify_code = self.verify_code.get()
        hj_sock.send(b"submit_register,%s,%s,%s" % (new_user.encode(), new_pwd.encode(), verify_code.encode()))

    def judge_regist(self):
        data = hj_sock.recv(1024).decode()
        if data == "name exists":
            Label(self.window, text='姓名已存在', font=("黑体", 20)).place(x=250, y=100)
        if data == "resgist success":
            Label(self.window, text='注册成功', font=("黑体", 20)).place(x=250, y=100)
            time.sleep(5)
            self.window.destroy()


    def user_quit(self):
        self.window.destroy()


LoginPage(root)
root.mainloop()
