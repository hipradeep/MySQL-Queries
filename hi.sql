use pk;

create table student10(
rollno int ,
s_name varchar(40) not null,
age int,
phone_no1 bigint not null ,
phone_no2 bigint ,
email_id varchar(30) unique,
constraint c_pk_roll_no primary key(rollno),
constraint c_inq_phone_no unique(phone_no1,phone_no2)
);

desc student9;

select constraint_name,table_name,column_name
from information_schema.key_column_usage
where table_name='student10';

select TABLE_NAME,CONSTRAINT_NAME,CONSTRAINT_TYPE
from table_constraints
where table_name='student10';

select table_name,constraint_name,column_name
from key_column_usage
where table_name='student10';

desc information_schema.key_column_usage;

use information_schema;
show tables;
desc key_column_usage;
desc table_constraints;

select database();

-- foreign key at column level
create table course
(
cid varchar(10) primary key,
cname varchar(40) not null
);

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


drop table student12;
use pk;

CREATE TABLE student(
roll_no INT,
sname VARCHAR(40)
);

ALTER TABLE student add email_id VARCHAR(24);

SELECT * FROM student;

desc student;
-- making roll_no primary ket in student table
ALTER TABLE student add PRIMARY KEY (roll_no);


