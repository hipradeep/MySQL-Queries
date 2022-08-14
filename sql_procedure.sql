

USE `dbcollage`;
DROP procedure IF EXISTS `new_procedure2`;

DELIMITER $$
CREATE PROCEDURE new_procedure2 ()
BEGIN
SELECT * from emp;
END$$

DELIMITER ;

call new_procedure2();

-- get all emps
DELIMITER $$
CREATE PROCEDURE getAllEmp ()
BEGIN
SELECT * from emp;
END$$

DELIMITER ;

call getAllEmp();

--  get simgle emp
-- get all emps
DELIMITER $$
CREATE PROCEDURE getSimgleEmp ()
BEGIN
SELECT * from emp where id=1;
END$$

DELIMITER ;

call getSimgleEmp();

-- we can pass value of id while calling
-- get emp by id
DELIMITER $$
CREATE PROCEDURE getEmpByID (in e_id int)
BEGIN
SELECT * from emp where id=e_id;
END$$

DELIMITER ;

-- 'in' is default


call getEmpByID(1);
call getEmpByID(7);

delimiter //
create procedure P1()
begin
declare x int;
declare y int;
declare z int;
set x=80;
set y=20;
set z=x+y;
select z;
end//

call p1();

DROP procedure IF EXISTS `P2`;
delimiter //
create procedure P2(in x int,in y int)
begin
declare z int;
set z=x+y;
select z as "addition";
end//
-- call the procedure
call p2(10,30);

-- example out type of parameter in procedure
delimiter //
create procedure P3(in x int,in y int,out z int)
begin
set z=x+y;
end//

-- call the procedure
call p3(10,20,@d);
select @d;


delimiter //
create procedure emp_limit(in startin int,in ending int)
begin
select * from emp limit startin,ending;
end//

call emp_limit(4, 5);

select count(*)  from emp group by occ 
order by count(*) desc limit 3
; 

select * from emp;
update emp set occ='it' where id=3;
