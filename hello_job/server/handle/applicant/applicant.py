"""
handle总文件，写好的方法要汇总到这里面，server直接调这个文件
"""
from hello_job.server.model.applicant_model import UserModel

usrdb = UserModel()


def complete_user_information(connfd, data):
    """
    完善用户信息
    :param connfd: 客户端
    :param data: 用户信息包
    :return: None
    """
    result = usrdb.update_user_information(data["name"], data["salary"], data["position"], data["resume"])
    if result == "name updates has succeeded":
        connfd.send(b"name_ok")
    else:
        connfd.send(b"name_error %s" % result)
    if result == "salary updates has succeeded":
        connfd.send(b"salary_ok")
    else:
        connfd.send(b"salary_error %s" % result)
    if result == "position updates has succeeded":
        connfd.send(b"position_ok")
    else:
        connfd.send(b"position_error %s" % result)
    if result == "resume updates has succeeded":
        connfd.send(b"resume_ok")
    else:
        connfd.send(b"resume_error %s" % result)
