use pgdac;
select database();

create database Persion;
use Persion;
select database();

create table student(
roll_no int,
fname varchar(50),
lname varchar(50),
address varchar(50),
mobile varchar(13)
);

desc student;

create table teacher(
-- making teacher id primary key
t_id int primary key,
-- assigning default name "AAA" to teacher
fname varchar(50) default"AAA",  
lname varchar(50),
address varchar(50),
-- ensuring mobile number should not null
mobile varchar(13) not null
);
desc teacher;

-- table level giving constraint
create table department(
dep_id int,
dep_name varchar(50),  
floar_no int,
constraint c_pk_department primary key(dep_id),
constraint c_unique_department unique(dep_name)
);
create table department2(
dep_id int,
dep_name varchar(50),  
floar_no int,
 primary key(dep_id),
 unique(dep_name)
);
desc department2;
create table book(
isbn int,
book_name varchar(50),  
author_name varchar(50),
constraint c_pk_department primary key(isbn, author_name )
);

desc book;
select 
constraint_name, table_name, column_name
from information_schema.key_column_usage 
where 
table_name='book';

SELECT 
  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
TABLE_NAME='book';