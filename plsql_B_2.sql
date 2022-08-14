use hrms;

select distinct department_id,0 as "total _sal"
from employees
where department_id is not null;

-- create a table new_emp with data based on employees table
create table emp1 as select * from employees;

desc emp1;

select * from emp1;
create table emp2 as 
select first_name,salary from employees
where department_id in (4,5,6);

desc emp2;

select * from emp2;


create table new_emp as 
select distinct department_id,0 as "total _sal"
from employees
where department_id is not null;
select * from new_emp;

create table emp3 as 
select * from employees where employee_id=800;

desc emp3;

select * from emp3;

create table emp4 as 
select * from employees where 1=2;

desc emp4;

select * from emp4;

-- query to update the totalsal of dept 6 in newemp table
-- to  total sal of
--  dept 6 in employees table.
select * from new_emp;

select sum(salary) from employees
where department_id=6;

-- update new emp table
update new_emp
set total_sal=(select sum(salary) from employees
where department_id=8)
where department_id=8;


select * from new_emp;
create table new_emp as 
select distinct department_id,0 as "total_sal"
from employees
where department_id is not null;

drop table new_emp;
delimiter //
CREATE PROCEDURE `update_sal`(in did int)
BEGIN
update new_emp
set total_sal=(select sum(salary) from employees
where department_id=did)
where department_id=did;
select * from new_emp;
END//
-- call the procedure manually
call update_sal(4);
call update_sal(3);

-- create a procedure to print the name of the employees 
-- for the employee id provided by the user.

delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `a1`(in eid int)
begin
declare ename varchar(40);
select first_name into ename from employees where employee_id=eid;
select ename;
end//

call a1(109);


delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `a13`(in eid int)
begin
select salary from employees where employee_id=eid;

end//

call a13(109);


DELIMITER $$

CREATE  PROCEDURE `a13`(in eid int)
begin
declare sal int;
select salary into sal from employees where employee_id=eid;
set sal=sal+500;
select sal;
end $$

DELIMITER $$

CREATE  PROCEDURE `a14`(in eid int,out sal int)
begin
select salary into sal from employees where employee_id=eid;
end $$

-- call the procedure manually

set @a=105;

call a14(@a,@x);
select @x;
set @x=@x+500;
select @x;

-- display the no of rows from the employee
--  table by user's choice
select * from employees limit 2,5;
select * from employees limit 12,15;


delimiter //
create procedure emp_limit(in startin int,in ending int)
begin
select * from employees limit startin,ending;
end//

call hrms.emp_limit(10, 5);

-- create a procedure to display the minimum and maximum salary of 
-- deptid entered by the user.
delimiter //
create procedure min_max(in dno int,out maximum int,out minimum int)
begin
select max(salary),min(salary) into maximum,minimum
from employees where department_id=dno;
end//

-- automatic execution when clicking in the execution button

set @maximum = 0;
set @minimum = 0;
call hrms.min_max(5, @maximum, @minimum);
select @maximum, @minimum;

-- manual call to procedure

call min_max(8,@x,@y);
select @x,@y;
-- we can provide alias also
select @x as "Maximum Salary",@y as "Minimum Salary";


select count(*)  from employees group by department_id 
order by count(*)
limit 3; 

-- inout parameter
-- combination if in and out parameter

delimiter //
create procedure inout1(inout msg varchar(100))
begin
set msg=concat(@msg," welcome to cdac");
end//

set @msg = 'gourav';
call inout1(@msg);
select @msg;


set @msg = 'saurabh';
call inout1(@msg);
select @msg;

select "anu" into @msg;
call inout1(@msg);
select @msg;

-- exampl2 on inout
delimiter //
create procedure inout2(inout x int,in y int)
begin
set x=x+y;
end//

set @x=1;
call inout2(@x,200)
select @x;


delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `inout3`(inout sal int)
begin
select round(sal) into sal;
end//

set @sal = 18900.50;
call hrms.inout3(@sal);
select @sal;


-- if else in PL/SQL
if condition then
stmts
elseif condition then
stmts
else
stmts
end if;

-- 2 variable d1 and d2 which will 
-- store the hire date of any 2 employees

delimiter //
CREATE PROCEDURE compare_date(in eid1 int,in eid2 int)
begin
declare d1,d2 date;
select hire_date into d1 from employees where employee_id=eid1;
select hire_date into d2 from employees where employee_id=eid2;
select d1,d2;
end//

/*Q1 user will inout a no. check the no is even or odd
Q2 user will enter the eid,update his salary according the following criteria
<5000 30% hike
5001 to 10000 20%hike
>10001 then 10% hike

*/

call compare_date(100,105);
