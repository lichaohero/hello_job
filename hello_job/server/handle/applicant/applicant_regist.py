"""
应聘者注册登录注销
author:张志强
"""
from hello_job.server.model.applicant_model import UserModel, UserRegistModel

umd = UserModel()
regist = UserRegistModel()


def verify_user_login_information(connfd, name, passwd):
    """
    验证登录账号密码正确性，发送对应字节码
    :Author: ZhiQiang
    :param name: 用户姓名
    :param passwd: 用户密码
    :return: None
    """
    data = umd.user_information_judgment(name, passwd)
    if data == "No account":
        connfd.send(b"user not exist")  # 账号不存在
    elif data == "Password wrong":
        connfd.send(b"password error")  # 密码错误
    elif data == "Right":
        connfd.send(b"check pass")  # 审核通过

    # 验证求职者能否注册
def register(connfd, data):
    datalist = data.split(',')
    print("datalist[3]:", datalist[3])
    vali_result = regist.selectapplicant(datalist[1], datalist[3])
    print("vali_result：", vali_result)
    if vali_result:
        if vali_result[0][0] == datalist[1]:
            connfd.send('user already exists'.encode())
            return
        if vali_result[0][2] == datalist[3]:
            connfd.send('email already exists'.encode())
            return
    num = regist.insertapplicant(datalist[1], datalist[2], datalist[3])
    return num
