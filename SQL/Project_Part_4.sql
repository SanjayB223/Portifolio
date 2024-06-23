create database sql_project2013;
use sql_project2013;

drop table emp_details;

create table emp_details (emp_id int, emp_name varchar(20),designation varchar(20),dep_no varchar(20),date_of_join date) ;

-- trigger creation and before insert
delimiter //
create trigger check_date before insert on emp_details for each row

if new.dep_no = 60 then 
set new.dep_no ="team blue";
end if //
delimiter ;

insert into emp_details values 
(17014,'Deepa','HR',60,'2022-06-13'),
(17015,'Sindhu','General Manager',80,'2022-06-14');

select * from emp_details;
drop table emp_details1;


-- after insert concept 
create table emp_details03 (emp_id int, emp_name varchar(20),designation varchar(20),dep_no int,date_of_join date) ;

create table emp_backup03 (emp_id int, emp_name varchar(20),designation varchar(20),dep_no int,date_of_join date) ;
delimiter // 
create trigger data_backup33 after insert on emp_details03 for each row
insert into emp_backup03(emp_id,emp_name,designation,dep_no,date_of_join)  values 
(new.emp_id,new.emp_name,new.designation,new.dep_no,new.date_of_join);
end //
delimiter ;

insert into emp_details03 values
(17004,'Mani','HR',60,'2022-05-20');

select * from emp_details03;
select * from emp_backup03;

-- trigger after insert concept 2 (own try)

create database sql_project123;
use sql_project123;

create table emp_details (emp_id int, emp_name varchar(20),designation varchar(20),dep_no int,date_of_join date);

Create table emp_bonus (Emp_id int, emp_name varchar(20),Bonus int);

delimiter // 
create trigger insert_bonus after insert
on Emp_details for each row
begin

if new.designation = 'manager' then 
insert into emp_bonus (Emp_id,emp_name,bonus) values (new.emp_id, new.emp_name, 1100);

elseif new.designation = 'hr' then 
insert into emp_bonus (Emp_id,emp_name,bonus) values (new.emp_id, new.emp_name, 900);

elseif new.designation = 'Junior Associates' then 
insert into emp_bonus (Emp_id,emp_name,bonus) values (new.emp_id, new.emp_name, 800);

elseif new.designation = 'senior Manager' then 
insert into emp_bonus (Emp_id,emp_name,bonus) values (new.emp_id, new.emp_name, 1200);

elseif new.designation = 'General Manager' then 
insert into emp_bonus (Emp_id,emp_name,bonus) values (new.emp_id, new.emp_name, 1500);

elseif new.designation = 'Team Lead' then 
insert into emp_bonus (Emp_id,emp_name,bonus) values (new.emp_id, new.emp_name, 950);

elseif new.designation = 'Senior HR' then 
insert into emp_bonus (Emp_id,emp_name,bonus) values (new.emp_id, new.emp_name, 1000);

end if;
end//
delimiter ;

insert emp_details (emp_id,emp_name,designation,dep_no,date_of_join)  values
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

select * from emp_details;

select * from emp_bonus;


-- before update

drop table salary_details;
create table salary_details(salary_id int,emp_id int,salary_date date,branch_id int,amount varchar(30),primary key(emp_id)  );
insert into salary_details values
(18001,	17001,'2022-06-10',241,	35000),
(18002,	17002,'2022-06-12',241,	14000),
(18003,	17003,'2022-06-15',241,	28000);
delimiter //
create trigger sal_grades before update on salary_details for each row 
begin
if new.amount>=35000 then 
set new.amount = 'high salary' ;

elseif new.amount>=25000 then 
set new.amount = 'avg salary' ;

elseif new.amount >=15000 then 
set new.amount = 'low salary';
end if ;
end //
delimiter ;
select * from salary_details;
update salary_details set amount =36000 where emp_id = 17001;

-- after update concept
create database office;
use office;
create table salary_details3(salary_id int,emp_id int,salary_date date,branch_id int,amount int,primary key(emp_id) );
insert into salary_details3 values
(18001,	17001,'2022-06-10',241,	35000),
(18002,	17002,'2022-06-12',241,	14000),
(18003,	17003,'2022-06-15',241,	28000);
select * from salary_details3;
select * from emp_bonus;
Create table emp_bonus1 (Emp_id int,Bonus int);
delimiter // 
create trigger bonus_point1 after update on salary_details3 for each row
begin
if new.amount >= 30000 then
insert into emp_bonus1 (emp_id,bonus) values (new.emp_id,1000);
elseif new.amount >= 25000 then
insert into emp_bonus1 (emp_id,bonus) values (new.emp_id,500);
end if;
end //
delimiter ;
update salary_details3 set amount =40000 where emp_id = 17002;

