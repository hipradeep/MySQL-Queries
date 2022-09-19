use labtest;

show tables;

-- 
SELECT  last_name, salary
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;

-- desc employees;
SELECT  last_name, job_id, 	hire_date as joining_date
FROM employees
WHERE hire_date  BETWEEN 	'1998-02-01' AND '1998-05-01';

SELECT  last_name, department_id
FROM employees
WHERE department_id  BETWEEN 20 AND 50
order by last_name asc;

SELECT em.last_name "Employee", em.employee_id "EMP#",
m.last_name "Manager", m.employee_id "Mgr#"
FROM employees em join employees m ON (em.manager_id = m.employee_id);

SELECT e.department_id department, e.last_name employee, c.last_name colleague FROM employees e JOIN employees c
ON (e.department_id = c.department_id) WHERE e.employee_id <> c.employee_id
ORDER BY e.department_id, e.last_name, c.last_name;

select last_name as "Last Name", salary as "Monthy Income", department_id as "Department Id"
from employees
WHERE (department_id=2 or department_id=5) and salary BETWEEN 5000 AND 1200 ;


SELECT em.last_name "Last Name", j.job_title "Job title", l.city

FROM employees em join departments d  on (em.department_id = d.department_id  )
  join  jobs j  on  (em.job_id = j.job_id ) 
  join  locations l  on  (d.location_id = l.location_id ) ;
  
  SELECT first_name, last_name, salary, department_id 
 FROM employees
   WHERE salary <  (SELECT AVG(salary) FROM employees );

SELECT first_name, last_name, salary, d.department_id 
 FROM  employees em join departments d  on (em.department_id = d.department_id  )
   WHERE d.department_name  <>  "IT" and salary >  
   (SELECT max(salary) FROM  employees em join departments d  on (em.department_id = d.department_id  ) 
   WHERE d.department_name  =  "IT");
   
   SELECT first_name  FROM  employees em 
   WHERE  salary =    (SELECT max(salary) FROM   employees ) ;
   
   
   SELECT e.department_id department, e.last_name employee,
c.last_name colleague
FROM employees e JOIN employees c
ON (e.department_id = c.department_id)
WHERE e.employee_id <> c.employee_id
ORDER BY e.department_id, e.last_name, c.last_name;


SELECT first_name, last_name, salary, department_id
FROM employees  
WHERE salary > 
(SELECT AVG (salary)  
FROM employees);
   