create database win_fun;

use win_fun;

create table ineuron_students(
student_id int,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
student_marks int,
student_mail_id varchar(40));

select * from ineuron_students;

insert into ineuron_students values(121,'fsds','rajesh','cs',94,'rajesh@gmail.com'),
(102,'fsda','ravisoni','cs',83,'ravisoni@gmail.com'),
(103,'fsda','abhishek','cs',82,'abhishek@gmail.com'),
(104,'fsda','rakesh','cs',34,'rakesh@gmail.com'),
(105,'fsds','chirag','it',87,'chirag@gmail.com'),
(106,'fsdas','chitransh','it',20,'chitransh@gmail.com'),
(107,'fsds','bikesh','it',49,'bikesh@gmail.com'),
(108,'fsds','vikash','it',48,'vikash@gmail.com'),
(109,'fsdas','rajesh','cs',78,'rajesh@gmail.com'),
(110,'fsds','tomar','cs',94,'tomar@gmail.com'),
(111,'fsds','lokendra','ee',45,'lokendra@gmail.com'),
(112,'fsda','swaraj','ece',59,'swaraj@gmail.com'),
(113,'fsds','rahul','ee',79,'rahul@gmail.com'),
(114,'fsda','deepak','ee',87,'deepak@gmail.com'),
(115,'fsde','praful','ee',85,'praful@gmail.com'),
(116,'fsda','ravi','ee',83,'ravi@gmail.com'),
(117,'fsde','sudhanshu','cs',79,'sudhanshu@gmail.com'),
(118,'fsde','kshitij','me',89,'kshitij@gmail.com'),
(119,'fsde','raja','me',70,'raja@gmail.com'),
(120,'fsde','roushan','me',60,'roushan@gmail.com')
(121,'fsds','rajesh','cs',94,'rajesh@gmail.com');

select student_batch,sum(student_marks) from ineuron_students group by student_batch;
select student_batch,min(student_marks) from ineuron_students group by student_batch;
select count(student_batch) from ineuron_students;
select count(distinct student_batch) from ineuron_students;
select student_batch ,count(*) from ineuron_students group by student_batch;

select * from ineuron_students where student_batch='fsda' order by student_marks desc limit 1,1;

select student_id, student_batch, student_name, student_stream, student_marks, student_mail_id, row_number() over (order by student_marks)as 'row_number' from ineuron_students;

select student_id, student_batch, student_name, student_stream, student_marks, student_mail_id, 
row_number() over (partition by student_batch order by student_marks desc)as 'row_number' from ineuron_students;

select * from (
select student_id, student_batch, student_name, student_stream, student_marks, student_mail_id, 
row_number() over (partition by student_batch order by student_marks desc)as 'row_num' from ineuron_students) as test where row_num=1;

select student_id, student_batch, student_name, student_stream, student_marks, student_mail_id, 
rank() over (order by student_marks desc)as 'row_rank' from ineuron_students;

select student_id, student_batch, student_name, student_stream, student_marks, student_mail_id, 
dense_rank() over (order by student_marks desc)as 'row_rank' from ineuron_students;

select * from (
select student_id, student_batch, student_name, student_stream, student_marks, student_mail_id, 
dense_rank() over (partition by student_batch order by student_marks desc)as 'drow_rank' from ineuron_students)as test where drow_rank=1;

select * from (
select student_id, student_batch, student_name, student_stream, student_marks, student_mail_id, 
dense_rank() over (partition by student_batch order by student_marks desc)as 'drow_rank' from ineuron_students)as test where drow_rank=2;

select * from (
select student_id, student_batch, student_name, student_stream, student_marks, student_mail_id, 
dense_rank() over (partition by student_batch order by student_marks desc)as 'drow_rank' from ineuron_students)as test where drow_rank in (1,2,3);