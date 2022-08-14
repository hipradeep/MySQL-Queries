use cdac;

create table employees as select * from hrms.employees;

select * from employees;

delimiter //
create procedure pro1()
begin
select * from employees;
end //



select now();
select curdate();
select substr("hello world",7,length("hello world"));

delimiter //
CREATE PROCEDURE substrings()
BEGIN
select substr("hello  world",7,12);
END//


-- invoke the procedure
 call pro1();


-- delimiters  -> separator
delimiter @@
create procedure procedurename()
begin
stmt 1;
stmt 2;
.
.
stmt n
end @@

call test();

select round(60.8);
select "hello world"  as "column1";



delimiter //
create procedure emp_data()
begin
select * from employees where department_id=3;
end // 

-- excute the procedure
call emp_data();


select * from employees where department_id=3;
select * from employees where department_id=5;
select * from employees where department_id=10;


-- create procedure that displays the list of 
-- employees working for dept entered by the user

DELIMITER $$

CREATE PROCEDURE `emp_dept`(in did int)
BEGIN
select * from employees where department_id=did;
END$$
-- 'in' is default
call emp_dept(10);

-- example

delimiter //
create procedure P1()
begin
declare x int;
declare y int;
declare z int;
set x=80;
set y=20;
set z=x+y;
select z;
end//

call p1();

-- find the addition value of variables passed by user.

delimiter //
create procedure P2(in x int,in y int)
begin
declare z int;
set z=x+y;
select z;
end//
-- call the procedure
call p2(230,150);


-- example out type of parameter in procedure
delimiter //
create procedure P3(in x int,in y int,out z int)
begin
set z=x+y;
end//

-- call the procedure
call p3(10,20,@d);
select @d;

-- create a procedur to display the total no of employee working in a 
-- perticular dept entered by the user.

DELIMITER $$
USE `cdac`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `P4`(in x int)
begin
declare ct int;
select count(*) into ct from employees where department_id=x;
select ct;
end$$

call p4(3);

-- create a procedur to display the total no of employee working in a 
-- perticular dept entered by the user.(use of out parameter)

DELIMITER $$
USE `cdac`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `P5`(in x int,out ct int)
begin

select count(*) into ct from employees where department_id=x;

end$$

call p5(6,@z);
select @z "no. of people";

select first_name,0 "total sal" from employees;

drop table emp_dept;

create table emp_dept as select department_id,0 "total sal" from employees;

select * from emp_dept;
desc emp_dept;

-- create a procedure named as update_salary which will update the
-- total salary of each dept in emp_dept table
-- as the total salary of respective dept in employee table.





