
use hrms;
SELECT * from employees;

-- display the employees who get mor salry then bruce

-- salary of bruce
select salary from employees where first_name='bruce';

-- employees who got more then 6000 salary
select first_name, salary from employees where salary > 6000;

-- subquri
select first_name, salary 
from employees 
where salary > (select salary from employees where first_name='bruce');

-- display the employees who get same salry as neena
select first_name, salary 
from employees 
where salary = (select salary from employees where first_name='neena')
and first_name  <> 'neena';

-- display the name job id, dept id of employee who work in same department 
-- as Diana
select first_name, job_id, department_id
from employees 
where department_id = (select department_id from employees where first_name='Diana')
and first_name  <> 'Diana';

-- display the name job id, dept id of employee who work in same department 
-- as Diana nad salary greater then devid's
select first_name, job_id, department_id
from employees 
where department_id = (select department_id from employees where first_name='Diana')
and salary >  (select salary from employees where first_name='david')
and first_name  <> 'Diana';

-- display the name and job id who work as the same profile of lex
select first_name, job_id
from employees 
where job_id = (select job_id from employees where first_name='lex');

SELECT * from employees;

-- display the name of the employee who getting the maximum salary
select first_name
from employees 
where salary = (select max(salary) from employees);

-- display the name of the employee who working in finance department
select first_name
from employees 
where department_id = (select department_id from departments WHERE department_name='finance');



-- display the minimum salary of those department whose minimum salary is 
-- greater than minimum salary of dept 8

select min(salary)
from employees
where department_id=8;

select min(salary), department_id
from employees
group by department_id
HAVING min(salary) > (select min(salary)
					from employees
					where department_id=8);

-- multirow subqueries in operater
select first_name, job_id, department_id
from employees
WHERE department_id in ( SELECT department_id from employees where first_name ='john');


-- date 08 June

-- multirow subqueries

-- Q1. display the employees who works in the same dept 
 -- as employees with employee id 176 

 select * from employees
 where department_id = (SELECT department_id from employees WHERE employee_id = 176 ) 
 and employee_id <> 176;

 -- Q2. display the employees who works in the same dept 
 -- as employees with employee id 176 or 123.
 
 select * from employees
 where department_id in (SELECT department_id from employees WHERE employee_id in (176, 123))
 and employee_id not in (176,123);


 -- Q3. display the employees who works in the same dept 
 -- as employees with employee id 176 or 123 and 
 -- manager id should be same as of 176 and 123..
 
  select * from employees
 where department_id in (SELECT department_id from employees WHERE employee_id in (176, 123))
 and manager_id  in (SELECT manager_id from employees WHERE employee_id in (176, 123)) 
 and employee_id not in (176,123);
 
  -- Q1 display the emp name and salary list of employees 
 -- who does not work in job id 9
 
 select first_name, salary, job_id
 from employees
 where job_id not in (9);
 
  -- Q2. display the emp name and salary list of employees 
 -- who does work in job id 9.
 
  select first_name, salary, job_id
 from employees
 where job_id  in (9);
 
 
  /*Display the employees who do not work as job id 9				
but their salary is equal to any of the employee 				
working as job id 9.	*/



select first_name, salary, job_id
from employees
where salary in (select salary from employees where job_id = 9)
HAVING job_id !=9;

-- or 
select first_name, salary, job_id
from employees
where job_id !=9
and salary in (select salary from employees where job_id = 9);

-- Display the employees who do not work as job id 9				
-- but their salary greater than  any of the employee 				
-- working as job id 9.
use hrms;
 select first_name,salary,job_id
 from employees
 where job_id!=9
 and salary >any (select salary
 from employees
 where job_id=9);

--  4th higest sararied persion
select first_name,salary
from employees
order by salary desc
limit 3,1;

select first_name,salary,job_id
 from employees
 where job_id!=9
 and salary <any (select salary
 from employees
 where job_id=9);
 
  
/* Display the employees who do not work as job id 9				
but their salary greater than  all of the employee 				
working as job id 9.				
>all	more than the maximum	
*/	

select first_name,salary,job_id
from employees
where job_id!=9
and salary > all (select salary
from employees
where job_id=9);

select first_name,salary,job_id
from employees
where job_id!=9
and salary >  (select max(salary)
from employees
where job_id=9);

				
/* Display the employees who do not work as job id 9				
but their salary less than  all of the employee 				
working as job id 9.				
<all	less than the minimum	*/
		

 select first_name,salary,job_id
from employees
where job_id!=9
and salary < all (select salary
from employees
where job_id=9);
-- or
select first_name,salary,job_id
from employees
where job_id!=9
and salary <  (select min(salary)
from employees
where job_id=9);

-- display list of departments  that have at least 
-- one employee.
select department_name 
from departments
where exists(select * from employees where department_id=department_id);

select department_id,department_name 
from departments d
where exists(select * from employees e where e.department_id=d.department_id);

-- display the employees who have at 
-- least one person reporting to him/her.

select employee_id,first_name
from employees
where employee_id in
(select manager_id from employees where manager_id is not null);
