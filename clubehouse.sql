
create database clubhouse;
use clubhouse;


create table members(
id int not null auto_increment primary key,
aadhar varchar(20),
name varchar(50), 
email varchar(50) , 
age int , 
phone varchar(50) , 
address varchar(100),
password varchar(25)
);

desc members;

select * from members;

-- drop table members;

create table admin(
id int not null auto_increment primary key,
userid varchar(20) ,
pass varchar(200)
);

insert admin values(1, 'admin' ,'1234');

select * from admin;