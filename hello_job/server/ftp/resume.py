"""
应聘者上传简历
hr下载简历

author:张志强
"""
from hello_job.server.model.resume_model import ResumeServer


def download_user_resume(db, data):
    """
    下载用户简历
    :param connfd: 客户端
    :param db: 数据库
    :param data: 传入数据
    :return: 没有简历 或 简历数据
    """
    redb = ResumeServer(db)
    return redb.resume_download(data["applicant_id"])
