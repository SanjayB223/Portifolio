create database sql_project204;
use sql_project204;

create table emp_details(
emp_id int,emp_name varchar(20),designation varchar(30),dep_no int,date_of_join date);

insert into emp_details(emp_id,emp_name,designation,dep_no,date_of_join) values
(17001,'Geetha','Manager',50,'2022-05-10'),
(17002,'Guru','Junior Manager',50,'2022-05-12'),
(17003,'Gokul','Senior Manager',50,'2022-05-15'),
(17004,'Mani','HR',60,'2022-05-20'),
(17005,'Moorthy','General Manager',50,'2022-05-23'),
(17006,'Amutha','Team Lead',50,'2022-06-05'),
(17007,'Jaga','Senior Manager',70,'2022-06-06'),
(17008,'Pavithra','Senior HR',60,'2022-06-07'),
(17009,'Arthi','General Manger',50,'2022-06-08'),
(17010,'Kabilan','Team Lead',70,'2022-06-09'),
(17011,'Manasi','Manager',70,'2022-06-10'),
(17012,'Suja','Junior Associates',50,'2022-06-11'),
(17013,'Arun','Senior Manager',60,'2022-06-12'),
(17014,'Deepa','HR',60,'2022-06-13'),
(17015,'Sindhu','General Manager',80,'2022-06-14'),
(17016,'Madhavi','Junior Associates',50,'2022-06-15'),
(17017,'Swetha','Junior Associates',70,'2022-06-16'),
(17018,'Selvi','Junior Associates',70,'2022-06-17'),
(17019,'Pooja','Junior Associates',70,'2022-06-18'),
(17020,'Lakshmi','Junior Associates',70,'2022-06-19'),
(17021,'Veeramani','Junior Associates',80,'2022-06-20'),
(17022,'Pandian','Junior Associates',80,'2022-06-21'),
(17023,'Veera','Junior Associates',80,'2022-06-22'),
(17024,'Devi','General Manager',70,'2022-06-23'),
(17025,'Devan','Team Lead',60,'2022-06-24'),
(17026,'Keerthi','Manager',60,'2022-06-25'),
(17027,'Venkatesh','Senior Manager',80,'2022-06-26'),
(17028,'Raja','HR',60,'2022-06-27'),
(17029,'Priya','General Manager',70,'2022-06-28'),
(17030,'Mariya','Team Lead',80,'2022-06-29'),
(17031,'Srinivasan','General Manager',70,'2022-06-29'),
(17032,'Ganesan','Team Lead',80,'2022-07-01'),
(17033,'Praveen','Manager',80,'2022-07-02');

select * from emp_details;

describe emp_details;
-- general  function
-- where
select * from emp_details where dep_no = 50;
-- or
select * from emp_details where designation = 'team lead' or designation = 'junior associates';
-- AND
select * from emp_details where designation = 'junior associates'and dep_no = 80;
-- in
select * from emp_details where dep_no in (50);
-- not in
select * from emp_details where dep_no not in (50);


-- Greater then
select * from emp_details where dep_no>60;
-- lesser then
select * from emp_details where dep_no<70;
-- greater than or equalto
select * from emp_details where dep_no>=60;
-- lesser then or equalto
select * from emp_details where dep_no<=70;
-- not equalto(<>)
select * from emp_details where dep_no<>70;
-- used in text also
select * from emp_details where designation <>'junior associates';
-- count
select count(*) from emp_details;
-- !=
select * from emp_details where dep_no !=50;

-- Groupby
select designation,count(emp_id)from emp_details group by designation;
-- distinct
select distinct dep_no from emp_details;
-- count with distinct
select count(distinct designation)from emp_details;
-- order by asc
select * from emp_details order by dep_no asc;
-- order by
select * from emp_details order by dep_no desc;
-- limit
select * from emp_details order by emp_id limit 0,10;
-- desc limit
select * from emp_details order by emp_id desc limit 0,10;
-- like
select * from emp_details where emp_name like 'g%';
-- not like
select * from emp_details where emp_name not like 'g%';
-- between
select * from emp_details where dep_no between 50 and 80;


-- sql string function
-- uppercase
select ucase(emp_name)from emp_details;
-- lowercase
select lcase(emp_name) from emp_details;

-- left
select left(emp_id,2)from emp_details;
-- right
select right(emp_id,3)from emp_details;
-- concat
select concat(emp_name,"_",designation)from emp_details;
-- trim
select trim(emp_name)from emp_details;
-- char_length
select * from emp_details where char_length(emp_name)=5;
-- length
select length(dep_no)from emp_details;
-- mid 
select mid(emp_id,2,3) from emp_details;


-- logical function
-- if
select emp_name,if(dep_no = 50,'GROUP A','OTHERS') as group_info from emp_details;
select emp_name,if(dep_no = 60,'GROUP B','OTHERS') as group_info from emp_details;

-- count if
select emp_name ,count(if (dep_no = 50,'1',NULL))AS A ,count(if (dep_no = 60,'1',NULL)) as B,count(if (dep_no = 70,'1',NULL)) as C ,count(if (dep_no = 80,'1',NULL) ) as D
from emp_details group by emp_name;

-- if count(own try)
select emp_name ,if (dep_no = 50,'GROUP A','not in group') as A,if (dep_no = 60,'GROUP B','not in group') as B,if (dep_no = 70,'GROUP C','not in group') AS C,if (dep_no = 80,'GROUP D','not in group') as D
from emp_details;

-- if with and condition(my own try)
select emp_id,emp_name,date_of_join ,if ((designation = 'Manager') and (dep_no = 50),'STRONG','WEAK') AS com_table from emp_details ;

-- if with or condition (my try)
select emp_id,emp_name,date_of_join ,if ((designation = 'Manager') or (dep_no = 60),'STRONG','WEAK') AS com_table from emp_details ;


-- date function
 
-- year
select * from emp_details where year(date_of_join) = '2022';

-- month
select * from emp_details where month(date_of_join) = '05'; 

-- date add function
-- (year)
select emp_id,emp_name,date_of_join,date_add(date_of_join,interval 5 year ) as 5_yrs_later from emp_details; 

-- (month)
select emp_id,emp_name,date_of_join,date_add(date_of_join,interval 5 month ) as 5_mon_later from emp_details; 

-- datediff
select emp_id,emp_name, round( datediff(curdate(),date_of_join )/12,0) as emp_exp_month from emp_details;  
-- datediff(yrs)
select emp_id,emp_name, round( datediff(curdate(),date_of_join )/365,0) as emp_exp_yr from emp_details; 


-- timestampdiff
-- (yrs)
select emp_id,emp_name,timestampdiff(year,date_of_join,curdate()) as exp_yrs from emp_details;
-- (month)
select emp_id,emp_name,timestampdiff(month,date_of_join,curdate()) as exp_mon from emp_details;

-- now 
select emp_id,date_of_join,now() as current_update from emp_details;

-- date_format
select emp_id,date_of_join, date_format(date_of_join,'%b') as join_months from emp_details;

-- specific date format
select emp_id,emp_name, date_of_join from emp_details where date_format(date_of_join,'%b') like '_a%' ;
