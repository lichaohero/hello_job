"""
应聘者搜职位
author:李超
"""
import json
from decimal import Decimal
from time import sleep

from hello_job.server.model.position_model import PositionModel

db = PositionModel()


def search_position(connfd, data):
    result = db.get_position(data["account"], data["position"], data["salary"], data["enterprise"])
    print(result)
    if not result:
        connfd.send(b'get_position is null')
        return
    connfd.send(b'OK')
    column = ("position", "enterprise", "salary", "duties", "hr")
    list_result = []
    for res in result:
        dict_res = {}
        print(res)
        for i in range(len(res)):
            if i == 2:
                salary = str(res[2])
                dict_res[column[i]] = salary
                continue
            dict_res[column[i]] = res[i]
            print(dict_res)
        list_result.append(dict_res)
    data = {"request_type": "search_position", "data": list_result}
    print(data)
    data_send = json.dumps(data)
    print(data_send)
    sleep(0.1)
    print(data_send.encode())
    connfd.send(data_send.encode())
    sleep(0.1)
    connfd.send(b'##')


def add_position(data):
    print(data["account"])
    hr_info = db.get_hr(data["account"])
    print(hr_info)


if __name__ == '__main__':
    # data = '{"account": "alizhangsan", "postion": "开发工程师", "duties": "负责开发工作","salary": "23000"}'
    # add_position(data)

    res = str(Decimal('6000.00').quantize(Decimal('0.0')))
    print(res)
