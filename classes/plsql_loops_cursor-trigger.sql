-- if else 3 update the 
/*Q1 user will inout a no. check the no is even or odd
Q2 user will enter the eid,update his salary according the following criteria
<1000 30% hike
1001 to 2000 20%hike
>2000 then 10% hike
*/
delimiter $$
 create procedure updateempsal(in empno1 int)
 begin 
 declare newsal int;
 declare sal1 int;
 
 select sal into sal1 from emp where empno=empno1;
 select 'original salary of', empno1, sal1;
 
  if sal1<1000 then 
  set newsal=sal1*0.3;
	update emp set sal=sal1+newsal where empno=empno1;
    commit; /* makes permanent any changes made to the database during the current transaction*/
 elseif sal1 between 1001 and 2000  then
 set newsal=sal1*0.2;
 update emp set sal=sal1+newsal where empno=empno1;
else 
    set newsal=sal1*0.1;
	update emp set sal=sal1+newsal where empno=empno1;
  end if;  
  
 end $$
 
 call updateempsal(103);
 
 select * from emp;
 
 -- switch case --> case
 case var
 when 'value' then
	action
 when 'value' then
	action
 when 'value' then
	action
else
	action
end case;
    
 
 -- switch case example
 DELIMITER $$
 
CREATE PROCEDURE jobhike(in  e1 int)
BEGIN
    DECLARE jobtype varchar(50);
 
    SELECT job INTO jobtype 
    FROM emp
    WHERE empno=e1;
    
 CASE jobtype
 WHEN  'MANAGER' THEN
    select '10% hike';
 WHEN 'ANALYST' THEN
    select '20% hike';
WHEN 'PRESIDENT' THEN
    select '30% hike';
 ELSE
    select 'No change in salary';
 END CASE;
 
END$$

call jobhike(108);

delimiter //
create procedure chkdept()
begin
SELECT 
    SUM(CASE
        WHEN deptno = 10 THEN 1
        ELSE 0
    END) AS 'department 10',
    SUM(CASE
        WHEN deptno = 20 THEN 1
        ELSE 0
    END) AS 'department 20',
    SUM(CASE
        WHEN deptno=30 THEN 1
        ELSE 0
    END) AS 'department 30',
       COUNT(*) AS 'Total'
FROM
   emp;
   end //
   
  call chkdept(); 


/* Using CASE expression in the ORDER BY clause example
The following example uses the CASE expression to sort customers by states if the state is not NULL, 
 or sort the country in case the state is NULL:*/

SELECT 
    ename,sal,comm
FROM
    emp
ORDER BY (
    CASE
	WHEN comm IS NULL 
            THEN sal
	ELSE comm
END);


-- loop

/* LOOP
   
    -- terminate the loop
    IF condition THEN
        LEAVE [label];
    END IF;
    ...
END LOOP; */


 delimiter $$
 CREATE PROCEDURE test_mysql_loop()
 BEGIN
 DECLARE x  INT;
 DECLARE str  VARCHAR(255);
        
 SET x = 1;
 SET str =  '';
        
 loop_label:  LOOP
 IF  x > 10 THEN 
 LEAVE  loop_label;
 END  IF;
            
 SET  x = x + 1;
 IF  (x mod 2) THEN
 ITERATE  loop_label;
 ELSE
                SET  str = CONCAT(str,x,',');
 END  IF;
         END LOOP;    
 
         SELECT str;
 
 END $$
 
 call test_mysql_loop();

use hrms;
-- loop 2
delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `loopn`()
BEGIN
declare i int;
set i= 1;

	loop_label: LOOP
		if i>10 then
			leave loop_label;
		else 
        select i;
		set i = i+1;
        iterate loop_label;
		end if;
		end LOOP;
END //

call loopn();

-- loop 2
delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `loopn2`()
BEGIN
declare i int;
DECLARE str  VARCHAR(255);
set i= 1;
set str=' ';
	loop_label: LOOP
		if i>10 then
			leave loop_label;
		else 
        
		set i = i+1;
        SET  str = CONCAT(str,i,',');
        select str;
        iterate loop_label;
		end if;
		end LOOP;
END //

call loopn2();

-- example of while loop


DELIMITER $$
 CREATE PROCEDURE test_while_loop1()
 BEGIN
 DECLARE x  INT;
 SET x = 1;
 WHILE x <= 10 DO
 select x;
 SET  x = x + 1; 
 END WHILE;
 END $$
 
 call test_while_loop1();
 
 -- factorial of anumber using while loop
 delimiter //
 CREATE PROCEDURE fact(IN x INT)
   BEGIN
   DECLARE fact INT;
   DECLARE i INT;
   SET fact = 1;
   SET i = 1;
   WHILE i <= x DO
   SET fact = fact * i;
   SET i = i + 1;
   END WHILE;
   SELECT x AS Number, fact as Factorial;
  END//

call fact(6);

-- Example of repeat loop


