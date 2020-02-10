"""
hr搜索应聘者，返回应聘者列表，搜索
author:曹海伟
查询sql在applicant_model.py里面写
"""
import json
from time import sleep

import pymysql

from hello_job.config import *
from hello_job.server.model.search_applicant_model import SearchApplicant

db = pymysql.connect(host=mysql_host,
                     port=mysql_port,
                     user=mysql_user,
                     password=mysql_password,
                     database=mysql_database,
                     charset="utf8")


def search_applicant(connfd, data):
    db_ = SearchApplicant(db)
    result = db_.search_applicant(data["wanted_position"], data["wanted_salary"])
    if not result:
        connfd.send(b'get_applicant_failed')
        return
    connfd.send(b'get_applicant_success')
    column = ("name", "account", "wanted_position", "wanted_salary")
    result_list = []
    for res in result:
        dict_res = {}
        for i in range(len(result)):
            if i == 2:
                salary = str(res[2])
                dict_res[column[i]] = salary
                continue
            dict_res[column[i]] = res[i]
        result_list.append(dict_res)
    data = {"request_type": "get_applicant", "data": result_list}
    print(data)
    data_send = json.dumps(data)
    print(data_send)
    sleep(0.1)
    print(data_send.encode())
    connfd.send(data_send.encode())
