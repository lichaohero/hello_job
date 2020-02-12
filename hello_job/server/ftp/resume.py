"""
应聘者上传简历
hr下载简历

author:张志强
"""
from hello_job.server.model.resume_model import ResumeServer


def upload_user_resume(db, data):
    """
    上传用户简历
    :param db: 数据库
    :param data: 传入数据
    :return: 简历保存路径或回复失败
    """
    redb = ResumeServer(db)
    return redb.resume_upload(data["resume"], data["account"])


def download_user_resume(db, data):
    """
    下载用户简历
    :param connfd: 客户端
    :param db: 数据库
    :param data: 传入数据
    :return: 用户简历或简历不存在信息
    """
    redb = ResumeServer(db)
    return redb.resume_download(data["applicant_id"])
