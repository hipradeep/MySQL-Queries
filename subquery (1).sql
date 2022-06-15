
-- display the name of employees and their name of manager
-- an include the the name of employees who 
-- do not have manager also
-- self join left outer join
select w.first_name worker,m.first_name manager,w.manager_id,m.employee_id
from employees w left outer join employees m
on w.manager_id=m.employee_id;

-- display the manager id,salary
-- of the lowest paid employee for that manager
-- exclude the employee who do not have manager.
-- exclude those managers where the minimum salary is greater than 7000
select min(salary),manager_id
from employees
where manager_id is not null
group by manager_id
having min(salary)>=6000
order by min(salary);

-- display the no of employees with salary greater than 8000
-- in each dept.

select count(*),department_id
from employees
where salary > 8000
group by department_id
having count(*)>2;

-- display each department name,number of employees 
-- and the average salary of the employees in that dept
select department_name,count(*),avg(salary)
from employees e,departments d
where e.department_id=d.department_id
group by e.department_id;

-- display the total salary of finance dept. 
select sum(salary),e.department_id,d.department_name
from departments d,employees e
where e.department_id=d.department_id
and d.department_name='Finance';

select first_name,salary,e.department_id,d.department_name
from departments d,employees e
where e.department_id=d.department_id
and d.department_name='Finance';

-- display the total salary of finance and purchasing dept.
select sum(salary),e.department_id,d.department_name
from departments d,employees e
where e.department_id=d.department_id
and d.department_name in ('Finance','purchasing')
group by e.department_id;

-- display the employee name , country name
-- who is working UK or US.
select e.last_name , l.country_id , c.country_name
from employees e, locations l ,departments d , countries c
where e.department_id = d.department_id and
d.location_id = l.location_id and
l.country_id = c.country_id and
l.country_id in('UK','US');



-- Display the employees who get more salary than bruce.
select first_name,salary from employees where first_name='Bruce';

select first_name,salary
from employees
where salary > 6000;

-- subquery
-- single row subquery -> the inner query returns only one output/one row
select first_name,salary
from employees
where salary > (select salary from employees where first_name='Neena');
-- display the name and salary of the employees who takes the same salary as neena
select first_name,salary
from employees
where salary = (select salary from employees where first_name='Neena')
and not first_name = 'Neena';

/*  =,> >=,< ,<=, <> */

-- display the name,jobid,and department id of the employee 
-- who works in the same department as Diana. 
select first_name,job_id,salary,department_id
from employees
where department_id =
(select department_id from employees where first_name='Diana')
and first_name<>'Diana';

-- display the name,jobid,and department id of the employee 
-- who works in the same department as Diana 
-- and the salary is greater than David's.. 

select first_name,job_id,salary,department_id
from employees
where 
department_id =(select department_id from employees where first_name='Diana')
and 
salary>(select salary from employees where first_name='David');


-- display the name and 
-- job id of the employees who works as the same profile of lex.
select first_name
from employees
where job_id=(select job_id from employees where first_name='lex')
and first_name<>'lex';

-- display the name of the employee who is getting the maximum salary. 
select first_name from employees 
where salary=(select max(salary) from employees);


-- display the name of employees who are working in finance dept. 
select first_name,department_name
from departments d,employees e
where e.department_id=d.department_id
and d.department_name='Finance';

-- subquery

select first_name
from employees e
where department_id=
(select department_id from departments where department_name='Finance' );

-- display the minimum salary of those departments whose minimum salary is
-- greater than minimum salary of dept 8. 

select min(salary),department_id
from employees
group by department_id
having min(salary) > 
(select min(salary) from employees where department_id=8);

-- display the name,jobid,and department id of the employee 
-- who works in the same department as Diana. 
select first_name,job_id,salary,department_id
from employees
where department_id =
(select department_id from employees where first_name='Diana')
and first_name<>'Diana';

-- display the name,jobid,and department id of the employee 
-- who works in the same department as Diana 
-- and the salary is greater than David's.. 
-- multirow subqueries in operator
select first_name,job_id,salary,department_id
from employees
where 
department_id in (select department_id from employees where first_name='john')


-- subqueries can be used in where,having,from

se