use hrms;
-- display the employees name and doj of employees who are 
--  working as accountant, publicc accountant and finance manager
select e.last_name,e.hire_date,j.job_title
from employees e,jobs j
where e.job_id=j.job_id
and j.job_title in ('accountant','public accountant','finance manager');

-- display the employees name who are working in us or uk
select concat(e.first_name,' ',e.last_name) "Emp Name",l.country_id
from employees e,departments d,locations l
where e.department_id=d.department_id 
and d.location_id=l.location_id
and l.country_id in('US','UK');

-- dsiplay worker id worker and manager name and his id
select w.employee_id "Work_ID",w.first_name "Worker",
concat(m.first_name ,' (',m.employee_id,')') "Manager_Name(ID)"
from employees w, employees m
where w.manager_id=m.employee_id;

create table job_grades(min_sal DECIMAL (8, 2),max_sal DECIMAL (8, 2),grade char) ;

insert into job_grades values(20000,40000,'A');
insert into job_grades values(10001,19999,'B');
insert into job_grades values(5001,10000,'C');
insert into job_grades values(2001,5000,'D');
insert into job_grades values(801,2000,'E');

select * from job_grades;

-- to display name and salary grade 
select e.first_name, g.grade
from employees e,job_grades g
where e.salary between g.min_sal and g.max_sal;

-- inner join but old syntax 1999
select e.last_name,d.department_name,d.department_id
from employees e join departments d
on e.department_id=d.department_id;

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id)
values(400,'siddhi','Nayak','sss@gmail',675756,'1998-09-08',4,6747.50,100);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id)
values(401,'Anu','Mehra','rrrr@gmail',675756,'1990-09-08',5,9000.50,101);

insert into departments values(12,'Technical',1800);
insert into departments values(13,'system admin',1800);
insert into departments values(14,'House keeping',1700);

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

-- full outer join
select e.first_name,d.department_name,d.department_id
from employees e right join departments d
on e.department_id=d.department_id
union 
select e.first_name,d.department_name,d.department_id
from employees e left join departments d
on e.department_id=d.department_id;
