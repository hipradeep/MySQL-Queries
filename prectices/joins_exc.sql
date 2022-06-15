use hrms;
select * from employees;

show tables;

select * from employees;
select * from departments;

SELECT  department_name, department_id
FROM  departments;
SELECT  department_name, employees.department_id
FROM employees, departments
WHERE employees.department_id =departments.department_id
GROUP BY department_name;

select e.first_name,d.department_name,l.city
from employees e,departments d,locations l 
where e.department_id=d.department_id
and d.location_id=l.location_id;

select e.first_name,d.department_name,l.city,l.location_id, country_id
from employees e,departments d,locations l 
where 
 e.department_id=d.department_id
and d.location_id=l.location_id
and country_id='US';

-- display thw employee name  who are working in US or UK
SELECT e.last_name, l.country_id
FROM employees e,departments d, locations l 
WHERE  e.department_id=d.department_id
and d.location_id=l.location_id
and l.country_id in ('US','UK');

SELECT concat(e.first_name,' ',e.last_name) as 'Employee Name', l.country_id
FROM employees e,departments d, locations l 
WHERE  e.department_id=d.department_id
and d.location_id=l.location_id
and l.country_id in ('US','UK');


-- self join

SELECT * FROM employees;
SELECT concat(e.first_name,' ',e.last_name) as 'Employee Name', concat(e1.first_name,' ',e1.last_name) as 'Manager Name'
FROM employees e,employees e1
WHERE e.manager_id=e1.employee_id
AND e.employee_id=103;


CREATE table jobs_grade(min_sal DECIMAL (8, 2), max_sal DECIMAL(8, 2), grade CHAR);

insert into jobs_grade VALUES(20000, 40000, 'A');
insert into jobs_grade VALUES(10001, 19999, 'B');
insert into jobs_grade VALUES(5001, 8000, 'C');
insert into jobs_grade VALUES(2001, 5000, 'D');
insert into jobs_grade VALUES(8001, 10000, 'C');

update jobs_grade set grade= 'E' WHERE min_sal=8001;

select * from jobs_grade;

select * from employees;

-- display the employee and and their salary grade

select e.first_name, g.grade
from employees e, jobs_grade g
WHERE e.salary BETWEEN  g.min_sal and  g.max_sal;

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id)
values(400,'siddhi','Nayak','sss@gmail',675756,'1998-09-08',4,6747.50,100);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id)
values(401,'Anu','Mehra','rrrr@gmail',675756,'1990-09-08',5,9000.50,101);

insert into departments values(12,'Technical',1800);
insert into departments values(13,'system admin',1800);
insert into departments values(14,'House keeping',1700);


SELECT * from employees;
SELECT * from departments;


select distinct department_id from employees;


-- print the dept name of all employees
-- inner join
select e.last_name,d.department_name,d.department_id
from employees e, departments d
where e.department_id=d.department_id;
-- outer join where all matching rows will come as well as rows which does not match the join 
-- condition will also  come in output
select e.first_name,d.department_name,d.department_id
from employees e left join departments d
on e.department_id=d.department_id;

-- print the dept name of all dept whther any employee working on it or not
select * from departments;
-- right outer join 
select e.first_name,d.department_name,d.department_id
from employees e right join departments d
on e.department_id=d.department_id;

use hrms;

select * from departments;


select sum(e.salary) 
from employees e, departments d
WHERE e.department_id=d.department_id
and d.department_name='Finance';

-- display the  total salary of Finance and Purchasing department 
select sum(e.salary), d.department_name 
from employees e, departments d
WHERE d.department_name in ('Finance','Purchasing')
and e.department_id=d.department_id
GROUP BY d.department_name;

select sum(e.salary), d.department_name
from employees e, departments d
WHERE e.department_id=d.department_id
GROUP BY d.department_name;



-- display the name of employee and their name of manager 
-- an include the on name of employee who do not have manager also 

SELECT e.first_name 'Employee name', m.first_name 'Manger name'
FROM employees e left join employees m 
on e.manager_id = m.employee_id;

-- display the manager id, salary of the lowest paid empoloyee for that manager 
-- exclude the employee who do not have manager

SELECT min(e.salary) 'Lowest paid employee',  e.manager_id 'Manger ID'
FROM employees e
WHERE e.manager_id is not null;

-- display the manager id, salary of the lowest paid empoloyee for that manager 
-- exclude the employee who do not have manager
-- exclude those manager where the minimum salary is grater then 7000

SELECT min(e.salary) 'Lowest paid employee',  e.manager_id 'Manger ID'
FROM employees e
WHERE e.manager_id is not null
group by e.manager_id
having min(salary) <  6000;



show tables ;
select * from employees;

-- display the number of employee with salary greater than 8000
select count(*) 'Number of employee'
from employees
where  salary > 8000;


-- display the number of employee with salary greater than 8000 in each dept
select count(*) 'Number of employee', department_id 'Dept ID'
from employees
where department_id is not null and salary > 8000
GROUP BY department_id;

-- display the number of employee with salary greater than 8000 in each dept, having employees gtrather then 2
select count(*) 'Number of employee', department_id 'Dept ID'
from employees
where department_id is not null and salary > 8000
GROUP BY department_id
having count(*) > 2;


-- display each department name, number of employee
-- and avarage salary of the employees in that department
select  d.department_name 'Dept Name',count(*) 'Number of employee', avg(salary) 'Avg Salary'
from employees e, departments d
where e.department_id is not null and e.department_id = d.department_id
GROUP BY e.department_id;

show TABLES;
select * from departments;
