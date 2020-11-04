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




