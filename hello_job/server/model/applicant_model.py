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

    def regist(self, name, passwd):
        sql = "select * from applicant where name='%s';" % name
        self.cur.execute(sql)
        if self.cur.fetchone():
            return False
        sql = 'insert into applicant (name,passwd) values (%s,%s);'
        try:
            self.cur.execute(sql, [name, passwd])
            self.db.commit()
            return True
        except:
            self.db.rollback()
            return False


    def login(self,name,passwd):
        sql = "select * from applicant where name='%s' and password='%s';" % (name,passwd)
        self.cur.execute(sql)
        if self.cur.fetchone():
            sql = "update applicant set login_time=now() where name='%s';"%name
            return True
        sql = "select * from enterprise where name='%s' and hr_password='%s';" % (name,passwd)
        self.cur.execute(sql)
        if self.cur.fetchone():
            sql = "update * from "
            return True

        else:
            return False