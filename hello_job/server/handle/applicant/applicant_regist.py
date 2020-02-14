"""
应聘者注册登录注销
author:张志强
"""
from hello_job.server.model.applicant_model import UserModel, UserRegistModel

regist = UserRegistModel()


def verify_user_login_information(connfd, db, data):
    """
    验证登录账号密码正确性，发送对应字节码
    :param connfd: 客户端
    :param db: 数据库
    :param data: 用户信息包
    :return: None
    """
    umd = UserModel(db)
    msg = umd.user_information_judgment(data["name"], data["passwd"])
    if msg == "No account":
        connfd.send(b"user_not_exist")  # 账号不存在
        return
    elif msg == "Password wrong":
        connfd.send(b"password_error")  # 密码错误
        return
    elif msg == "Right":
        connfd.send(b"password_right")  # 审核通过
        return


def complete_user_information(connfd, db, data):
    """
    完善用户信息，发送对应成败字节码
    :param connfd: 客户端
    :param db: 数据库
    :param data: 用户信息包
    :return: None
    """
    usrdb = UserModel(db)
    result = usrdb.update_user_information(data["account"], data["name"], data["salary"], data["position"],
                                           data["resume"])
    if result:
        connfd.send(b"Mission_Completed")
        return
    else:
        connfd.send(b"Mission_failed")
        return


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
