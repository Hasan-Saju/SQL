--TABLESPACE

--creating tablespace
CREATE TABLESPACE myspace
DATAFILE 'D:\Academic-Projects\SQL\Library\myspace.dbf' SIZE 50M
EXTENT MANAGEMENT LOCAL AUTOALLOCATE;

--assign the tablespace to a user
CREATE USER LAB
IDENTIFIED BY LAB123
DEFAULT TABLESPACE myspace;

-- keeping a specific table in a specific tablespace (overiding default tablespace)
CREATE TABLE STUDENT
(
ID INT,
NAME VARCHAR2(20),
ADDRESS VARCHAR2(20),
GRADE NUMBER(2,1),
PRIMARY KEY(ID)
)TABLESPACE NEW_SPACE;

--CONTROL STRUCTURE

--if else
DECLARE
X NUMBER;

BEGIN
X:=10;

IF (X = 0) THEN
dbms_output.put_line('The value of x is 0 ');
ELSIF(X between 1 and 10) THEN
dbms_output.put_line('The value of x is between 1 and 10 ');
ELSE
dbms_output.put_line('The value of x is greater than 10 ');
END IF;

END;
/


--simple case
DECLARE
selector NUMBER := 1;

BEGIN

CASE selector
WHEN 0 THEN
dbms_output.put_line('Case 0!');
WHEN 1 THEN
dbms_output.put_line('Case 1!');
ELSE
dbms_output.put_line('No match!');
END CASE;

END;
/

--searched case
SELECT name, ID,
	(CASE
	WHEN salary < 1000 THEN 'Low'
	WHEN salary BETWEEN 1000 AND 3000 THEN 'Medium'
	WHEN salary > 3000 THEN 'High'
	ELSE 'N/A'
	END) salary
FROM emp
ORDER BY name;


--LOOP 

--loop and exit
DECLARE
x number := 10;

BEGIN

LOOP
dbms_output.put_line(x);
x := x + 10;
IF x > 50 THEN
exit;
END IF;

END LOOP;
-- after exit, control resumes here
dbms_output.put_line('After Exit x is: ' || x);
END;
/


--for loop 
DECLARE
a number(2);

BEGIN

FOR a in 10 .. 20 LOOP
dbms_output.put_line('value of a: ' || a);
END LOOP;

END;
/


--for reverse
DECLARE
a number(2) ;
BEGIN

FOR a IN REVERSE 10 .. 20 LOOP
dbms_output.put_line('value of a: ' || a);
END LOOP;

END;
/

--while
DECLARE
a number(2) := 10;
BEGIN

WHILE a < 20 LOOP
dbms_output.put_line('value of a: ' || a);
a := a + 1;
END LOOP;

END;
/





--CURSOR

--implicit cursor
DECLARE
total_rows number(2);

BEGIN

UPDATE emp
SET salary = salary + 500;

IF sql%notfound 
THEN dbms_output.put_line('no customers selected');
ELSIF sql%found 
THEN total_rows := sql%rowcount;
dbms_output.put_line( total_rows || ' customers selected ');
END IF;

END;
/

--explicit cursor 

--example1
DECLARE
c_id customers.id%type;
c_name customers.name%type;
c_addr customers.address%type;
CURSOR c_customers is
SELECT id, name, address FROM customers;

BEGIN
OPEN c_customers;

LOOP
	FETCH c_customers into c_id, c_name, c_addr;
	EXIT WHEN c_customers%notfound;
	dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);
END LOOP;

CLOSE c_customers;

END;
/


--example2
CREATE OR REPLACE Function TotalIncome( name_in IN varchar2 )
RETURN varchar2
IS
total_val number(6);

cursor c1 is
SELECT monthly_income
FROM employees
WHERE name = name_in;

BEGIN
total_val := 0;

FOR employee_rec in c1
LOOP
total_val := total_val + employee_rec.monthly_income;
END LOOP;

RETURN total_val;
END;
/




