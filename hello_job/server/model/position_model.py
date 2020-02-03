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

    def get_position(self, account, position, salary, enterprise):
        if not position and not salary and not enterprise:
            sql = "select wanted_position from applicant where account='%s';" % account
            self.cur.execute(sql)
            result = self.cur.fetchone()
            sql = "select * from position where name like '%s';" % result
            print(sql)
            self.cur.execute(sql)
            return self.cur.fetchall()

        sql = "select position.name,position.month_pay,position.content,enterprise.enterprise_name,hr.name from position " \
              "inner join enterprise on position.enterprise_id=enterprise.id " \
              "inner join hr on position.hr_id = hr.id where 1=1"
        if position:
            sql += " and position.name regexp '%s'" % (r'.*' + position + '.*')
        if salary:
            min_s, max_s = salary.split("-")
            sql += " and position.month_pay between %s and %s" % (min_s, max_s)
        if enterprise:
            sql += " and enterprise.enterprise_name regexp '%s'" % (r'.*' + enterprise + '.*')
        print(sql)
        self.cur.execute(sql)
        return self.cur.fetchall()


if __name__ == '__main__':
    model = PositionModel()
    print(model.get_position("刘强", None, "0-20000", "里巴巴"))
