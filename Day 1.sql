create database ineuron

create database ineuron_test

show databases
 
use ineuron
 
SET SQL_SAFE_UPDATES = 0;

create table CUST_DETAILS (
cust_name varchar(25),
cust_id int, 
gender varchar(1),
geography varchar(10),
churn int
 )

select *  from CUST_DETAILS
 
 INSERT INTO CUST_DETAILS VALUES ('Satyajit', 1, 'M', 'Odisha', 0);
 INSERT INTO CUST_DETAILS VALUES ('Rani', 2, 'F', 'MP', 0);
 INSERT INTO CUST_DETAILS VALUES ('Hema', 3, 'F', 'UP', 1);
 INSERT INTO CUST_DETAILS VALUES ('Raj', 4, 'M', 'AP', 0);
 INSERT INTO CUST_DETAILS VALUES ('Kumar', 5, 'M', 'Karnataka', 1);
 
 
 INSERT INTO CUST_DETAILS VALUES ('Shanti', 5, 'F', 'Delhi', 0);
 INSERT INTO CUST_DETAILS VALUES ('Soma', 5, 'F', 'Jammu', 1);
 
create table CUST_DETAILS_PK (
cust_name varchar(25),
cust_id int NOT NULL, 
gender varchar(1),
geography varchar(10),
churn int,
primary key (cust_id)
 )

select * from cust_details_pk

INSERT INTO CUST_DETAILS_PK VALUES ('Satyajit', 1, 'M', 'Odisha', 0);
 INSERT INTO CUST_DETAILS_PK VALUES ('Rani', 2, 'F', 'MP', 0);
 INSERT INTO CUST_DETAILS_PK VALUES ('Hema', 3, 'F', 'UP', 1);
 INSERT INTO CUST_DETAILS_PK VALUES ('Raj', 4, 'M', 'AP', 0);
 INSERT INTO CUST_DETAILS_PK VALUES ('Kumar', 5, 'M', 'Karnataka', 1);
 
 INSERT INTO CUST_DETAILS_PK VALUES ('Shanti', 5, 'F', 'Delhi', 0);
 INSERT INTO CUST_DETAILS_PK VALUES ('Sapna', 5, 'F', 'Jammu', 1);


select * from dep

create table dep (
 depid int not null,
 depname varchar(100),
 depaddress varchar(255),
 PRIMARY KEY (depid))
 
 
 create table emp (
 empid int NOT NULL,
 empname varchar(100),
 empadd varchar(255),
 depid int,
 PRIMARY KEY (empid),
 )
 
 
 FOREIGN KEY (depid) REFERENCES dep(depid)
 
 
 
 
 select * from dep
 
 select * from emp
 
 INSERT INTO dep VALUES (1, 'CSE', 'Something');
 INSERT INTO dep VALUES (2, 'MECH', 'Something');
 INSERT INTO dep VALUES (3, 'EEE', 'Something');
 INSERT INTO dep VALUES (4, 'CIVIL', 'Something');
 
 
 
 INSERT INTO emp VALUES (92701, 'Satyajit', 'Something', 1)
 
 
 
 INSERT INTO CUST_DETAILS VALUES ('Akshay', 6, 'M', 'Odisha', 0);
 INSERT INTO CUST_DETAILS VALUES ('Shikhar', 7, 'M', 'MP', 0);
 INSERT INTO CUST_DETAILS VALUES ('Pritesh', 8, 'M', 'UP', 1);
 INSERT INTO CUST_DETAILS VALUES ('Nithyashree', 9, 'F', 'AP', 0);
 INSERT INTO CUST_DETAILS VALUES ('Rahul', 10, 'M', 'Karnataka', 1);
 
 
 
 
 5--> 4/5


select *  from CUST_DETAILS where cust_id > 3 and gender = 'F'

select *  from CUST_DETAILS where cust_name like 'A%a'

create table empinfo
(
firstname varchar(10),
lastname varchar(10),
id int,
age int,
city varchar(20),
state varchar(20), 
primary Key(id));

select * from empinfo


INSERT into empinfo values('John','Jones',99980,45,'Payson','Arizona');
INSERT into empinfo values('Mary','Jones',99982,25,'Payson','Arizona');
INSERT into empinfo values('Eric','Edwards',88232,32,'San Diego','California');
INSERT into empinfo values('Mary Ann','Edwards',88233,32,'Phoenix','Arizona');
INSERT into empinfo values('Ginger','Howell',98002,42,'Cottonwood','Arizona');
INSERT into empinfo values('Sebastian','Smith',92001,23,'Gila Bend','Arizona');
INSERT into empinfo values('Gus','Gray',22332,35,'Bagdad','Arizona');
INSERT into empinfo values('Mary Ann','May',32326,52,'Tucson','Arizona');
INSERT into empinfo values('Erica','Williams',32327,60,'Showlow','Arizona');
INSERT into empinfo values('Leroy','Brown',32380,22,'Pine Top','Arizona');
INSERT into empinfo values('Elroy','Cleaver',32382,22,'Globe','Arizona');

select firstname as FN, lastname as LN, AGE as a from empinfo emp WHERE emp.AGE > 30;

select firstname as FN, lastname as LN, AGE as a from empinfo emp WHERE emp.AGE > 30;