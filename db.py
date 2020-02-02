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

    #根据账号密码查询hr
    def selecthrcount(self,account,password):
        sql = 'select count(1) from hr' \
              ' where hr_account=%s or hr_password=%s;'
        self.cur.execute(sql,[account,password])
        result = self.cur.fetchall()
        return result

    #查询applicant能否登录
    def selectappcount(self,account,password):
        sql = 'select count(1) from applicant' \
              ' where account=%s or password=%s;'
        self.cur.execute(sql,[account,password])
        result = self.cur.fetchall()
        return result

    #根据账号查询求职者
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
    # 根据职位id查询hr
    def selecthrbyid(self,id):
        sql = 'select hr_account from hr where id = ' \
              '(select hr_id from position where id = %d);'
        self.cur.execute(sql,[id])
        result = self.cur.fetchone()
        return result

    # 根据职位id查询求职者,
    def selectapp(self,id):
        sql = 'select account from applicant where id = ' \
              '(select app_id from position where id = %d);'
        self.cur.execute(sql,[id])
        result = self.cur.fetchall()
        return result

    def selallapps(self):
        sql = 'select account from applicant;'
        self.cur.execute(sql)
        return self.cur.fetchall()

    def selectallhrs(self):
        sql = 'select hr_account from hr;'
        self.cur.execute(sql)
        return self.cur.fetchall()

    # 将离线消息添加到消息记录表
    def insertchatrecord(self,from_account,to_account,content,isofflinemsg):
        sql = 'insert into chat_record(from_account,to_account,' \
              'content,isofflinemsg) values(%s,%s,%s,%s);'
        try:
            num = self.cur.execute(sql,[from_account,to_account,content,isofflinemsg])
            self.db.commit()
            return num
        except Exception as e:
            print(e)
            self.db.rollback()

    #查询消息记录
    def selectchatrecord(self,from_account,to_account):
        sql = 'select content,from_account,to_account,isofflinemsg from ' \
              'chat_record where (from_account = %s and to_account = %s) ' \
              'or (from_account = %s and to_account = %s) and send_time < now();'
        try:
            self.cur.execute(sql,[from_account,to_account,to_account,from_account])
            result = self.cur.fetchall()
            return result
        except Exception as e:
            print(e)

    #登录后修改离线消息为在线消息
    def updatechatrecord(self,to_account):
        sql = 'update chat_record set isofflinemsg=1 ' \
              'where to_account=%s and isofflinemsg=0;'
        try:
            self.cur.execute(sql,[to_account])
            self.db.commit()
        except Exception as e:
            print(e)
            self.db.rollback()

    def close(self):
        self.cur.close()
        self.db.close()