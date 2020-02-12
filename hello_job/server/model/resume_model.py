class ResumeServer:

    def __init__(self, db):
        self.db = db
        self.cur = self.db.cursor()
        self.FTP = "/Users/zhiqiang/Desktop/FTP_store/"  # FTP文件库位置

    def close(self):
        self.cur.close()
        self.db.close()

    def write_file(self, data, account):
        """
        文件写入操作
        :param data: 简历数据
        :param account: 用户账号
        :return: 简历存储路径
        """
        file = open(self.FTP + account, "wb")
        file.write(data)
        file.close()
        return self.FTP + account

    def resume_upload(self, data, account):
        """
        对简历上传的操作
        :param data: 客户端的用户简历
        :param account: 用户账号
        :return: 简历存储路径 或 对应错误信息
        """
        filePath = self.write_file(data, account)
        pathSql = "update applicant set resume_path=%s where account=%s;"
        try:
            self.cur.execute(pathSql, [filePath, account])
            self.db.commit()
            return filePath
        except Exception as e:
            self.db.rollback()
            return e

    def resume_download(self, userId):
        """
        对简历下载的操作
        :param data: 客户端的用户简历
        :return: 用户简历 或 不存在
        """
        pathSql = "select resume_path from applicant where id=%s;"
        self.cur.execute(pathSql, [userId])
        resumePath = self.cur.fetchone()
        if not resumePath:
            return "Nothing_here"
        else:
            file = open(resumePath, "rb")
            data = file.read()
            file.close()
            return data
