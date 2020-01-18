insert into `enterprise` (enterprise_name, address, introduction)
values
('阿里巴巴（中国）有限公司','杭州余杭区阿里巴巴西溪园区','牛逼的公司'),
('腾讯科技（深圳）有限公司','深圳南山区腾讯大厦','牛逼的公司'),
('百度在线网络技术（北京）有限公司','北京海淀区百度科技园','牛逼的公司'),
('北京滴滴无限科技发展有限公司','北京市海淀区未名视通研发楼','牛逼的公司'),
('华为技术有限公司','杭州滨江区华为科技有限公司杭州研究所','牛逼的公司'),
('北京小米移动软件有限公司','北京海淀区小米移动互联网产业园','牛逼的公司');

                                                            --退出时间   --登录时间
insert into `hr` (name,enterprise_id,hr_password,hr_account,mail_addr,login_time,logout_time)
values
('张三',1,'123456','alizhangsan','123@qq.com',now(),now()),
('李四',2,'234567','tengxunlisi','456@qq.com',now(),now()),
('王五',3,'345678','baiduwangwu','789@qq.com',now(),now()),
('孙六',4,'456789','didisunliu','asv@qq.com',now(),now()),
('赵七',5,'567891','huweizhaoqi','rfv@qq.com',now(),now()),
('吴八',6,'678911','xiaomiwuba','fds@qq.com',now(),now());


insert into `position` (name,month_pay,content,hr_id,enterprise_id)
values
('程序员',12000,'好好工作,天天向上',1,1),
('架构师',20000,'好好工作,天天向上',1,1),
('秘书',8000,'好好工作,天天向上',1,1),
('测试员',6000,'好好工作,天天向上',1,1);


insert into `applicant` (name,mail_addr,password,account,login_time,logout_time)
values
('张晓','111@163.com','1234561','qzzhangxiao',now(),now()),
('刘强','222@163.com','234567','qzliuqian',now(),now()),
('付超','333@qq.com','345678','qzfuchao',now(),now()),
('尹婷','444@qq.com','456789','qzyinting',now(),now()),
('何丽','555@qq.com','567891','qzheli',now(),now()),
('严蓉','666@qq.com','678911','qzyanrong',now(),now()),
('王俊文','777@163.com','789112','qzwangjunwen',now(),now());


insert into `chat_record` (chat_id,hr_id,applicant_id,type,content)
values
()
()
()
()
()