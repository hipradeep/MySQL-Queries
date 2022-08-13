
-- creating a DB

-- it will check before creating a db
--  if exits show messege, not error
CREATE DATABASE IF NOT EXISTS dbcollage;
-- or
-- if exits show error
CREATE DATABASE  dbcollage;

-- show perticuler database
SHOW CREATE DATABASE dbcollage;   

-- show all database
 SHOW DATABASES;   
 
 -- select databse to work
  USE dbcollage;
  
  -- show all databases which start with fury
  SHOW DATABASES LIKE 'fu%';
  
-- or
SELECT 
    schema_name
FROM
    information_schema.schemata
WHERE
    schema_name LIKE 'fu%';  
  
-- drop database
DROP DATABASE IF EXISTS database_name;  
-- or
DROP DATABASE dbcollage;   
 
 -- create table
 CREATE TABLE emp(  
    id int NOT NULL AUTO_INCREMENT,  
    name varchar(45) NOT NULL,  
    occupation varchar(35) NOT NULL,  
    age int NOT NULL,  
    PRIMARY KEY (id)  
);  
 
 SHOW TABLES;  
 
  DESCRIBE emp;  
 
 
 desc information_schema.key_column_usage;
 
 use information_schema;
 
 desc key_column_usage;
 -- seeing the table information
select TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE
from information_schema.table_constraints
where table_name='emp';


CREATE TABLE student(
roll_no INT PRIMARY KEY,
name VARCHAR(30) not NULL,
age INT CHECK(age >= 28),
salary INT CHECK(salary BETWEEN 10000 and 40000),
country VARCHAR(25),
CONSTRAINT c_chk_country CHECK(country in ('India', 'Nepal'))
);
 
 alter table student add CONSTRAINT cstn_unique_student UNIQUE (roll_no);
 alter table student add CONSTRAINT cstn_primary_key_student primary key (roll_no);
 alter table student add CONSTRAINT cstn_check_student check(roll_no > 100);
 
 SELECT * FROM emp;

INSERT INTO `dbcollage`.`emp` (`id`, `name`, `occupation`, `age`) VALUES ('1', 'keshav', 'ec', '32');
INSERT INTO `dbcollage`.`emp` (`id`, `name`, `occupation`, `age`) VALUES ('2', 'pradeep', 'it', '25');
INSERT INTO `dbcollage`.`emp` (`id`, `name`, `occupation`, `age`) VALUES ('3', 'maurya', 'me', '42');
INSERT INTO `dbcollage`.`emp` (`id`, `name`, `occupation`, `age`) VALUES ('4', 'kokila', 'bio', '28');
INSERT INTO `dbcollage`.`emp` (`id`, `name`, `occupation`, `age`) VALUES ('5', 'ram', 'law', '66');
INSERT INTO `dbcollage`.`emp` (`id`, `name`, `occupation`, `age`) VALUES ('6', 'mohan', 'ki', '40');


desc dbcollage.emp;

SELECT * FROM emp;

update emp set age = 45;
update emp set age = 25 where name='pradeep';
update emp set name = 'kokila' where name='keshav';

-- delete all row
delete from emp;

-- delete all row
delete from emp where age =25;

-- display only 2
SELECT * FROM emp LIMIT 2;
-- display afer 2nd row
SELECT * FROM emp LIMIT 2, 2;

-- display the employee detail in the ascending order of their age
SELECT * FROM emp ORDER BY age ASC;
SELECT * FROM emp ORDER BY age desc;
SELECT * FROM emp ORDER BY age desc , name asc;
 
 
 