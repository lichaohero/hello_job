import pymysql


class UserModel:
    def __init__(self):
        self.db = pymysql.connect(host='localhost',
                                  port=3306,
                                  user='root',
                                  password='Tvxq5forever',
                                  database='recruit',
                                  charset='utf8')

        self.cur = self.db.cursor()

    def close(self):
        self.cur.close()
        self.db.close()

    # def regist(self, name, passwd):
    #     sql = "select * from applicant where name='%s';" % name
    #     self.cur.execute(sql)
    #     if self.cur.fetchone():
    #         return False
    #     sql = 'insert into applicant (name,passwd) values (%s,%s);'
    #     try:
    #         self.cur.execute(sql, [name, passwd])
    #         self.db.commit()
    #         return True
    #     except:
    #         self.db.rollback()
    #         return False
    #
    # def login(self, name, passwd):
    #     sql = "select * from applicant where name='%s' and password='%s';" % (name, passwd)
    #     self.cur.execute(sql)
    #     if self.cur.fetchone():
    #         sql = "update applicant set login_time=now() where name='%s';" % name
    #         return True
    #     sql = "select * from enterprise where name='%s' and hr_password='%s';" % (name, passwd)
    #     self.cur.execute(sql)
    #     if self.cur.fetchone():
    #         sql = "update * from "
    #         return True
    #
    #     else:
    #         return False

    def user_information_judgment(self, name, passwd):
        """
        判断用户信息是否正确，返回对应字符串辅以判断
        :Author: ZhiQiang
        :param name: 用户名
        :param passwd: 密码
        :return: 对应判断字符串
        """
        sql_name = "select name from applicant where name=%s"
        sql_passwd = "select password from applicant where name=%s"
        self.cur.execute(sql_name, [name])
        if not self.cur.fetchone():
            return "No account"
        else:
            self.cur.execute(sql_passwd, [name])
            if self.cur.fetchone()[0] != passwd:
                return "Password wrong"
            else:
                return "Right"