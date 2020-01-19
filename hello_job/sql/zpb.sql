create database recruit charset ='utf8';
--公司表
create table enterprise
(   id                 int primary key auto_increment,
    enterprise_name    varchar(128),
    address            varchar(256),
    introduction       text
);

--hr表
create table hr
(   id              int primary key auto_increment,
    name            varchar(30),
    enterprise_id   int,
    hr_password     varchar(20),
    hr_account      varchar(20),
    mail_addr       varchar(128),
    login_time      datetime,
    logout_time     datetime
);

--职位
create table position
(   id              int primary key auto_increment,
    name            varchar(30),
    month_pay       decimal(8,2),
    content         text,
    hr_id           int,
    enterprise_id   int
);

--求职者
create table applicant
(   id              int primary key auto_increment,
    name            varchar(30),
    mail_addr       varchar(30),
    password        varchar(20),
    account         varchar(20),
    login_time      datetime,
    logout_time     datetime
);


--聊天室管理表chat
create table chat
(   id              int primary key auto_increment,
    position_id     int,
    applicant_id    int,
    hr_id           int
);
--聊天记录
create table chat_record
(   id              int primary key auto_increment,
    char_id         int,
    hr_id           int,
    applicant_id    int,
    type            enum('hr','applicant'),
    content         text
);

