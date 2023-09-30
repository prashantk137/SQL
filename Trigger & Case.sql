create database ineuron;

use ineuron;

create table course2(
course_id int,
course_desc varchar(50),
course_mentor varchar(60),
course_price int ,
course_discount int,
create_date date,
user_info varchar(50));

create table course_update(
course_metor_update varchar(50),
course_price_update int ,
course_discount_update int);

delimiter $$
create trigger course_before_insert12
before insert 
on course2 for each row
begin
declare user_val varchar(50);
/*select user()into course;*/
set new.create_date=sysdate();
select user() into user_val;
set new.user_info=user_val;
end;$$

select * from course2;
select user();
insert into course2 (course_id,course_desc,course_mentor,course_price,course_discount)value(101,"FSDA","sudhanshu",4000,10);

create table ref_course(
record_insert_date date,
record_insert_user varchar(50)
);

select * from ref_course;

delimiter $$
create trigger course_before_insert1123
before insert 
on course2 for each row
begin
declare user_val varchar(50);
set new.create_date=sysdate();
select user() into user_val;
set new.user_info=user_val;
insert into ref_course values(sysdate(),user_val);
end;$$

create table test1(
c1 varchar(50),
c2 date,
c3 int);

create table test2(
c1 varchar(50),
c2 date,
c3 int);

create table test3(
c1 varchar(50),
c2 date,
c3 int);

delimiter $$
create trigger to_update_others
before insert
on test1 for each row
begin
insert into test2 values('xyz',sysdate(),12345);
insert into test3 values('xyz',sysdate(),67890);
end;$$
insert into test1 values('kumar',sysdate(),12345);
select * from test1;
select * from test2;
select * from test3;

delimiter $$
create trigger to_update_others_table
after insert
on test1 for each row
begin
update test2 set c1='abc' where c1='xyz';
delete from test3 where c1='xyz';
end;$$
insert into test1 values('chirag',sysdate(),12345);

delimiter $$
create trigger to_delete_others_tabele
after delete on test1 for each row
begin 
insert into test3 values('after delete',sysdate(),2434636);
end;$$
delete from test1 where c1='Prashant';

delimiter $$
create trigger to_delete_others_tabeles
before delete on test1 for each row
begin 
insert into test3 values('before delete',sysdate(),2434636);
end;$$
delete from test1 where c1='kumar';

delimiter $$
create trigger to_delete_others_tabeles_observation2
before delete on test1 for each row
begin 
insert into test2(c1,c2,c3) values(old.c1,old.c2,old.c3);
end;$$

create table test11(
c1 varchar(50),
c2 date,
c3 int);

create table test12(
c1 varchar(50),
c2 date,
c3 int );

create table test13(
c1 varchar(50),
c2 date,
c3 int );

delimiter $$
create trigger to_delete_others_tabeles_observation4
before delete on test11 for each row
begin 
insert into test12(c1,c2,c3) values(old.c1,old.c2,old.c3);
end;$$

insert into test11 values('Chirag',sysdate(),12345);

delete from test11 where c1='sudh';

select * from test11;
select * from test12;
select * from test13;

delimiter $$
create trigger to_delete_others_tabeles_observation5
after delete on test11 for each row
begin 
insert into test12(c1,c2,c3) values(old.c1,old.c2,old.c3);
end;$$
delete from test11 where c1='Chirag';

delimiter //
create trigger to_upate_others
after update on test11 for each row 
begin
	insert into test12(c1,c2,c3) values(old.c1, old.c2,old.c3);
end; //

insert into test11 values('Chitransh',sysdate(),23547);

update test11 set c1 = "after update" where c1 = "Chitransh";

delimiter //
create trigger to_upate_others_before
before update on test11 for each row 
begin
	insert into test13(c1,c2,c3) values(new.c1, new.c2,new.c3);
end; //

update test11 set c1 = "insert new" where c1 = "Prashant";

/* CASE */

use ineuron_partion;

SELECT * FROM ineuron_course;

select * ,
case
when course_name='fsda' then 'this is my batch'
when course_name='fsds'then  'this is my batch'
else 'this is not your batch'
end as statement
from ineuron_course;

select * ,
case
when length(course_name)=4 then 'len 4'
when length(course_name)=2 then 'len 2'
else 'Other length'
end as statement
from ineuron_course;

update ineuron_course set course_name=case
when course_name='RL' then 'Renforcement Learning'
when course_name='DL' then 'Deep Lerning'
else
end;

SELECT * FROM ineuron_course;