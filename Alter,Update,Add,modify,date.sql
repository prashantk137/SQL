create database sales;

use sales;

create table sales1(
	order_id VARCHAR(15) NOT NULL, 
	order_date VARCHAR(15) NOT NULL, 
	ship_date VARCHAR(15) NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 8) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	`year` DECIMAL(38, 0) NOT NULL
);

select * from sales1;
set session sql_mode='';
load data infile
'D:\sales_data_final.csv'
into table sales1
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select str_to_date(order_date,'%m/%d/%y') from sales1;

alter table sales1
add column order_date_new date after order_date;

update sales1
set order_date_new=str_to_date(order_date,'%d/%m/%Y');

alter table sales1
add column ship_date_new date after ship_date;

update sales1
set ship_date_new=str_to_date(ship_date,'%d/%m/%Y');

set sql_safe_updates=0;

select * from sales1 where ship_date_new='2011-01-05';
select * from sales1 where ship_date_new>'2011-01-05';
select * from sales1 where ship_date_new<'2011-01-05';

select * from sales1 where ship_date_new between '2011-01-05' and '2011-08-30';

select now();
select curdate();
select curtime();

select * from sales1 where ship_date_new < date_sub(now(),interval 1 week);

select date_sub(now(),interval 1 week);

select date_sub(now(),interval 4 day);

select year(now());
select date(now());
select dayname(now());
select dayname('2022-11-19');

Alter table sales1
add column flag date after order_id;

update sales1
set flag=now();

select * from sales1;

Alter table sales1
modify column `year` year;

alter table sales1
add column Year_New int;

alter table sales1
modify column Year_New int;

alter table sales1
add column Month_New int;

alter table sales1
add column Day_New int;

update sales1 set Month_New=month(order_date_new);
update sales1 set Year_New=year(order_date_new);
update sales1 set Day_New=day(order_date_new);

select month(order_date_new) from sales1;

select year_new,avg(sales) from sales1 group by year_new ;

select year_new,sum(sales) from sales1 group by year_new ;

select year_new,min(sales) from sales1 group by year_new ;

select year_new,max(sales) from sales1 group by year_new;

select year_new,sum(quantity) from sales1 group by year_new;

select (sales*discount+shipping_cost) as ctc from sales1;

select order_id,discount, if(discount >0,'yes','no') as discount_flag from sales1;

alter table sales1
add column discout_flag varchar(20) after discount;
alter table sales1
rename column discout_flag to discount_flag;

select * from sales1;

update sales1
set discount_flag=if(discount >0,'yes','no');

select discount_flag,count(*) from sales1 group by discount_flag;