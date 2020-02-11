class SearchApplicant:
    def __init__(self, db):
        self.db = db
        self.cur = self.db.cursor()

    def search_applicant(self, wanted_position, wanted_salary):
        sql = "select name,account,wanted_position,wanted_salary from applicant where 1=1"
        if wanted_position:
            sql += "and wanted_position regexp '%s'" % (r'.*' + wanted_position + '.*')
        if wanted_salary:
            min_salary, max_salary = wanted_salary.split("-")
            sql += "and wanted_salary between '%s' and %s" % (min_salary, max_salary)

        self.cur.execute(sql)
        return self.cur.fetchall()
