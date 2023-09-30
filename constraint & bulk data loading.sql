create database dress_data;

use dress_data;

create table if not exists dress(`Dress_ID` varchar(30),
`Style` varchar(30),
`Price` varchar(30),
`Rating` varchar(30),
`Size` varchar(30),
`Season` varchar(30),
`Neckline` varchar(30),
`Sleevelength`  varchar(30),
`waiseline` varchar(30),
`Material` varchar(30),
`FabricType` varchar(30),
`Decoration` varchar(30),
`Pattern Type` varchar(30),
`Recommendation` varchar(30));

select * from dress;

LOAD DATA INFILE 
'D:\AttributeDataSet.csv'
into table dress
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from dress;

create table test(
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

select * from test;

insert into test values(1,'prashant','prashantk065@gmail.com','bihar'),
(2,'chirag','chirag@gmail.com','bihar'),
(3,'chitransh','chitransh@gmail.com','bihar'),
(4,'rakesh','rakesh@gmail.com','bihar'),
(5,'kishan','kishan@gmail.com','bihar');

create table test2(
test_id int auto_increment,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
primary key (test_id));

insert into test2(test_name,test_mailid,test_address) values('prashant','prashantk065@gmail.com','bihar'),
('chirag','chirag@gmail.com','bihar'),
('chitransh','chitransh@gmail.com','bihar'),
('rakesh','rakesh@gmail.com','bihar'),
('kishan','kishan@gmail.com','bihar');

select * from test2;

create table test3(
test_id int,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30),
test_salary int check(test_salary>10000));

insert into test3 values(1,'prashant','prashantk065@gmail.com','bihar',15000),
(2,'chirag','chirag@gmail.com','bihar',100000),
(3,'chitransh','chitransh@gmail.com','bihar',11000),
(4,'rakesh','rakesh@gmail.com','bihar',12000),
(5,'kishan','kishan@gmail.com','bihar',13000);

select * from test3;

create table test4(
test_id int,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30) check(test_address='Bengalore'),
test_salary int check(test_salary>10000));

insert into test4 values(1,'prashant','prashantk065@gmail.com','Bengalore',15000),
(2,'chirag','chirag@gmail.com','Bengalore',20000),
(3,'chitransh','chitransh@gmail.com','Bengalore',11000),
(4,'rakesh','rakesh@gmail.com','Bengalore',12000),
(5,'kishan','kishan@gmail.com','Bengalore',13000);

alter table test4 add check(test_id >0);

insert into test4 values(-1,'prashant','prashantk065@gmail.com','Bengalore',15000),
(2,'chirag','chirag@gmail.com','Bengalore',20000),
(3,'chitransh','chitransh@gmail.com','Bengalore',11000),
(4,'rakesh','rakesh@gmail.com','Bengalore',12000),
(5,'kishan','kishan@gmail.com','Bengalore',13000);

create table test5(
test_id int NOT NULL,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30) check(test_address='Bengalore'),
test_salary int check(test_salary>10000));

insert into test5 (test_name,test_mailid,test_address,test_salary) values ('prashant','prashantk065@gmail.com','Bengalore',15000);

create table test6(
test_id int NOT NULL default 0,
test_name varchar(30),
test_mailid varchar(30),
test_address varchar(30) check(test_address='Bengalore'),
test_salary int check(test_salary>10000));

insert into test6 (test_name,test_mailid,test_address,test_salary) values ('prashant','prashantk065@gmail.com','Bengalore',15000);

select * from test6;

create table test7(
test_id int NOT NULL default 0,
test_name varchar(30),
test_mailid varchar(30) unique,
test_address varchar(30) check(test_address='Bengalore'),
test_salary int check(test_salary>10000));

insert into test7 (test_name,test_mailid,test_address,test_salary) values ('prashant','prashantk065@gmail.com','Bengalore',15000);




