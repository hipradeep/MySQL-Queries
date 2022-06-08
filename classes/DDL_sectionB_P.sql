-- show the list of available databases
show databases;
-- create our own user defined table
create database db3;
-- change to a perticular database to work
use db1;
-- to know the name of current database
select database();
-- switch to cdacnoida
use cdacnoida;
select database();

use sakila;
select database();

use cdacnoida;
-- create a table
-- command to be used is  -> CREATE
create table student(
roll_no int,
s_name varchar(30),
age int,
dob date,
phone bigint
);

-- display the structure of the table
desc student;

/* constraints on the table
1. unique key integration constraint -> primary key
2. Referential integration constraint-> Foreign key
3. Not null constraint
4. unique key constraint
5. check constraint

*/
-- create primary key on a table student.
-- defining the constraint at the time of column definition
-- column level constraint
create table student2(
roll_no int primary key,
s_name varchar(20) default 'aaa',
age int
);
-- see the structure
desc student2;
-- table level constraint defining
create table student3(
roll_no int,
s_name varchar(20),
age int,
constraint c_pk_student3 primary key(roll_no)
);

desc student3;

create table book1(
isbn int ,
author varchar(30) ,
tirle varchar(50),
constraint c11 primary key(isbn,author)
);
desc book;

-- define not null constraint

create table student4(
roll_no int,
s_name varchar(30) not null,
age int,
phone_no bigint not null,
primary key(roll_no)
);
desc student4;


create table student5(
roll_no int primary key,
s_name varchar(30) not null,
age int,
phone_no bigint not null
);
desc student5;

-- unique constraint definition

create table student6
(
rollno int primary key,
s_name varchar(40) not null,
age int,
phone_no bigint unique,
email_id varchar(30) unique
);

desc student6;


create table student7
(
rollno int primary key,
s_name varchar(40) not null,
age int,
phone_no1 bigint not null unique,
phone_no2 bigint unique,
email_id varchar(30) unique
);

desc student7;

create table student8
(
rollno int ,
s_name varchar(40) not null,
age int,
phone_no1 bigint not null ,
phone_no2 bigint ,
email_id varchar(30) unique,
constraint d1 primary key(rollno),
constraint d2 unique(phone_no1),
constraint d3 unique(phone_no2)
);

desc student8;

create table student9
(
rollno int ,
s_name varchar(40) not null,
age int,
phone_no1 bigint not null ,
phone_no2 bigint ,
email_id varchar(30) unique,
constraint d1 primary key(rollno),
constraint d2 unique(phone_no1,phone_no2)
);

desc student9;

select constraint_name,table_name,column_name
from information_schema.key_column_usage
where table_name='student9';
select database();

use cdacnoida;
show tables;
show databases;

desc information_schema.key_column_usage;


use information_schema;
show tables;

desc key_column_usage;
desc table_constraints;

select TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE
from table_constraints
where table_name='student9';
select constraint_name,table_name,column_name
from key_column_usage
where table_name='student9';

use cdacnoida;
-- check constraint example
create table student10
(rollno int ,
sname varchar(30) not null,
age int check (age<=35),
country varchar(10),
state varchar(20),
phoneno bigint,
constraint c1 primary key(rollno),
constraint c_chk_country check(country in('india','Nepal')),
constraint c_unique1 unique(phoneno)
);

desc student10;

select TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE
from information_schema.table_constraints
where table_name='student10';
select constraint_name,table_name,column_name
from information_schema.key_column_usage
where table_name='student10';


-- foreign key at column level
create table course
(
cid varchar(10) primary key,
cname varchar(40) not null
);

create table student11(
rollno int primary key,
sname varchar(30) not null,
age int,
phone_no bigint,
cid varchar(10) references course(cid)
);
desc student11;
-- foreign key at table level
create table student12(
rollno int primary key,
sname varchar(30) not null,
age int,
phone_no bigint,
cid varchar(10),
constraint  fk_cid_student_course foreign key(cid) references course(cid)
);
desc student12;


select TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE
from information_schema.table_constraints
where table_name='student12';

select constraint_name,table_name,column_name,
REFERENCED_TABLE_SCHEMA,
REFERENCED_TABLE_NAME,
REFERENCED_COLUMN_NAME
from information_schema.key_column_usage
where table_name='student12';

desc information_schema.key_column_usage;

show tables;


-- to create a copy of a table
-- create a new table student_detail by copying the structure from student
create table student_detail as select * from student;
desc student_detail;
select * from student;

create table student_info as select * from student;

-- remove a table
-- drop command
drop table student;
desc student;
desc student_info;
insert into student_info values (103,'priti',37,'1988-09-23',5757566);
select * from student_info;
-- truncate a table
truncate table student_info;
select * from student_info;
insert into student_info values (103,'priti',37,'1988-09-23',5757566);
insert into student_info(roll_no,phone,s_name) values (103,5757566,'siddhi');
insert into student_info values (103,NULL,37,'1988-09-23',5757566);
select * from student_info;
desc student_info;

-- Rename a table

rename table student_detail to student;

select * from student;


/* Alter command
1. Add a column/ add multiple columns
2. modify the data type/size column/columns/ add /remove not null constraint
3. remove a column/multiple columns
4. add a constraint
5. drop a constraint
*/

desc student;
-- to add the email id column in the student table
alter table student add email_id varchar(20);
desc student;
-- add multple columns such as country and state
alter table student add (country varchar(10), state varchar(10));
desc student;














