
CREATE DATABASE Fury;
use fury;
/*
Sailors(sid: integer, sname: string, rating: integer, age: real);
Boats(bid: integer, bname: string, color: string);
Reserves(sid: integer, bid: integer, day: date). */

CREATE table Sailors(
sid int PRIMARY key,
sname VARCHAR(50),
rating INT,
age DOUBLE (2,2)
);

CREATE table Boats(
bid int PRIMARY key,
bname VARCHAR(50),
color VARCHAR(10)
);
CREATE table Reserves(
sid int ,
bid int ,
day DATE,
 CONSTRAINT c_pk_reserves PRIMARY KEY(sid, bid)
);
alter table Reserves add constraint c_fk_Reserves 
foreign key(sid) references Sailors(sid);
alter table Reserves add constraint c_fk_Reserves2 
foreign key(bid) references Boats(bid);
alter table Sailors modify age real;

-- insert data in Sailors table
insert INTO Sailors VALUES(22,'Dustin',7,45);
insert INTO Sailors VALUES(29,'Brutus',1,33);
insert INTO Sailors VALUES(31,'Lubber',8,55.5);
insert INTO Sailors VALUES(32,'Andy',8,25.5);
insert INTO Sailors VALUES(58,'Rusty',10,35);
insert INTO Sailors VALUES(64,'Horatio ',7,35);
insert INTO Sailors VALUES(71,'Zorba ',10,16);
insert INTO Sailors VALUES(74,'Horatio ',9,40);
insert INTO Sailors VALUES(85,'Art',3,25.5);
insert INTO Sailors VALUES(95,'Bob',3,63.5);

-- insert data in Boats table
insert INTO Boats VALUES(101, 'Interlake ', 'blue');
insert INTO Boats VALUES(102, 'Interlake ', 'red');
insert INTO Boats VALUES(103, 'Clipper ', 'green');
insert INTO Boats VALUES(104, 'Marine ', 'red');

-- insert data in Reserves table
insert INTO Reserves VALUES(22, 101, '1998-10-10');
insert INTO Reserves VALUES(22, 102,'1998-10-10');
insert INTO Reserves VALUES(22, 103,'1998-10-8');
insert INTO Reserves VALUES(22, 104,'1998-10-7');
insert INTO Reserves VALUES(31, 102,'1998-11-10');
insert INTO Reserves VALUES(31, 103,'1998-11-6');
insert INTO Reserves VALUES(31, 104,'1998-11-12');
insert INTO Reserves VALUES(64, 101,'1998-9-5');
insert INTO Reserves VALUES(64, 102,'1998-9-8');
insert INTO Reserves VALUES(74, 103,'1998-9-8');


-- Display the name of the sailors with highest ratings
select sname 'Name', rating
from Sailors
where rating = (  select max(rating)  from Sailors);

-- Count the no .of sailors with rating 10.
select count(sid) '#', rating
from Sailors
where rating = 10;

-- Count the number of different sailors.
 select count(sid) '#'
 from Sailors;

-- Calculate the average age of all sailors. 
 select avg(age) 'Avg Age'
 from Sailors;

-- Find the name and the age of the oldest sailor. 
 select age 'Age', sname 'Name'
 from Sailors
 WHERE age= (SELECT max(age) from Sailors);

-- Find the name and the age of the youngest sailor.
 select age 'Age', sname 'Name'
 from Sailors
 WHERE age= (SELECT min(age) from Sailors);
 
-- Find all information of sailors who have reserved boat number 101.
select s.sname 'Name', s.rating 'Rating', s.age 'Age', b.bname 'Boat Name', b.color 'Color '
from Sailors s, Boats b, Reserves r
WHERE b.bid=101 and s.sid=r.sid and b.bid=r.bid;

-- Find the names of sailors who have reserved a red boat, and list in the order of age.
select s.sname 'Name',s.age 'Age' , b.bname 'Boat Name'
from Sailors s, Boats b, Reserves r
WHERE b.color='red' and s.sid=r.sid and b.bid=r.bid
ORDER BY s.age;

-- Find the names of sailors who have reserved at least one boat.
select DISTINCT s.sname 'name ', s.age 'Age'
from Sailors s, Boats b, Reserves r
WHERE s.sid=r.sid and b.bid=r.bid;

-- Display the sailor name who have reserved on more than 2 dates.


-- Find the ids and names of sailors who have reserved two different boats on the same day.




