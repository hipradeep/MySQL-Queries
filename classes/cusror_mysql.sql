SELECT * FROM d1.employees;
use d1;
-/* What is a cursor
 a cursor allows row-by-row processing of the result sets. 
 A cursor is used for the result set and returned from a query. 
 By using a cursor, you can iterate, or step through the results of a query 
 and perform certain operations on each row. 
 The cursor allows you to iterate through the result set and then perform the additional 
 processing only on the rows that require it.

A cursor contains the data in a loop. */

/*
Two types of Cursor

1. 
An asensitive cursor is used to points the actual data,
whereas a temporary copy of the data is used by an insensitive cursor used. 
An asensitive cursor performs faster than an insensitive cursor 
because it does not have to make a temporary copy of data.
*/

-- cursor example

/*There are some steps we have to follow while using the MySQL Cursors, let’s see.
Declare a Cursor
Open a Cursor
Fetch the Cursor
Close the Cursor */

-- example 1
delimiter $$
create procedure cursor_test(in eid int)
begin
declare sal1 int;
declare c1 cursor for
select salary from employees where employee_id=eid;
open c1;
fetch c1 into sal1;
close c1;
select sal1;
end$$
call cursor_test(101);


  -- cursor example 2
  

delimiter $$
CREATE PROCEDURE cursor_test1(in did int)
begin
declare sal1 int;
declare job1 varchar(50);
DECLARE done int default 0;
declare c1 cursor for select job_id,salary from employees where department_id=did;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
open c1;
repeat 
 fetch c1 into job1,sal1;
 select job1,sal1;
  until done=1
 end repeat;
 end$$

call cursor_test1(90);

 -- cursor example 3
 drop table test;
 create table test(j varchar(50),s int);
desc test;

truncate table test;

delimiter $$
CREATE PROCEDURE cursor_test2(in did int)
begin
declare job1 varchar(50);
declare sal1 int;
DECLARE done int default 0;
declare dept_cursor cursor for
select job_id,salary from employees where department_id=did;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
open dept_cursor;
repeat 
 fetch dept_cursor into job1,sal1;
 insert into test values(job1,sal1);
 until done=1
 end repeat;
 close dept_cursor;
 end$$
 
 call cursor_test2(30);


select * from test;



-- ***********************************************************************
drop table empbackupdata;
CREATE TABLE empbackupdata(  
  e_ID INT,  
  e_name VARCHAR(50),  
  sal int  
); 

delimiter //  
CREATE PROCEDURE Cursor4()  
BEGIN  
DECLARE flag INT DEFAULT 0;  
DECLARE emp_id INT;  
DECLARE emp_name varchar(30);
DECLARE emp_sal int;  
DECLARE emp_cursor CURSOR FOR SELECT employee_id,first_name,salary 
FROM employees ;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
SET flag = 1;  
OPEN emp_cursor;  
l1: LOOP  
IF flag = 1 THEN  
LEAVE l1;  
END IF;  
IF NOT flag = 1 THEN  
 FETCH emp_cursor INTO emp_id, emp_name, emp_sal;  
INSERT INTO empbackupdata VALUES(emp_id, emp_name, emp_sal);  
END IF;  
iterate l1;
END LOOP;  
  
CLOSE emp_cursor;  
END// 

call cursor4();


select * from empbackupdata;