import pymysql

class Database:
    def __init__(self,host='localhost',port=3306,user='root',password='',
                 database='AID1911',charset='utf8'):
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

    #查询求职者
    def selectapplicant(self,account,email):
        sql = 'select account,password,mail_addr from applicant' \
              ' where account=%s or mail_addr=%s;'
        self.cur.execute(sql,[account,email])
        result = self.cur.fetchall()
        return result

    def insertapplicant(self,account,password,mail_addr):
        sql = 'insert into applicant(account,password,mail_addr)' \
              ' values(%s,%s,%s);'
        try:
            num = self.cur.execute(sql,[account,password,mail_addr])
            self.db.commit()
            return num
        except:
            self.db.rollback()

    def close(self):
        self.cur.close()
        self.db.close()