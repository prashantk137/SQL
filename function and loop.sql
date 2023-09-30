use sales;

Select * from sales1;

Delimiter &&
create function add_to_col(a int )
returns int 
Deterministic
begin
Declare b int;
set b=a+10;
return b;
end &&

select max(sales) from sales1;

select add_to_col(15);

select quantity+10 from sales1;

select add_to_col(quantity) from sales1;

Delimiter &&
create function  final_profits(profit int, discount int)
returns int
deterministic
Begin
declare final_profit int;
set final_profit=profit-discount;
return final_profit;
end &&

select final_profits(profit,discount) from sales1;

delimiter &&
create function final_profit_real(profit decimal(20,6),discount decimal(20,6),sales decimal(20,6))
returns int
deterministic
begin
declare final_profit int;
set final_profit=profit- sales*discount;
return final_profit;
end&&

select final_profit_real(profit,discount,sales) from sales1;

delimiter &&
create function int_to_str(a int)
returns varchar(20)
deterministic
begin
declare b varchar(20);
set b=a;
return b;
end &&
select int_to_str(4);

select int_to_str(quantity) from sales1;

delimiter &&
create function mark_sales2(sales int)
returns varchar(30)
deterministic
begin
declare flag_sales varchar(30);
if sales<100  then
	set flag_sales="super affordable product";
elseif sales>100 and sales<300 then
	set flag_sales="affordable";
elseif sales>300 and sales<600 then
	set flag_sales="moderate price";
else
	set flag_sales="expenssive";
end if;
return flag_sales;
end &&

select mark_sales1(110);

select mark_sales2(sales) from sales1;

create table loop_table(val int);

Delimiter &&
create procedure insert_data()
begin
set @var=10;
generate_data : loop
insert into loop_table values(@var);
set @var=@var+1;
if @var=100 then
	leave generate_data;
end if;
end loop generate_data;
end &&

call insert_data();

select * from loop_table;

delimiter &&
create procedure insert_data1()
begin
set @var=10;
generate_data:loop
if @var%3=0 then
set @var=@var+1;
insert into loop_table values(@var);
if @var=100 then
	leave generate_data;
end if;
end if;
end loop generate_data;
end &&

call insert_data1;





