
-- CREATING A DATABASE NAME INSTITUTE

CREATE DATABASE INSTITUTE;

-- display database
SHOW DATABASES;

-- select the database to work on
USE INSTITUTE;

-- Table-1 create table name department  
CREATE TABLE department(
deptId INT PRIMARY KEY,
name VARCHAR(50),
hod VARCHAR(25),
phone BIGINT 
);

-- displaying table
DESC department;

-- Table-2 create table name course 
CREATE TABLE course(
courseId INT PRIMARY KEY,
cname VARCHAR(50),
credits VARCHAR(25),
deptNo INT 
);

-- displaying table
DESC course;

-- adding foreign key to deptNo in course table in reference to department table's deptId
ALTER TABLE course add constraint c_fk_course FOREIGN KEY(deptNo) REFERENCES department(deptId);

-- displaying altered table
DESC course;

-- Table-3 create table name professor  
CREATE TABLE professor(
empId INT PRIMARY KEY,
name VARCHAR(50),
sex VARCHAR(10),
startYear DATE,
deptNo INT,
phone BIGINT
);


 
-- displaying table
DESC professor;

-- adding foreign key to deptNo in professor table in reference to department table's deptId
ALTER TABLE professor add constraint c_fk_professor FOREIGN KEY(deptNo) REFERENCES department(deptId);

-- displaying altered table
DESC professor;


-- Table-4 create table name student  
CREATE TABLE student (
rollNo INT PRIMARY KEY ,
name VARCHAR(50),
degree VARCHAR(15),
year INT,
sex VARCHAR(6),
deptNo INT,
advisor INT
);

-- displaying table
DESC student;

-- adding foreign key to deptNo in student table in reference to department table's deptId and
ALTER TABLE student add constraint c_fk_student1 FOREIGN KEY(deptNo) REFERENCES department(deptId);

-- adding second foreign key to advisor in student table in reference to course table's empId
ALTER TABLE student add constraint c_fk_student2 FOREIGN KEY(advisor) REFERENCES professor(empId);

-- displaying altered table
DESC student;


-- Table-5 create table name enrollment   
CREATE TABLE enrollment (
rollNo INT ,
courseId INT,
sem VARCHAR(5),
year INT,
grade CHAR
);

-- displaying table
DESC enrollment;

-- adding  primary keys to group of rollNo, courseId, sem and year  in enrollment table 
ALTER TABLE enrollment add constraint c_pk_enrollment PRIMARY KEY(rollNo, courseId, sem, year) ;

-- adding foreign key to courseId in enrollment table in reference to course table's courseId
ALTER TABLE enrollment add constraint c_fk_enrollment FOREIGN KEY(courseId) REFERENCES course(courseId);

-- displaying altered table
DESC enrollment;

drop TABLE teaching;
-- Table-6 create table name teaching    
CREATE TABLE teaching  (
empId INT,
courseId INT,
sem VARCHAR(5),
year INT,
classRoom INT
);

-- displaying table
DESC teaching;

-- adding  primary keys to group of empId, courseId, sem and year  in teaching table 
ALTER TABLE teaching add constraint c_pk_teaching PRIMARY KEY(empId, courseId, sem, year) ;

-- adding foreign key to empId in teaching table in reference to professor table's empId
ALTER TABLE teaching add constraint c_fk_teaching FOREIGN KEY(empId) REFERENCES professor(empId);

-- adding second foreign key to courseId in teaching table in reference to course table's courseId
ALTER TABLE teaching add constraint c_fk_teaching2 FOREIGN KEY(courseId) REFERENCES course(courseId);

-- displaying altered table
DESC teaching;

-- Table-7 create table name preRequisite     
CREATE TABLE preRequisite   (
preReqCourse INT,
courseId INT
);

-- displaying table
DESC preRequisite;

-- adding  primary keys to group of preReqCourse and courseId in preRequisite table 
ALTER TABLE preRequisite add constraint c_pk_preRequisite PRIMARY KEY(preReqCourse, courseId) ;

-- adding second foreign key to preReqCourseand in preRequisite table in reference to course table's courseId
ALTER TABLE preRequisite add constraint c_fk_preRequisite FOREIGN KEY(preReqCourse) REFERENCES course(courseId);

-- adding foreign key to courseId in teaching table in reference to course table's courseId
ALTER TABLE preRequisite add constraint c_fk_preRequisite2 FOREIGN KEY(courseId) REFERENCES course(courseId);

-- displaying altered table
DESC preRequisite;


-- ADDING DATA TO TABLES 
-- ADD DATA TO TABLE-1 DEPARTMENT
INSERT INTO department(deptId, name, hod, phone) values(1, "Science", "Ramesh singh", 9825454586);
INSERT INTO department(deptId, name, hod, phone) values(2, "Math", "Kamlesh", 9856458986);
INSERT INTO department(deptId, name, hod, phone) values(10, "Art", "Prkash singh", 7725454586);
INSERT INTO department(deptId, name, hod, phone) values(4, "Bio", " Manoj singh", 8844454586);

-- showing  all data of department table
SELECT * FROM department;

-- ADD DATA TO TABLE-2  COURSE
INSERT INTO course(courseId, cname, credits, deptNo) values(1, "Physics", "IV", 1);
INSERT INTO course(courseId, cname, credits, deptNo) values(2, "Calculus", "V", 2);
INSERT INTO course(courseId, cname, credits, deptNo) values(4, "Algebra", "I", 2);
INSERT INTO course(courseId, cname, credits, deptNo) values(7, "botany", "IV", 4);

-- showing  all data of department table
SELECT * FROM course;

-- ADD DATA TO TABLE-3 PROFESSOR
INSERT INTO professor(empId, name, sex, startYear, deptNo, phone) values(1, "Sanjay kanujiya", "MALE", 2014, 2, 7856894255);


-- showing  all data of department table
SELECT * FROM professor;

