use db1;
drop table e1;
drop table student1;
show tables;
create table student(
rollno int, sname varchar(30),
age int,deptno int);
desc student;

/* 1. add a column
-- add a column. phone 
-- add new column as well as constraints at the same time(column level)*/
alter table student add phone int;
desc student;

insert into student values(10,'ss',25,10,6757);
select * from student;
-- add email column.
alter table student add email varchar(30);
select * from student;
insert into student values(10,'ss',25,10,6757,'dfgds@gmail');
select * from student;
-- add email_id2
alter table student add emailid2 varchar(30) default '******';

select * from student;
desc student;
-- add the city column which can not be null
alter table student add city varchar(30) not null;
desc student;
-- add a column phone no (optional) with not null and unique
alter table student add phone2  bigint unique;
desc student;

-- add constraint( if column existing, but constraint not there, so u can add the constraint later)
-- add primary key, check,unique,foreign key but u can not add  not null
-- add primary key on roll no
alter table student add constraint c100 primary key(rollno);
 truncate table student;

desc student;

-- add primary constraint with two columns
-- for example there is emp table with following columns
create table emp(empid int, empname varchar(30), deptname varchar(30), deptno int);
desc emp;
-- add a constraint (pk)om empid and deptname
alter table emp add constraint c_pk100 primary key(empid,deptname);
desc emp;

-- add unique constraint on a perticular column
-- in student table add unique constraint on phone column. 
alter table student add constraint c_unique1 unique(phone);
desc student;
-- add the check constraint on age(<=40)
alter table student add constraint check_age check(age<=40);
desc student;

-- add foreign key on an existing column
-- example emp table
desc emp;
-- i want to add foreign key on the deptno columnon the emp table
-- then which table deptno will refer??
-- is dept table there??
-- create dept table first
create table dept (deptno int, dname varchar(20) not null);
-- add deptno as Primary key
-- alter
alter table dept add constraint c_pk2 primary key(deptno);
-- now because the reffered table dept is there. i can now change deptno as FK
alter table emp add 
constraint c_fk1 foreign key(deptno)
references dept(deptno);
-- Alter add
-- a column
-- multiple column
-- add a new column and its constraint at the same time.
-- if column exists then we cam add all constraint except not null

/* With alter we can modify
1. modify the datatype/size of a column/columns.
2. using the modify keyword you can add/remove not null constraint on an existing column

*/
-- modify the datatype of sname column from 30 to 40
desc student;

alter table student modify sname varchar(40);
desc student;
-- modify the datatype of phone column from int to bigint
alter table student modify phone bigint;
desc student;
-- modify email 30 to 40,emailid2 50 in one alter command

alter table student 
modify email varchar(40),
modify emailid2 varchar(50);
desc student;


-- 2. using the modify keyword you can 
-- add/remove not null constraint on an existing column
-- make sname column as not null
alter table  student modify sname varchar(40) not null;
desc student;

desc emp;

-- add not null on empname column
alter table emp modify empname varchar(30) not null;
desc emp;

desc dept;

-- remove the not null constraint from a column which is already defined as not null.
-- example remove not null from the dname column of dept table. 


alter table dept modify dname varchar(20);
desc dept;

-- can i add again???
alter table dept modify dname varchar(30) not null;

-- again remove
alter table dept modify dname varchar(20);
desc dept;
-- modify the dname to size 50

alter table dept modify dname varchar(50);


/* Alter with Drop
drop a column/columns
drop a constraints */

desc student;
-- drop the city column
alter table student drop column city;
-- drop multiple columns in one alter

alter table student drop column emailid2,
drop column phone2;
desc student;

-- drop primary key of student table
alter table student drop primary key;
desc student;

-- drop primary key of emp table
desc emp;
alter table emp drop primary key;
desc emp;

desc student;
-- drop the unique constraint on the phone column
-- first see the name of that constraint then drop

alter table student drop constraint c_unique1;
-- drop the check constraint
alter table student drop constraint check_age;

desc student;

-- drop the FK on emp table deptno
alter table emp drop foreign key c_fk1;


-- DML insert

insert into student(rollno,age,city,phone)  values(101,35,'delhi',76574);
insert into student(rollno) values(104);
select * from student;
insert into student(rollno,age,city,phone)  values(102,33,'delhi',76574);
insert into student(rollno,age,city,phone)  values(103,35,'delhi',07774);
select * from student;
insert into student(rollno,age,city,phone)  values
(109,33,'delhi',222),
(1010,33,'delhi',3333),
(1011,33,'delhi',44445);
