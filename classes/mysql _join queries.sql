use hrms;
-- join is technique to retrieve/read/display data from more than one table
-- cross join -> retrieve/read/display data from more than one table without any condition
-- result is cartesian product
-- m no of row in table1 and n rows in table2
-- then output will be m*n  no. of rows
-- display the employee first name and their dept name.
-- firstname is in emp table, dept name is in department table
select first_name,department_name
from employees, departments;
-- out put will be 42*14 = 588 rows

-- 2 Inner join- > this ia join tehnique to retrieve data from mutiple table,
-- but only those rows will come which matches the join condition
-- equijoin
-- display the employee first name and their dept name.
select first_name,department_name,e.department_id
from employees e, departments d
where e.department_id=d.department_id;
-- display the employee first name and their dept name in the ascending order of department_id .
select first_name,department_name,e.department_id
from employees e, departments d
where e.department_id=d.department_id
order by e.department_id;

-- display the employee first name and their dept name of all employees who are working in Finance dept.

select first_name,department_name,e.department_id
from employees e, departments d
where e.department_id=d.department_id
and d.department_name='Finance';

-- old standard(1999)
select first_name,department_name,e.department_id
from employees e inner join departments d
on e.department_id=d.department_id
and d.department_name='Finance';

-- display the employee first name,doj and their dept name of the employee steven.
select e.first_name,e.hire_date,department_name,e.department_id
from employees e, departments d
where e.department_id=d.department_id
and e.first_name='steven';
-- display the employee first name,doj and their dept name of the employee working in dept 5,2,10,11
select e.first_name,e.hire_date,department_name,e.department_id
from employees e, departments d
where e.department_id=d.department_id
and e.department_id in(5,2,10,11);

-- Display the employee last name and department name for all employees who have an a (lowercase) in their last names. 
SELECT last_name, department_name 
FROM employees, departments 
WHERE employees.department_id = departments.department_id 
AND last_name LIKE '%a%';

-- display the emp name and job title of all employee
select e.first_name,j.job_title
from employees e, jobs j
where e.job_id=j.job_id;
-- display the emp name, dept name and their city
select e.first_name,d.department_name,e.department_id,l.city
from employees e, departments d,locations l
where e.department_id=d.department_id
and d.location_id=l.location_id;
-- display the emp name, dept name and their city of those employees who work in Seattle.
select e.first_name,d.department_name,e.department_id,l.city
from employees e, departments d,locations l
where e.department_id=d.department_id
and d.location_id=l.location_id
and l.city='Seattle';

-- display the departname and job title of every employee. 
select e.first_name,d.department_name,e.department_id,j.job_title
from employees e, departments d,jobs j
where e.department_id=d.department_id
and e.job_id=j.job_id; 

-- display the departname and job title of every employee who work as an accountant,public accountant or finance manager
 
select e.first_name,d.department_name,e.department_id,j.job_title
from employees e, departments d,jobs j
where e.department_id=d.department_id
and e.job_id=j.job_id
and job_title in ('accountant','public accountant' ,'finance manager'); 

-- self join
-- when one table/relation has relationship with itself
-- this is called as recussiove relatioship
-- relationship is "one of the employees manages other employee/employees"
-- so 1: M relationship between employee with itself
-- this can be implemented by making manager_id as Foreign key which refers the employee id of the same table
-- A SELF JOIN is a join that is used to join a table with itself.
-- We can perform Self Join using table aliases in the from clause. 



-- Display the manager name of each employee who has a manager. 
-- the below query will not work. result 0 rows
select employee_id,first_name,manager_id			
from employees worker,employees manager	
where manager_id=employee_id;			

-- self join, where we have create two copies of the same table
-- inner join
-- equi join
select worker.first_name,manager.first_name,worker.manager_id,manager.employee_id			
from employees worker,employees manager				
where worker.manager_id=manager.employee_id	;			


--  Display the manager name of Alexander. 

select worker.first_name,manager.first_name,worker.manager_id,manager.employee_id			
from employees worker,employees manager				
where worker.manager_id=manager.employee_id	
and worker.first_name='Alexander'		;

-- outer join
/* the row which do not match the join cndition will also come in output,
matched row will come as well as row which do not match the join cndition will also come in output,


1 left outer join/ left join
2. right outer join/right join
3. Full outer join/ union /union

1. left outer join
*/
use hrms;
-- display the employee first name and their dept name.(only for those who has dept id)
-- so we can do this through inner join
/*as only rows which matches the join condition will be in output */
select first_name,department_name,e.department_id
from employees e left outer join departments d
on e.department_id=d.department_id;

-- can also be written as follows with left join keyword
select first_name,department_name,e.department_id
from employees e left join departments d
on e.department_id=d.department_id;

-- right outer join
-- list all depts whether they have employees or not
-- all rows of right hand side table will come
select first_name,department_name,d.department_id
from employees e right outer join departments d
on e.department_id=d.department_id;

-- can also be written as follows with right join keyword
select first_name,department_name,e.department_id
from employees e right join departments d
on e.department_id=d.department_id;

-- Another example of left outer join 
-- display all employees and their manager name including King, who has no manager. 
-- all rows of employee table whether they have manager or not

select worker.first_name,manager.first_name,worker.manager_id,manager.employee_id			
from employees worker left outer join employees manager				
on worker.manager_id=manager.employee_id	;		

-- full outer join
-- display the all rows of both table

/* the below query will not work as mysql does not support FULL OUTER JOIN Syntax
select first_name,department_name,d.department_id
from employees e full outer join departments d
on e.department_id=d.department_id;
so this concept of full outer join can be done as below
with the concept of union keyword. */

use hrms;
select first_name,department_name,e.department_id
from employees e left outer join departments d
on e.department_id=d.department_id
union
select first_name,department_name,d.department_id
from employees e right outer join departments d
on e.department_id=d.department_id;
-- all 42 rows of employees table and and 3 rows extra from the departments table, so total 45 rows in output




