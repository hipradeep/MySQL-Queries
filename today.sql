create database pk;


use pk;

create table emp(
emp_id int auto_increment primary key,
emp_name varchar(50)
);

desc emp;


insert into emp(emp_name) values("pradeep");
insert into emp(emp_name) values("kan");
insert into emp(emp_name) values("maurya");
insert into emp(emp_id, emp_name) values(100, "maurya3");

-- delete single row condition is must 
delete from emp where emp_id=100;

-- delete all rows
delete from emp;

select * from emp;



