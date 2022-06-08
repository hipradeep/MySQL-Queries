-- Functions are 2 types
-- 1. single row 2. group function/multi row/aggregate functions
-- single row function
select * from emp;
select lower(ename) from emp;
select length(ename) from emp;
-- group function
select * from emp;
-- descriptive analytics means,count. 
-- sum(sal)= 646465
select sum(sal) from emp;
-- sum(), count(), avg(),max(),min(),stddev(),variance
-- display the maximum salary value.
select max(sal) from emp;
-- display the minimum salary value.
select min(sal) from emp;
-- display the average salary value.
select avg(sal) from emp;
-- display the total no of emps in the organization
select count(empno) from emp;
select count(*) from emp;
select count(ename) from emp;
select count(comm) from emp;
select sum(sal) "Total Salary",
max(sal) "Maximum Salary", min(sal) "Minimum Salary",
avg(sal) "Average employee",
count(*) "Total no of employees"
from emp;
-- find the difference between maximum and minimum salary. 
select max(sal)-min(sal) "difference"
from emp;

select * from emp;
select count(mgr) from emp;
-- to count how many manager
select count(distinct mgr) from emp;

select max(sal) from emp;
select min(sal) from emp;

-- display the total salary for dept 10. 
select sum(sal)
from emp 
where deptno=10;
-- display the total salary for dept 20. 
select sum(sal)
from emp 
where deptno=20;
-- display the total salary for dept 30. 
select sum(sal)
from emp 
where deptno=30;

-- display the total salary of each department. 
-- group by

select sum(sal) 
from emp
group by deptno; 
select sum(sal) ,deptno
from emp
group by deptno;
-- display the total salary of each department 
-- and the department no in the ascending order of deptno
-- group by
select sum(sal) ,deptno
from emp
group by deptno
order by deptno;
-- display the total salary of each department 
-- and the department no in the ascending 
-- order of total salary
select sum(sal) ,deptno
from emp
group by deptno
order by sum(sal);

-- or
select sum(sal) "TOTAL",deptno
from emp
group by deptno
order by TOTAL;
-- display the total salary of dept 10 and dept 20.
select sum(sal),deptno
from emp
where deptno in(10,20)
group by deptno;

-- display the total salary of each department 
-- but for only those department whose
-- total salary is greater than 9000.
select sum(sal) "TOTAL",deptno
from emp
group by deptno
having sum(sal) > 9000
order by TOTAL;

-- display the maximum salary for each job category
select max(sal), job
from emp 
group by job;

-- display the maximum salary of those job category
-- whose maximum salary is less than equal 3000.
select max(sal), job
from emp 
group by job
having max(sal) <= 3000
order by max(sal) desc;
