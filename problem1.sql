create table iwc(Team_1 varchar(20),Team_2 varchar(20),winner varchar(20));

insert into iwc values('India','SL','India');
insert into iwc values('SL','Aus','Aus');
insert into iwc values('SA','Eng','Eng');
insert into iwc values('Eng','NZ','NZ');
insert into iwc values('Aus','India','India');

Select * from iwc;

Select team_name,count(1) as no_of_matches_played,sum(win_flag) as no_of_matches_won,count(1)-sum(win_flag) as no_of_matches_losses
from(
Select Team_1 as team_name, case when Team_1=winner then 1 else 0 end as win_flag
from iwc
union all
Select Team_2 as team_name, case when Team_2=winner then 1 else 0 end as win_flag
from iwc) A
group by team_name
order by no_of_matches_won desc;

