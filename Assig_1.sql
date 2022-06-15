create database asg_1;

use asg_1;

drop table department;

-- info about constraints
select TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE
from information_schema.table_constraints
where table_name='department';

select constraint_name,table_name,column_name,
REFERENCED_TABLE_SCHEMA,
REFERENCED_TABLE_NAME,
REFERENCED_COLUMN_NAME
from information_schema.key_column_usage
where table_name='prerequisite';


-- table 1 student
create table student
(
rollno int,
sname varchar(35) not null,
degree varchar(20),
dyear int,
sex varchar(1),
deptno int,
advisor varchar(30)
);
desc student;


-- table 2 department
create table department
(
deptid int,
dname varchar(30) not null,
hod varchar(20),
phone bigint
);
desc department;


-- table 3 professor
create table professor
(
empid varchar(30),
ename varchar(35) not null,
sex varchar(1),
startyear int,
deptno int,
phone bigint
);


-- table 4 course
create table course
(
courseid varchar(30),
cname varchar(25) not null,
credits int,
deptno int
);


-- table 5 enrollment
create table enrollment(
rollno int,
courseid varchar(30),
sem int,
eyear int,
grade varchar(5)
); 


-- table 6 teaching
create table teaching(
empid varchar(30),
courseid varchar(30),
sem int,
eyear int,
classroom int
); 


-- table 7 prerequisite
create table prerequisite(
prereqcourse varchar(30),
courseid varchar(30)
); 


/* 
defining constraints
first define all primary keys of all tables then define foreign keys 
*/

-- table 1 student
alter table student add constraint c_pk_student 
primary key(rollno);
alter table student add constraint c_fk_student 
foreign key(deptno) references department(deptid);
desc student;
alter table student add constraint c_fk2_student 
foreign key(advisor) references professor(empid);
desc student;

-- table 2 department
alter table department add constraint c_pk_department
primary key(deptid);
alter table department add constraint c_fk_department
foreign key(hod) references professor(empid);
desc department;


-- table 3 professor
alter table professor add constraint c_pk_professor
primary key(empid);
alter table professor add constraint c_fk_professor
foreign key(deptno) references department(deptid);
desc professor;


-- table 4 course
alter table course add constraint c_pk_course
primary key(courseid);
alter table course add constraint c_fk_course
foreign key(deptno) references department(deptid);
describe course;


-- table 5 enrollment
alter table enrollment add constraint c_pk_enrollment
primary key(rollno,courseid,sem,eyear);
alter table enrollment add constraint c_fk_enrollment
foreign key(courseid) references course(courseid);
desc enrollment;


-- table 6 teaching
alter table teaching add constraint c_pk_teaching
primary key(empid,courseid,sem,eyear);
alter table teaching add constraint c_fk1_teaching
foreign key(empid) references professor(empid);
alter table teaching add constraint c_fk2_teaching
foreign key(courseid) references course(courseid);
describe teaching;


-- table prerequisite
alter table prerequisite add constraint c_pk_prerequisite
primary key(prereqcourse,courseid);
alter table prerequisite add constraint c_fk_prerequisite
foreign key(courseid) references course(courseid);
alter table prerequisite add constraint c_fk2_prerequisite
foreign key(prereqcourse) references course(courseid);
desc prerequisite;



