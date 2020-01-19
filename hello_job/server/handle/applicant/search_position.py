"""
应聘者搜职位
author:李超
"""

from hello_job.server.model.position_model import PositionModel

db = PositionModel()


def get_position(name,position, salary, enterprise):
    result = db.get_position(name,position, salary, enterprise)
    print(result)
    # if not result:
    #     connfd.send(b'FAIL')
    #     return
    # connfd.send(b'OK')
    # for res in result:
    #     sleep(0.1)
    #     connfd.send(res.encode())
    # sleep(0.1)
    # connfd.send(b'##')

get_position("刘强",'测试员',None,None)