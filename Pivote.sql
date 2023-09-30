create database pivote;

use pivote;

create table order_table(
order_id int,
emp_id int,
vendor_id int);

insert into order_table values
(1, 258, 1580),
(2, 254, 1496),
(3, 257, 1494),
(4, 261, 1650),
(5, 251, 1654),
(6, 253, 1664);

select * from order_table;

select order_id,
if(emp_id=258,1,Null) as emp258,
if(emp_id=254,1,Null) as emp254,
if(emp_id=257,1,Null) as emp257,
if(emp_id=261,1,Null) as emp261,
if(emp_id=253,1,Null) as emp253
from order_table;