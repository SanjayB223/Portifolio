create database sql_project209;
use sql_project209;

create table emp_details (emp_id int, emp_name varchar(20),designation varchar(20),dep_no int,date_of_join date) ;

insert into emp_details(emp_id,emp_name,designation,dep_no,date_of_join) values
(17001,'Geetha','Manager',50,'2022-05-10'),
(17002,'Guru','Junior Associates',50,'2022-05-12'),
(17003,'Gokul','Senior Manager',50,'2022-05-15'),
(17004,'Mani','HR',60,'2022-05-20'),
(17004,'Moorthy','General Manager',50,'2022-05-23'),
(17006,'Amutha','Team Lead',50,'2022-06-05'),
(17007,'Jaga','Senior Manager',70,'2022-06-06'),
(17008,'Pavithra','Senior HR',60,'2022-06-07'),
(17009,'Arthi','General Manager',50,'2022-06-08'),
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
(17030,'mariya','Team Lead',80,'2022-06-29'),
(17031,'srinivasan','General Manager',70,'2022-06-30'),
(17032,'ganesan','Team Lead',80,'2022-07-01'),
(17033,'Praveen','Manager',80,'2022-07-02');

drop table emp_details;

drop table salary_details;

create table salary_details(salary_id int,emp_id int,salary_date date,branch_id int,amount int);

insert into salary_details values
(18001,	17001,'2022-06-10',241,	35000),
(18002,	17002,'2022-06-12',241,	14000),
(18003,	17003,'2022-06-15',241,	28000),
(18004,	17004,'2022-06-20',242,	18000),
(18005,	17005,'2022-06-23',241,	30000),
(18006,	17006,'2022-07-06',241,	23000),
(18007,	17007,'2022-07-07',243,	28000),
(18008,	17008,'2022-07-08',242,	18000),
(18009,	17009,'2022-07-09',241,	30000),
(18010,	17010,'2022-07-10',243,	23000),
(18011,	17011,'2022-07-11',243,	35000),
(18012,	17012,'2022-07-12',241,	14000),
(18013,	17013,'2022-07-13',242,	28000),
(18014,	17014,'2022-07-14',242,	18000),
(18015,	17015,'2022-07-15',244,	30000),
(18016,	17016,'2022-07-16',241,	14000),
(18017,	17017,'2022-07-17',243,	14000),
(18018,	17018,'2022-07-18',243,	14000),
(18019,	17019,'2022-07-19',243,	14000),
(18020,	17020,'2022-07-20',243,	14000),
(18021,	17021,'2022-07-21',244,	14000),
(18022,	17022,'2022-07-22',244,	14000),
(18023,	17023,'2022-07-23',244,	14000),
(18024,	17024,'2022-07-24',243,	30000),
(18025,	17025,'2022-07-25',242,	23000),
(18026,	17026,'2022-07-26',242,	35000),
(18027,	17027,'2022-07-27',244,	28000),
(18028,	17028,'2022-07-28',242,	18000),
(18029,	17029,'2022-07-29',243,	30000),
(18030,	17030,'2022-07-30',244,	23000),
(18031,	17031,'2022-07-31',243,	30000),
(18032,	17032,'2022-08-01',244,	23000),
(18033,	17033,'2022-08-02',244,	35000);

select * from emp_details;
select * from salary_details;

-- inner join
select * from emp_details inner join salary_details on 
emp_details.emp_id = salary_details.emp_id order by emp_details.emp_id ;

-- left join
select * from emp_details left join salary_details on 
emp_details.emp_id = salary_details.emp_id order by emp_details.emp_id ;

-- right join
select * from emp_details right join salary_details on 
emp_details.emp_id = salary_details.emp_id  ;

-- full outer join
(select * from emp_details left join salary_details on 
emp_details.emp_id = salary_details.emp_id )
union 
(select * from emp_details right join salary_details on 
emp_details.emp_id = salary_details.emp_id  );

-- cross join
select emp_details.emp_name,salary_details.salary_id from emp_details cross join salary_details  ;

-- cross join (after removed duplicates)

-- four table connection

create table  designation_details(desgnation_id int,designation varchar(30));

insert into designation_details values
(3001,	'Manager'),
(3002,	'Junior Associates'),
(3003,	'Senior Manager'),
(3004,	'HR'),
(3005,	'General Manager'),
(3006,	'Team Lead'),
(3007,	'Senior HR');

select * from designation_details;

create table  department_details (dep_no int,dep_name varchar(30),branch_id int , branch_name varchar(20));

insert into department_details values
(50,'Production Department',241,'Annan Nagar'),
(60,'HR Department',242,'Velachery'),
(70,'Sales Department',243,'Guindy'),
(80,'Finance Department',244,'KMC');

-- connection four tables
select * from emp_details inner join salary_details on 
emp_details.emp_id = salary_details.emp_id inner join designation_details 
on emp_details.designation = designation_details.designation inner join department_details on 
emp_details.dep_no = department_details.dep_no;

