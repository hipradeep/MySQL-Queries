use hrms;
-- Display the total salary of each department. 
select sum(salary),department_id
from employees
group by department_id;
-- Display the total salary of 
--  for department 5. 
select sum(salary),department_id
from employees
where department_id=5;
-- Display the total salary of department 5 and 8. 
select sum(salary),department_id
from employees
where department_id in (5,8)
group by department_id;

-- Display the total salary of finance and purchasing
-- department each.

select sum(e.salary),e.department_id,d.department_name
from employees e,departments d 
where e.department_id=d.department_id
and d.department_name in('finance','purchasing')
group by e.department_id,d.department_name;

-- display the maximun salary of each job category of each department. 
select max(salary),department_id,job_id
from employees
group by department_id,job_id;

-- subqueries
-- single row subquery
-- the inner query returns only 1 row
-- >,>=,<,<=,= !=
-- display the first_name, salary of employees
-- who has more salary than neena. 
select first_name,salary 
from employees
where salary>(select salary from employees
where first_name='neena');

-- display the first_name, salary of employees
-- who gets equal salary  as neena. 
select first_name,salary 
from employees
where salary=(select salary from employees
where first_name='neena')
and first_name<>'neena';
-- display the employee name,job id,depart of employees who works
-- in the same department as diana. 
select e.first_name,e.job_id,e.department_id,d.department_name
from employees e,departments d 
where e.department_id=
(select department_id from employees 
where first_name='Diana')
and first_name != 'Diana'
and e.department_id=d.department_id;

-- Display the total salary of finance department .

select sum(salary)
from employees
where department_id=(select department_id from departments
where department_name='finance');

select first_name,salary,department_id
from employees
where department_id=
(select department_id from employees 
where first_name='sarah')
and salary>
(select salary from employees 
where first_name='matthew');

-- multirow subquery
-- where the inner query returns more than on row
-- comparison operator in ,any, all
-- select the name of employee who works 
-- in the same dept as john.
select e.first_name,e.job_id,e.department_id
from employees e
where e.department_id in
(select department_id from employees 
where first_name='sigal');

-- display the employee name
 -- who gets the maximum salary. 

select sum(salary),manager_id
 from employees
 group by manager_id;
-- thos cab done through subquery
select first_name,salary from employees
where salary=( select max(salary)
 from employees);
 
 -- display the employee name
 -- who gets the minimum salary. 

select first_name,salary from employees
where salary=( select min(salary)
 from employees);
 
 
 -- display the minimum salary of those 
 -- departments whose minimum salary is greater
 -- than the minimum salary department 6;
 
 select min(salary),department_id
 from employees
 group by department_id
 having min(salary)>( select min(salary)
 from employees
 where department_id=6);
 
 -- Q1. display the employees who works in the same dept 
 -- as employees with employee id 176 or 123.


-- Q2. display the employees who works in the same dept 
 -- as employees with employee id 176 
 
 select first_name,employee_id
 from employees
 where department_id=
 (select department_id 
 from employees 
 where employee_id=176)
 and employee_id <> 176;

-- the answer of Q1

select first_name,employee_id,manager_id,department_id
 from employees
 where department_id in
 (select department_id 
 from employees 
 where employee_id=176 or employee_id=123)
 and employee_id not in (176,123);
 
 -- Q3. display the employees who works in the same dept 
 -- as employees with employee id 176 or 123 and 
 -- manager id should be same as of 176 and 123..
 -- multi column -- non pair wise comparison
 select first_name,employee_id,manager_id,department_id
 from employees
 where department_id in(select department_id from employees 
						where employee_id in(176,123))
 and manager_id in (select manager_id 
					from employees 
					where employee_id in(176, 123))
 and employee_id not in (176,123);
 
 select first_name,salary,manager_id,department_id
 from employees
 where department_id in (11,8)
 and salary >10000;
 
 -- multi column
 -- pair wise comparison
 
 select first_name,employee_id,manager_id,department_id
 from employees
 where (department_id,manager_id) in
                        (select department_id,manager_id from employees 
						where employee_id in(176,123))
  and employee_id not in (176,123);
 
 
 -- Q1 display the emp name and salary list of employees 
 -- who does not work in job id 9
 select first_name,salary,job_id
 from employees
 where job_id!=9;
 
 -- Q2. display the emp name and salary list of employees 
 -- who does work in job id 9.
 
 select first_name,salary,job_id
 from employees
 where job_id=9;
 
 /*Display the employees who do not work as job id 9				
but their salary is equal to any of the employee 				
working as job id 9.	*/

select first_name,salary,job_id
 from employees
 where job_id!=9
 and salary in (select salary
 from employees
 where job_id=9);
 
 /* =any operator is equals to in operator
 >any
 <any
 */
 
 select first_name,salary,job_id
 from employees
 where job_id!=9
 and salary =any (select salary
 from employees
 where job_id=9);
 
/* Display the employees who do not work as job id 9				
but their salary greater than  any of the employee 				
working as job id 9.				
>any				
set1 value must be more than the minimum value of set 2		*/
		
select first_name,salary,job_id
 from employees
 where job_id!=9
 and salary >any (select salary
 from employees
 where job_id=9);
 -- or
 select first_name,salary,job_id
 from employees
 where job_id!=9
 and salary > (select min(salary)
 from employees
 where job_id=9);
 
select first_name,salary
from employees
order by salary desc
limit 3,1;

/* Display the employees who do not work as job id 9				
but their salary less than  any of the employee 				
working as job id 9.				
<any				
less than the maximum	*/	
		
select first_name,salary,job_id
 from employees
 where job_id!=9
 and salary <any (select salary
 from employees
 where job_id=9);
 
 -- or 
 select first_name,salary,job_id
 from employees
 where job_id!=9
 and salary < (select max(salary)
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

-- or 

select department_id,department_name 
from departments d
where exists(select * from employees e where e.department_id=d.department_id);


-- display the employees who have at 
-- least one person reporting to him/her.

select employee_id,first_name
from employees
where employee_id in
(select manager_id from employees where manager_id is not null);

-- co related subquery
-- the out put of the outer query will be passed to the inner query row by row

select employee_id,first_name
from employees o
where employee_id in
(select manager_id from employees where manager_id=o.employee_id);



select employee_id,first_name
from employees o
where exists
(select manager_id from employees where manager_id=o.employee_id)





 
 

 
 