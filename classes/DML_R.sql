create database student_information_system;
use student_information_system;
create table student(
rollNo int primary key,
sName varchar(30) not null,
degree varchar(20),
years int,
sSex varchar(1),
deptNo	int,
advisor varchar(10)
);
desc student;

alter table student change sName stu_name varchar(30);

-- table department
create table department(
deptId int primary key,
dName varchar(20) not null,
hod int,
dPhone bigint unique
);
desc department;

-- table professor
create table professor(
empId int primary key,
eName varchar(30) not null,
pSex varchar(1),
startYear year,
deptNo int,
pPhone bigint
);
desc professor;

-- table course
create table course(
courseId int primary key,
cName varchar(30) not null unique,
credits int,
deptNo int references department(deptNo)
);

-- table enrollment
create table enrollment(
rollNo int,
courseId int,
sem bit,
eYear year,
grade varchar(1),
Primary key (rollNo,courseId,sem,eYear)
);
desc enrollment;

-- table teaching 
create table teaching(
empId int,
courseId int,
sem bit,
tYear year,
classRoom varchar(2),
primary key (empId,courseId,sem,tYear)
);
desc teaching;

-- table preRequisite
create table preRequisite(
preReqCourse int,
courseId int,
primary key (preReqCourse,courseId)
);
desc preRequisite;

/* refrencing for student */
alter table student 
add constraint fk_deptNo
foreign key (deptNo)
references department(deptId)
;

alter table student 
add constraint fk_advisor
foreign key (advisor)
references professor(empId)
;

/*error while adding due to diff datatype 
changing datatype of student's advisor to same as professor empId ie int*/
alter table student 
modify advisor int;
desc student;

-- retrying for refrencing
alter table student 
add constraint fk_advisor1
foreign key (advisor)
references professor(empId)
;

desc student;
desc professor;




/* refrencing  for department */
alter table department
add constraint fk_hod
foreign key (hod)
references professor(empId)
;

/* refrencing  for course */
alter table course
add constraint fk_CoursedeptNo
foreign key (deptNo)
references department(deptId)
;

/* refrencing  for enrollment */
alter table enrollment
add constraint fk_courseID
foreign key (courseId)
references course(courseId)
;

alter table enrollment
add constraint fk_rollno
foreign key (rollNo)
references student(rollNo)
;

/* refrencing  for teachnig */
alter table teaching
add constraint fk_tcourseID
foreign key (courseId)
references course(courseId)
;
desc teaching;
alter table teaching
add constraint fk_empID
foreign key (empId)
references professor(empId)
;

desc preRequisite;
/* refrencing  for preRequisite */
alter table preRequisite
add constraint fk_preCourseID1
foreign key (courseId)
references course(courseId)
;
alter table preRequisite
add constraint fk_preCourseID2
foreign key (preReqCourse)
references course(courseId)
;

select constraint_name,table_name,column_name,
REFERENCED_TABLE_SCHEMA,
REFERENCED_TABLE_NAME,
REFERENCED_COLUMN_NAME
from information_schema.key_column_usage
where table_name='preRequisite';

alter table teaching drop foreign key fk_empNO;


desc cdac.student12;
desc cdac.course11;

insert into cdac.student12(rollno,sname)
values(104,'rrr');

select * from cdac.student12;
use cdac;
select database();

desc course11;

insert into course11(cid,cname) values('c1','pgdbda');
-- no need to mention the column name because we are inserting value to all column
insert into course11 values('c2','pgdac');
-- raed data from the table
select * from course11;

-- update command that will affect the whole table/ all rows.
update student12
set cid='c2';
-- when i have to update the row value of a specific column
-- example update the course of student 101 to c1

update student12
set cid='c1'
where rollno=101;

insert into student12 values(105,'sss','c1');

select * from student12;
-- example update the course of student 103 to c2
update student12
set cid='c1'
where rollno=103;

select * from student12;

use student_information_system;

-- 1. insert to student table
desc student;

insert into student(rollno,stu_name,degree,years,sSex)
values(113,'rrr','BTech',2020,'M');

insert into student(rollno,stu_name,degree,years,sSex)
values(114,'eee','BE',2021,'F');

select * from student;

desc department;

insert into department(deptid,dname,dphone)
values(10,'HR',678686);

insert into department(deptid,dname,dphone)
values(12,'Finance',234234);
insert into department(deptid,dname,dphone)
values(30,'IT',77777);
select * from department;
select * from student;

update student 
set deptno=30
where rollno=111;

select * from student;

update student 
set deptno=10
where rollno=111;

update student 
set deptno=12
where rollno in (111,113);

update student 
set deptno=30
where rollno=112 or rollno=114;

select * from student;

-- autoincrement increments by 1
desc student;
alter table student modify rollNo int auto_increment;



create table e1 ( empid int primary key,ename varchar(20));
insert into e1 values(1002,'b');
select * from e1;
alter table e1 modify empid int auto_increment;

insert into e1(ename) values('d');
insert into e1 values(5000,'r');
select * from e1;
insert into e1(ename) values('ss');