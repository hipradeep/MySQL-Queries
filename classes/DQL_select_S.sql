create database emp_detail;

use emp_detail;

CREATE TABLE dept (
deptno int primary key,
dname varchar(14) NOT NULL,
  loc varchar(13) 
);

CREATE TABLE emp (
Empno decimal(4,0) Primary Key,
Ename varchar(10) default NULL,
  job varchar(9) default NULL,
mgr decimal(4,0) default NULL,
hiredate date ,
sald decimal(7,2) default NULL,
  comm decimal(7,2),
deptno  int references dept(deptno)
);

INSERT INTO emp VALUES (101,'SMITH','CLERK','109','1980-12-17','800.00',NULL,20);
INSERT INTO emp VALUES (102,'ALLEN','SALESMAN','101','1981-02-20','1600.00','300.00',30);
INSERT INTO emp VALUES (103,'WARD','SALESMAN','101','1981-02-22','1250.00','500.00',30);
INSERT INTO emp VALUES (104,'JONES','MANAGER','101','1981-04-02','2975.00',NULL,20);
INSERT INTO emp VALUES (105,'MARTIN','SALESMAN','102','1981-09-28','1250.00','1400.00',30);
INSERT INTO emp VALUES (106,'BLAKE','MANAGER','102','1981-05-01','2850.00',NULL,30);
INSERT INTO emp VALUES (107,'CLARK','MANAGER','102','1981-06-09','2450.00',NULL,10);
INSERT INTO emp VALUES (108,'SCOTT','ANALYST','102','1982-12-09','3000.00',NULL,20);
INSERT INTO emp VALUES (109,'KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,10);
INSERT INTO emp VALUES (110,'TURNER','SALESMAN',102,'1981-09-08','1500.00','0.00',30);
INSERT INTO emp VALUES (111,'ADAMS','CLERK','103','1983-01-12','1100.00',NULL,20);
INSERT INTO emp VALUES (112,'JAMES','CLERK','103','1981-12-03','950.00',NULL,30);
INSERT INTO emp VALUES (113,'FORD','ANALYST','101','1981-12-03','3000.00',NULL,20);
INSERT INTO emp VALUES (114,'MILLER','CLERK','101','1982-01-23','1300.00',NULL,10);
INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES (20,'RESEARCH','DALLAS');
INSERT INTO dept VALUES (30,'SALES','CHICAGO');
INSERT INTO dept VALUES (40,'OPERATIONS','BOSTON');

select * from dept;
select * from emp;

desc emp;

alter table emp change sald sal decimal(7,2);



CREATE TABLE emp1 (
Empno decimal(4,0) Primary Key,
Ename varchar(10) default NULL,
job varchar(9) default NULL,
mgr decimal(4,0) default NULL,
hiredate date ,
sald decimal(7,2) default NULL,
comm decimal(7,2),
deptno  int references dept(deptno)
);

-- example of autoincrement

create table empl(empid int auto_increment, 
empname varchar(20),
primary key(empid)
);

insert into empl(empname) values('siddhi');
insert into empl(empname) values('priti');

select * from empl;

insert into empl(empid,empname) values(100,'siddhi');
insert into empl(empname) values('ravi');
insert into empl(empname) values('yogita');


-- oracle sequence



create table empls(empid int auto_increment primary key, 
empname varchar(20)
);


truncate table empl;
select * from empl;


insert into empl(empname) values('x');
insert into empl(empname) values('y');
insert into empl(empname) values('t');
insert into empl(empname) values('x');


-- delete 1 row
delete from empl where empid=2;

select * from empl;


-- delete all rows
delete from empl;


select * from empl;

insert into empl(empname) values('x');
insert into empl(empname) values('y');
insert into empl(empname) values('t');
insert into empl(empname) values('x');


select * from empl;

truncate table empl;
rollback;

drop table empl;

create table empl(empid int , 
empname varchar(20),
primary key(empid)
);


insert into empl(empid,empname) values(1000,'x');
insert into empl(empid,empname) values(1001,'y');

-- make the empid auto incremented
alter table empl modify empid int auto_increment;
select * from empl;
insert into empl(empname) values('t');
insert into empl(empname) values('x');


use emp_detail;
-- DRL or DQL
-- diplay all the record for all columns
select * from emp;
select * from dept;

-- display the limited no of rows
-- display only 5 rows
-- limit offset,n

select * from emp limit 5;
select * from emp limit 5,3;
select * from emp;

-- sorting the data in a perticular order, ascending,descending;
-- order by
-- display the employee detail in the ascending order of their salary
select * from emp
order by sal asc ;
-- asc keyword is optional
select * from emp
order by sal ;
-- display the employee detail in the descending order of their salary
select * from emp
order by sal desc ;

-- display the employee detail in the ascending order of the dept no.
select * from emp
order by deptno ;

-- display the employee detail in the ascending order of the dept no
-- and also their salary to be sorthed in ascending in the respective depts.
select * from emp
order by deptno asc,sal asc ;
-- example 2
select * from emp
order by deptno asc,sal desc ;

-- sort the emp by their date of joining .
select * from emp
order by hiredate asc;

-- sort the emp by their name.
select * from emp
order by ename asc;

-- display the top 5 salaried employees detail. 
select * from emp
order by sal desc
limit 5;

-- display the 3 lowest paid employees detail. 
select * from emp
order by sal asc
limit 3;


select * from emp;


select * from emp;
-- diplay only specific columns but rows 
-- diplay the emp id, their name salary of all employees;
select empno,ename,sal
from emp;
-- display the ename, their job  and theit doj of all employees. 

select ename,job,hiredate
from emp;

-- display the ename, their job  and their doj of all employees according to seniority. 

select ename,job,hiredate
from emp
order by hiredate asc;

-- display the unique jobs .
select  distinct job from emp;
select distinct deptno from emp;
select distinct mgr from emp;
select distinct empno from emp;
select distinct ename from emp;

select distinct deptno,job from emp;

select * from emp;

-- Display the empname,their salary and display the annual salary of all emp . 
select ename,sal
from emp;
select ename,sal,sal*12
from emp;
select ename,sal,(sal+500)*12
from emp;

-- Alias/ another name/temp name
select ename "Employee Name",sal "Monthly Salary",(sal+500)*12 "Annual salary"
from emp;

select ename as "Employee Name",sal as "Monthly Salary",(sal+500)*12 as "Annual salary"
from emp;

select ename as "Employee Name",sal  "Monthly Salary",(sal+500)*12 as "Annual salary"
from emp;

select ename as EmployeeName,sal  "Monthly Salary",(sal+500)*12  "annual salary"
from emp;

-- restrict the rows/ filter specific based on a condition through where

/*
select all column/specific all list
from table
where 
order by
limit
*/
-- display the detail of employees who belongs to department 10. 

select *
from emp
where deptno=10;
-- display the emp name, salary and deptno of employees who belongs to department 30.
select ename,sal,deptno 
from emp
where deptno=30;
-- display empname and salary of those employees whose name is Adams.
select ename,sal
from emp
where ename='adams';
-- display the detail of all employees whose name is Adams
select *
from emp
where ename='adams';
-- display the emp no and ename of all emp who works as manager. 
select empno,ename,job
from emp
where job='MANAGER';

/* > greater than
< less than
>= greater than equal to
>= less than equals to
!= not equal to
<> not equal to 
= equal to
*/
-- display the name , designation,
-- salary of those employees whose salary is greater than 3000. 
select ename,sal
from emp
where sal=3000;
select ename,sal
from emp
where sal>3000;

select ename,sal
from emp
where sal>=3000;


