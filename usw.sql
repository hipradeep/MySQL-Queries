

use org1;

select * from empnew;
select * from newtable;
select * from accountnew;
select * from employeenew;
drop table accountnew;
drop table employeenew;





create database LMS;
use LMS;

create table books(
ISBN varchar(20) primary key,
bname varchar(50), 
aname varchar(50) , 
price DECIMAL(4,2), 
qty int 
);
ALTER TABLE books ADD amount DECIMAL(5,2) ;
ALTER TABLE books MODIFY  COLUMN amount DECIMAL(10,2);
ALTER TABLE books MODIFY  COLUMN price DECIMAL(10,2);
desc books;

select * from books;


select * from std;

create table books(
ISBN varchar(20) primary key,
bname varchar(200), 
aname varchar(100) , 
price DECIMAL(10,2), 
qty int 
);
ALTER TABLE books ADD id int NOT NULL auto_increment  PRIMARY KEY;
ALTER TABLE books DROP COLUMN amount;
 alter table books DROP PRIMARY KEY;
select * from books;
 desc books;
 
 DROP TABLE books;

create table books(
id int not null auto_increment primary key,
ISBN varchar(20) ,
bname varchar(200), 
aname varchar(100) , 
price DECIMAL(10,2), 
qty int 
);


create table admin(
id int not null auto_increment primary key,
userid varchar(20) ,
pass varchar(200)
);


insert into admin(userid, pass) values("prdp", "1234");

select * from admin where userid="prdp";

select * from admin;

select * from student;
use org1;
create table student(
id int not null auto_increment primary key,
rollno int ,
name varchar(200), 
address varchar(100) , 
mobile varchar(15) , 
class varchar(10) , 
password varchar(10) 

);
desc student;
select * from employeelogin;

DELETE FROM student WHERE name = "pradeep2";