DELIMITER $$
 CREATE PROCEDURE mysql_test_repeat_loop()
 BEGIN
 DECLARE x INT;
 DECLARE str VARCHAR(255);
        
 SET x = 1;
 SET str =  '';
        
 REPEAT
 SET  str = CONCAT(str,x,',');
 SET  x = x + 1; 
        UNTIL x  > 5
        END REPEAT;
 
        SELECT str;
 END$$
 
 call mysql_test_repeat_loop();
 
 
-- example 2 on repeat 


DELIMITER //
CREATE PROCEDURE repeattest()
   BEGIN
      DECLARE num INT default 1;
      DECLARE res Varchar(50) default '';
      REPEAT
         SET res = CONCAT(res,num,',');
         SET num = num*5;
      UNTIL num > 78125
      END REPEAT;
      SELECT res;
   END //
   
   call repeattest()
   
   
   use hrms;
   
   -- cursor example
   delimiter $$
create procedure cursor_test(in eid int)
begin
declare sal1 int;
declare c1 cursor for
select salary from employees where employee_id=eid;
open c1;
 fetch c1 into sal1;
 close c1;
 select sal1;
 end$$
call cursor_test(101);


  -- cursor example 2
  
  
delimiter $$
CREATE PROCEDURE cursor_test5(in did int)
begin
DECLARE done BOOLEAN;
declare sal1 int;
declare job1 varchar(50);
declare str1 varchar(50);
declare str2 varchar(50);

declare c1 cursor for select job_id,salary from employees where department_id=did;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
set str1='';
set str2='';
open c1;
repeat 
 fetch c1 into job1,sal1;
 
 SET  str1 = CONCAT(str1,sal1,',');
  SET  str2 = CONCAT(str2,job1,',');
 select str1,str2;
  until done
 end repeat;
 end$$

call cursor_test5(3);
drop prcedure procedure name;



 
 select * from test;
 
-- trigger
/*
a trigger is a stored program invoked automatically in response 
to an event such as insert, update, or delete that occurs in the 
associated table. For example, you can define a trigger that is invoked 
automatically before a new row is inserted into a table.

MySQL supports triggers that are invoked in response 
to the INSERT, UPDATE or DELETE event.
*/

-- types of trigger

/* 
Create triggers  – describe steps of how to create a trigger in MySQL.
Drop triggers – show you how to drop a trigger.
Create a BEFORE INSERT trigger – show you how to create a BEFORE INSERT trigger to maintain a summary table from another table.
Create an AFTER INSERT trigger – describe how to create an AFTER INSERT trigger to insert data into a table after inserting data into another table.
Create a BEFORE UPDATE trigger – learn how to create a BEFORE UPDATE trigger that validates data before it is updated to the table.
Create an AFTER UPDATE trigger – show you how to create an AFTER UPDATE trigger to log the changes of data in a table.
Create a BEFORE DELETE trigger – show how to create a BEFORE DELETE trigger.
Create an AFTER DELETE trigger – describe how to create an AFTER DELETE trigger.
*/

-- syntax of create trigger

CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
ON table_name FOR EACH ROW
trigger_body;

use hrms;
-- Example 1 on before insert.
 drop table contacts;
CREATE TABLE contacts
( contact_id INT(11) NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(30) NOT NULL,
  first_name VARCHAR(25),
  birthday DATE,
  created_date DATE,
  created_by VARCHAR(30),
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);


select version();
select * from contacts;

DELIMITER //

CREATE TRIGGER contacts_before_insert
BEFORE INSERT
   ON contacts FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);
   -- Find username of person performing INSERT into table
   SELECT USER() INTO vUser;

   -- Update create_date field to current system date
   SET NEW.created_date = SYSDATE();

   -- Update created_by field to the username of the person performing the INSERT
   SET NEW.created_by = vUser;

END; //

desc contacts;
insert into contacts(first_name,last_name, birthday)
values("ertet","fhfh",'2021-08-08');

select * from contacts;

-- Reference
-- https://www.techonthenet.com/mysql/triggers/before_insert.php


-- after insert

CREATE TABLE contacts1
( contact_id INT(11) NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(30) NOT NULL,
  first_name VARCHAR(25),
  birthday DATE,
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);

CREATE TABLE contact_audit
( contact_id INT(11) NOT NULL AUTO_INCREMENT,
  created_date DATE,
  created_by VARCHAR(30),
  CONSTRAINT contacts_pk PRIMARY KEY (contact_id)
);

--     We could then use the CREATE TRIGGER statement to create an AFTER INSERT trigger as follows:

DELIMITER //

CREATE TRIGGER after_insert_trigger
AFTER INSERT
   ON contacts1 FOR EACH ROW

BEGIN

   DECLARE vUser varchar(50);

   -- Find username of person performing the INSERT into table
   SELECT USER() INTO vUser;

   -- Insert record into audit table
   INSERT INTO contact_audit
   ( contact_id,
     created_date,
     created_by)
   VALUES
   ( NEW.contact_id,
     now(),
     vUser );

