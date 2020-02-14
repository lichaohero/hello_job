class ResumeServer:

    def __init__(self, db):
        self.db = db
        self.cur = self.db.cursor()

    def close(self):
        self.cur.close()
        self.db.close()

    def resume_download(self, userId):
        """
        对简历下载的操作
        :param data: 客户端的用户简历
        :return: 用户简历字符串 或 不存在
        """
        pathSql = "select resume_path from applicant where id=%s;"
        self.cur.execute(pathSql, [userId])
        resumePath = self.cur.fetchone()
        if not resumePath:
            return "Nothing_here"
        else:
            Path = resumePath[-1]
            file = open(Path, "rb")
            data = file.read()
            file.close()
            return data.decode()
