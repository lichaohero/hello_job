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

    def get_position(self, position, salary, enterprise):
        sql = "select * from position where 1=1"
        if not position:
            sql += "and position='%s'" % position
        if not salary:
            sql += "and salary = '%s'" % salary
        if not enterprise:
            sql += "and enterprise='%s'" % enterprise