END//

insert into contacts1 values(101,"qw","qd",'2019-08-06');
insert into contacts1 values(109,"adv","qd",'2019-08-06');
select * from contact_audit;

-- before update

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);


INSERT INTO sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2003 Harley-Davidson Eagle Drag Bike',120, 2020,1),
    ('1969 Corvair Monza', 150,2020,1),
    ('1970 Plymouth Hemi Cuda', 200,2020,1);
    
    select * from sales;
    
    update sales
    set quantity=1200
    where id=1;
    
DELIMITER $$

CREATE TRIGGER before_sales_update
BEFORE UPDATE
ON sales FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('The new quantity ',
                        NEW.quantity,
                        ' cannot be 3 times greater than the current quantity ',
                        OLD.quantity);
                        
    IF new.quantity > old.quantity * 3 THEN
        SIGNAL SQLSTATE '45000' -- code for unhandled user defined exception
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END $$

DELIMITER ;

/* The trigger is automatically fired before an update event occurs for each row in the sales table.

If you update the value in the quantity column to a new value that is 3 times greater than the current value, the trigger raises an error and stops the update.*/

select * from sales;
update  sales set quantity=200 where id=1;

update  sales set quantity=2000 where id=1;

DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO Sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2001 Ferrari Enzo',140, 2021,1),
    ('1998 Chrysler Plymouth Prowler', 110,2021,1),
    ('1913 Ford Model T Speedster', 120,2021,1);


SELECT * FROM Sales;

DROP TABLE IF EXISTS SalesChanges;

CREATE TABLE SalesChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesId INT,
    beforeQuantity INT,
    afterQuantity INT,
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- create a trigger on after update

DELIMITER $$

CREATE TRIGGER after_sales_update
AFTER UPDATE
ON sales FOR EACH ROW
BEGIN
    IF OLD.quantity <> new.quantity THEN
        INSERT INTO SalesChanges(salesId,beforeQuantity, afterQuantity)
        VALUES(old.id, old.quantity, new.quantity);
    END IF;
END$$

DELIMITER ;
update  sales set quantity=300 where id=1;
SELECT * FROM Sales;

select * from SalesChanges;

/* This after_sales_update trigger is automatically fired after an update event occurs for each row in the sales table.

If you update the value in the quantity column to a new value the trigger insert a new row 
to log the changes in the SalesChanges table.

*/

-- before delete
-- BEFORE DELETE triggers are fired automatically before a delete event occurs in a table.

DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0
);
INSERT INTO salaries(employeeNumber,validFrom,amount)
VALUES
    (101,'2020-01-01',5300),
    (102,'2021-01-01',4000),
    (103,'2022-01-01',5600);


DROP TABLE IF EXISTS SalaryArchives;    

CREATE TABLE SalaryArchives (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeNumber INT ,
    validFrom DATE NOT NULL,
    amount DEC(12 , 2 ) NOT NULL DEFAULT 0,
    deletedAt TIMESTAMP DEFAULT NOW()
);

/* The following BEFORE DELETE trigger inserts a new row into the SalaryArchives table before a row from the Salaries table is deleted.*/

DELIMITER $$

CREATE TRIGGER before_salaries_delete
BEFORE DELETE
ON salaries FOR EACH ROW
BEGIN
    INSERT INTO SalaryArchives(employeeNumber,validFrom,amount)
    VALUES(OLD.employeeNumber,OLD.validFrom,OLD.amount);
END$$    




select * from salaries;

DELETE FROM salaries 
WHERE employeeNumber = 103;

select * from SalaryArchives;

-- The trigger was invoked and inserted a new row into the SalaryArchives table.

-- after delete trigger
DROP TABLE IF EXISTS Salaries;

CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0
);
-- insert data to the salaries table
INSERT INTO Salaries(employeeNumber,salary)
VALUES
    (102,5000),
    (106,7000),
    (107,8000);

-- Create the salary budget table.    
DROP TABLE IF EXISTS SalaryBudgets;

CREATE TABLE SalaryBudgets(
    total DECIMAL(15,2) NOT NULL
);


INSERT INTO SalaryBudgets(total)
SELECT SUM(salary) 
FROM Salaries;

select * from SalaryBudgets;
-- The AFTER DELETE trigger updates the total salary in the SalaryBudgets
--  table after a row is deleted from the Salaries table:
delimiter //
CREATE TRIGGER after_salaries_delete
AFTER DELETE
ON Salaries FOR EACH ROW
UPDATE SalaryBudgets 
SET total = total - old.salary;
end//

-- check the trigger
SELECT * FROM SalaryBudgets;    
 
-- delete a row from the Salaries table:

DELETE FROM Salaries
WHERE employeeNumber = 106;
-- again check the Salarybudgets table

SELECT * FROM SalaryBudgets;    



SELECT USER() ;
