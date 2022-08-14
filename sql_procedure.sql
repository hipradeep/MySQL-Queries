

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



