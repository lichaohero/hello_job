import pymysql


class UserModel:
    def __init__(self, db):
        self.db = db
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
        :param name: 用户名
        :param passwd: 密码
        :return: 对应判断字符串
        """
        sql_name = "select name from applicant where name=%s;"
        sql_passwd = "select password from applicant where name=%s;"
        self.cur.execute(sql_name, [name])
        if not self.cur.fetchone():
            return "No account"
        else:
            self.cur.execute(sql_passwd, [name])
            if self.cur.fetchone()[0] != passwd:
                return "Password wrong"
            else:
                return "Right"

    def update_user_information(self, account, name, salary, position):
        """
        更新用户信息，用于完善
        :param name: 用户名
        :param salary: 期望工资
        :param position: 期望岗位
        :param resume: 个人简历
        :return: True or False
        """
        updateInfo = "update applicant set name=%s,wanted_position=%s,wanted_salary=%s where account=%s;"
        try:
            self.cur.execute(updateInfo, [name, position, salary, account])
            self.db.commit()
            return True
        except:
            self.db.rollback()
            return False


class UserRegistModel:
    def __init__(self, host='localhost', port=3306, user='root', password='',
                 database='AID1911', charset='utf8'):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.database = database
        self.charset = charset
        # 连接数据库
        self.db = pymysql.connect(host='localhost',
                                  port=3306,
                                  user='root',
                                  password='',
                                  database='AID1911',
                                  charset='utf8')
        # 生成游标对象（操作数据库，执行sql语句，获取结果）
        self.cur = self.db.cursor()

    # 查询求职者
    def selectapplicant(self, account, email):
        sql = 'select account,password,mail_addr from applicant' \
              ' where account=%s or mail_addr=%s;'
        self.cur.execute(sql, [account, email])
        result = self.cur.fetchall()
        return result

    def insertapplicant(self, account, password, mail_addr):
        sql = 'insert into applicant(account,password,mail_addr)' \
              ' values(%s,%s,%s);'
        try:
            num = self.cur.execute(sql, [account, password, mail_addr])
            self.db.commit()
            return num
        except:
            self.db.rollback()

    def close(self):
        self.cur.close()
        self.db.close()
