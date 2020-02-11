class ResumeServer:

    def __init__(self, db):
        self.db = db
        self.cur = self.db.cursor()

    def close(self):
        self.cur.close()
        self.db.close()

    def resume_processing(self, data):
        pass

    def resume_path_information(self, data):
        pass