-- connection remove of duplicates
select emp_details.emp_id,emp_details.emp_name,emp_details.designation,emp_details.dep_no,emp_details.date_of_join,
salary_details.salary_id,salary_details.salary_date,salary_details.branch_id,salary_details.amount,
designation_details.desgnation_id,
department_details.dep_name,department_details.branch_name, 
case
when emp_details.dep_no = 50 then "Group A" else "others"
end as Category
from emp_details inner join salary_details on 
emp_details.emp_id = salary_details.emp_id inner join designation_details 
on emp_details.designation = designation_details.designation inner join department_details on 
emp_details.dep_no = department_details.dep_no order by emp_details.emp_id asc;

-- case end condition
select emp_details.emp_id,emp_details.emp_name,emp_details.designation,emp_details.dep_no,emp_details.date_of_join,
salary_details.salary_id,salary_details.salary_date,salary_details.branch_id,salary_details.amount,
designation_details.desgnation_id,
department_details.dep_name,department_details.branch_name, 
case
when emp_details.dep_no = 50 then "Group A" 
when emp_details.dep_no = 60 then "Group B"
when emp_details.dep_no = 70 then "Group c"
when emp_details.dep_no = 80 then "Group D"  
end as Category
from emp_details inner join salary_details on 
emp_details.emp_id = salary_details.emp_id inner join designation_details 
on emp_details.designation = designation_details.designation inner join department_details on 
emp_details.dep_no = department_details.dep_no order by emp_details.emp_id asc;



select * from salary_details;

-- having condition
select emp_details.emp_id,emp_details.emp_name,emp_details.designation,emp_details.dep_no,emp_details.date_of_join,
salary_details.salary_id,salary_details.salary_date,salary_details.branch_id,salary_details.amount,
designation_details.desgnation_id,
department_details.dep_name,department_details.branch_name, 
case
when emp_details.dep_no = 50 then "Group A" 
when emp_details.dep_no = 60 then "Group B"
when emp_details.dep_no = 70 then "Group c"
when emp_details.dep_no = 80 then "Group D"  
end as Category
from emp_details inner join salary_details on 
emp_details.emp_id = salary_details.emp_id inner join designation_details 
on emp_details.designation = designation_details.designation inner join department_details on 
emp_details.dep_no = department_details.dep_no 
where emp_details.designation = 'manager' having category = 'Group B'
order by emp_details.emp_id asc;


-- double case end condition
select emp_details.emp_id,emp_details.emp_name,emp_details.designation,emp_details.dep_no,emp_details.date_of_join,
salary_details.salary_id,salary_details.salary_date,salary_details.branch_id,salary_details.amount,
designation_details.desgnation_id,
department_details.dep_name,department_details.branch_name, 
case 
when emp_details.designation = 'manager' then 
case
when emp_details.dep_no = 50 then "Group A" 
when emp_details.dep_no = 60 then "Group B"
when emp_details.dep_no = 70 then "Group c"
when emp_details.dep_no = 80 then "Group D"  
end 
else "no role"
end as TEAM
from emp_details inner join salary_details on 
emp_details.emp_id = salary_details.emp_id inner join designation_details 
on emp_details.designation = designation_details.designation inner join department_details on 
emp_details.dep_no = department_details.dep_no 
order by emp_details.emp_id asc;


-- JOIN TRIGGER CREATION

select * from emp_team_info;
create table emp_team_info as
select emp_details.emp_id,emp_details.emp_name,emp_details.designation,emp_details.dep_no,emp_details.date_of_join,
salary_details.salary_id,salary_details.salary_date,salary_details.branch_id,salary_details.amount,
designation_details.desgnation_id,
department_details.dep_name,department_details.branch_name, 
case 
when emp_details.designation = 'manager' then 
case
when emp_details.dep_no = 50 then "Group A" 
when emp_details.dep_no = 60 then "Group B"
when emp_details.dep_no = 70 then "Group c"
when emp_details.dep_no = 80 then "Group D"  
end 
else "no role"
end as TEAM
from emp_details inner join salary_details on 
emp_details.emp_id = salary_details.emp_id inner join designation_details 
on emp_details.designation = designation_details.designation inner join department_details on 
emp_details.dep_no = department_details.dep_no 
order by emp_details.emp_id asc;


-- procedure concept
delimiter //
create procedure emp_team_info3()
begin
select emp_id,emp_name,designation ,
case
when dep_no = 50 then "team A "
when dep_no = 60 then "team b "
when dep_no = 70 then "team c "
when dep_no = 80 then "team d "
end as Teaminfo
from emp_details
where dep_no = 60 and designation ='senior hr' ;
select * from emp_details where emp_id = 17020;
end // 
delimiter ;
call emp_team_info3()

-- procedure declaring variables

delimiter //
create procedure des_count()
begin
declare emp_designation int;
select count(designation)
into emp_designation
from emp_details;
select emp_designation;
end //
delimiter ;
call  des_count();

