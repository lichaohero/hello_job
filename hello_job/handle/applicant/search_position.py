"""
应聘者搜职位
author:李超
"""
import sqlite3
from time import sleep

from hello_job.model.position_model import PositionModel

db = PositionModel()


def get_position(connfd, position, salary, enterprise):
    result = db.get_position(position, salary, enterprise)
    if not result:
        connfd.send(b'FAIL')
        return
    connfd.send(b'OK')
    for res in result:
        sleep(0.1)
        connfd.send(res.encode())
    sleep(0.1)
    connfd.send(b'##')
