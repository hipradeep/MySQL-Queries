-- show all databases
SHOW databases;
-- create new database
CREATE database stock;
-- drop database stock
DROP database stock;

-- Creating table in database
use pgdac;
CREATE TABLE student8(
roll_no INT PRIMARY KEY,
name VARCHAR(30) not NULL,
age INT CHECK(age >= 28),
salary INT CHECK(salary BETWEEN 10000 and 40000),
country VARCHAR(25),
CONSTRAINT c_chk_country22 CHECK(country in ('india', 'nepal'))
);

desc student8;

SELECT * from table1 
where jab not in('SALESMAN','MANAGER','CLERK') 
and sal > 4000 ;

create DATABASE org1;

use org1;

create table emp (
empno int PRIMARY key,
ename VARCHAR(50),
job VARCHAR(50),
mgr VARCHAR(50),
hiredate DATE,
sal DECIMAL(6,2),
comm VARCHAR(15),
deptno int
);

INSERT into emp(empno,ename,job, mgr,hiredate, sal,deptno ) 
values (2, "pradeep", "salesman", "ramesh", '1988-01-09', 800, 2);

INSERT into emp(empno,ename,job, mgr,hiredate, sal,deptno ) 
values (4, "rakesh", "manager", "kamlesh", '1999-05-09', 1000, 4);

INSERT into emp(empno,ename,job, mgr,hiredate, sal,deptno ) 
values (7, "manoj", "cleark", "suresh", '2002-08-10', 1200, 6);

select * from emp;

select * from emp
-- % matlab hi h zero or more charater
-- start with '<char>%'
where (ename LIKE 'man%' or ename LIKE 'ra%' or ename LIKE 'pr%')
order by sal asc;


select * from emp
-- % matlab hi h zero or more charater
-- end with '%<char>'
where (ename LIKE '%man' or ename LIKE '%ra' or ename LIKE '%pr')
order by sal asc;

select * from emp
-- % matlab hi h zero or more charater
-- first char
where ename LIKE '_m%' 
order by sal asc;

select * from emp
-- % matlab hi h zero or more charater
-- second char
where ename LIKE '__m%' 
order by sal asc;

select * from emp
-- string conatain mo in between
where ename LIKE '%no%'  
order by sal asc;
