"""
应聘者搜职位
author:李超
"""
from time import sleep

from hello_job.server.model.position_model import PositionModel

db = PositionModel()


def get_position(connfd, data):

    result = db.get_position(data["name"], data["position"], data["salary"], data["enterprise"])
    print(result)
    if not result:
        connfd.send(b'get_position is null')
        return
    connfd.send(b'OK')
    for res in result:
        sleep(0.1)
        connfd.send(res.encode())
    sleep(0.1)
    connfd.send(b'##')

# get_position("刘强",'试',5000,"里巴巴")
