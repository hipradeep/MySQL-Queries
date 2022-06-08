use hrms;
select * from employees;
-- Q1. display employee name and
-- the department name in which they are working

-- Q2. display employee name and
-- the job title in which they are working
/* join- read data from multiple table, more than 1
3 types
1. cross join  , cartesian product -> M rows * n rows
2. Inner join
3. Outer join */
-- cross join 
-- Q1. display employee name and
-- the department name in which they are working
select * from employees;
select * from departments;
select first_name,department_name
from employees,departments;


create table t1 (c1 int,c2 char);
create table t2(c3 int,c4 char) ;
insert into t1 values(1,'a');
insert into t1 values(2,'b');
insert into t1 values(3,'c');
insert into t1 values(4,'d');
select * from t1;
select * from t2;

insert into t2 values(8,'x');
insert into t2 values(9,'y');

select c1,c3
from t1,t2;
select * from employees;
select * from departments;
select first_name,department_name
from employees,departments;
-- inner join
-- only produce resultant rows those matches the join condition
-- Equijoin
select first_name,department_name					
from employees,departments					
where employees.department_id=departments.department_id	;				

-- or
select first_name,department_name,employees.department_id				
from employees,departments					
where employees.department_id=departments.department_id	;	
-- or
select first_name,department_name,e.department_id				
from employees e,departments d				
where e.department_id=d.department_id	;	
-- if you have 2 tables in the from clause, then
-- you must have 2-1 join condition.			


-- Q2. display employee name and
-- the job title in which they are working
select * from jobs;
select e.first_name,j.job_title,e.job_id			
from employees e, jobs j			
where e.job_id=j.job_id;		
-- Q3. display the department name and city in which it locates.
-- department name is in departments table
-- city is in locations table
select * from departments;
select * from locations;
select d.department_name,l.city,d.location_id,l.location_id
from departments d,locations l 
where d.location_id=l.location_id; 
 
-- display the employeename, their department name, and 
-- city to which he is working.
-- 3 tables, so 3-1=2 join conditions
select e.first_name,d.department_name,l.city
from employees e,departments d,locations l 
where e.department_id=d.department_id
and d.location_id=l.location_id;

-- display the employeename, their department name, and 
-- city to which he is working only for country id US
-- 3 tables, so 3-1=2 join conditions
select e.first_name,d.department_name,l.city,l.location_id
from employees e,departments d,locations l 
where country_id='US'
and e.department_id=d.department_id
and d.location_id=l.location_id;


-- display the employee name , 
-- jobid of employees working in finance department. 
select first_name,department_name,e.department_id				
from employees e,departments d				
where e.department_id=d.department_id
and department_name='Finance'	;	
-- 
select first_name,department_name,e.department_id				
from employees e,departments d				
where department_name='Finance'	
and e.department_id=d.department_id;	
 -- display the employeename, their department name of 
 -- those employees who work in Toronto
select e.first_name,d.department_name,l.city
from employees e,departments d,locations l 
where e.department_id=d.department_id
and d.location_id=l.location_id
and l.city='Toronto';


