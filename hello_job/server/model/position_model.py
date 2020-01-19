import pymysql


class PositionModel:
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

    def get_position(self, name,position, salary, enterprise):
        if not position and not salary and not enterprise:
            sql = "select wanted_position from applicant where name='%s';"%name
            self.cur.execute(sql)
            result = self.cur.fetchone()
            sql = "select * from position where name like '%s';"%result
            print(sql)
            self.cur.execute(sql)
            return self.cur.fetchall()

        sql = "select * from position where 1=1"
        if position:
            sql += " and name='%s'" % position
        if salary:
            sql += " and salary = '%s'" % salary
        if enterprise:
            sql += " and enterprise='%s'" % enterprise
        print(sql)
        self.cur.execute(sql)
        return self.cur.fetchall()
