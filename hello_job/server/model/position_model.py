import pymysql

db = pymysql.connect(host='localhost',
                     port=3306,
                     user='root',
                     password='Tvxq5forever',
                     database='recruit',
                     charset='utf8')

cur = db.cursor()


class PositionModel:

    def close(self):
        self.cur.close()
        self.db.close()

    def get_position(self, name, position, salary, enterprise):
        if not position and not salary and not enterprise:
            sql = "select wanted_position from applicant where name='%s';" % name
            self.cur.execute(sql)
            result = self.cur.fetchone()
            sql = "select * from position where name like '%s';" % result
            print(sql)
            cur.execute(sql)
            return cur.fetchall()

        sql = "select position.name,position.month_pay,position.content,enterprise.enterprise_name,hr.name from position " \
              "inner join enterprise on position.enterprise_id=enterprise.id " \
              "inner join hr on position.hr_id = hr.id where 1=1"
        if position:
            sql += " and position.name regexp '%s'" % (r'.*' + position + '.*')
        if salary:
            sql += " and position.month_pay >= %s" % salary
        if enterprise:
            sql += " and enterprise.enterprise_name regexp '%s'" % (r'.*' + enterprise + '.*')
        print(sql)
        cur.execute(sql)
        return cur.fetchall()
