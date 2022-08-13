
CREATE DATABASE SPRINGLEARN;
USE SPRINGLEARN;

CREATE TABLE STUDENT(
ID INT PRIMARY KEY,
NAME VARCHAR(100),
ADDRESS VARCHAR(200)
);

insert into  student values( 1, 'pradeep','lko');
insert into  student values( 2, 'maurya','ghp');
insert into  student values( 3, 'keshav','ip');
insert into  student values( 4, 'praveen','mai');

select * from student_details;
select * from student;
select * from student_info;