--create new user
CREATE USER PLSQL(Name) IDENTIFIED BY PL123(Pass);
GRANT DBA TO PLSQL;
CONNECT PLSQL/PL123;

--LOGOUT 
DISCONNECT;
--Clear the screen
cl scr;
--CHECKING CURRENT USER 
SHOW USER;
--SAVE 
COMMIT;

-----------------------------------

--CREATE TABLE 
CREATE TABLE CITIZEN
(
NID INT,
NAME VARCHAR2(20),
SALARY INT,
CONSTRAINT PK_CITIZEN PRIMARY KEY(NID)
--CONSTRAINT FK_LICENCE FOREIGN KEY(NID) REFERENCES ONNO_TABLE_NAME(ID) ON DELETE CASCADE
);
--TABLE STRUCTURE
DESC CITIZEN;
--DELETE TABLE
DROP TABLE CITIZEN;
--INSERT
INSERT INTO CITIZEN VALUES(1,'SAJU',200000);

--ALTER (ADD/DELETE/MODIFY)

--ADD COLUMN
ALTER TABLE CITIZEN
ADD AGE INT;
--ADD CONSTRAINT
ALTER TABLE CITIZEN
ADD CONSTRAINT PK_CITIZEN PRIMARY KEY(NID);
--DELETE COLUMN
ALTER TABLE CITIZEN
DROP COLUMN AGE;
--MODIFY
ALTER TABLE CITIZEN
MODIFY AGE VARCHAR2(10);		--AGE COLUMN MUST BE EMPTY
--DROP CONSTRAINT
ALTER TABLE CITIZEN
DROP PRIMARY KEY;

--UPDATE 
UPDATE Customers				--Customers: TABLE NAME
SET ContactName = ’Alfred Schmidt’, City= ’Frankfurt’
WHERE CustomerID = 1;
--DELETE ENTRY
DELETE FROM Customers 
WHERE CustomerName=’Alfreds Futterkiste’;

--DISTINCT KEYWORD
SELECT DISTINCT Country 
FROM Customers;

--AS KEYWORD
SELECT column_name AS alias_name
FROM table_name;

SELECT column_name(s)
FROM table_name AS alias_name;

--check keyword
check(GENDER in ('Male', 'Female', 'Unknown'));		--GENDER: is a column_name

--NESTED QUERY
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

-- IN OPERATOR
SELECT * FROM CUSTOMERS
WHERE COUNTRY IN ('GERMANY','UK','USA');

--TO_CHAR function(Change default date format)
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD' )
FROM dual;
--TO_DATE function (Convert string to date)
SELECT TO_DATE('5 Jan 2017','DD MON YYYY')
FROM dual;

--ORDER BY
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

----------------------------------

--CARTESIAN PRODUCT
SELECT * FROM 
STUDENT,DEPT; 		--STUDENT,DEPT: TABLE NAME 

--Join

--natural join
select p.pid,p.name,d.did,d.vehicle
from passports p, driving_lic d
where p.pid=d.passport;

--left join
select p.pid,p.name,d.did,d.vehicle
from passports p, driving_lic d
where p.pid=d.passport(+);

--right join 
select p.pid,p.name,d.did,d.vehicle
from passports p, driving_lic d
where p.pid(+)=d.passport;

--full join 
select p.pid,p.name,d.did,d.vehicle
from passports p
full outer join driving_lic d
on p.pid=d.passport;

--copy the structure of student table 
CREATE TABLE NEW_STUDENTS
AS SELECT ID , NAME, GPA FROM STUDENTS;
