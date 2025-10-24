REM   Script: CompanyDB
REM   For PS Task

CREATE TABLE GENDER ( 
    Gender_ID NUMBER(1) PRIMARY KEY, 
    Name      VARCHAR2(10) 
);

CREATE TABLE MyDept ( 
    Dept_ID NUMBER(2) PRIMARY KEY, 
    Name    VARCHAR2(50) 
);

CREATE TABLE University ( 
    ID   NUMBER(1) PRIMARY KEY, 
    Name VARCHAR2(100) 
);

CREATE TABLE MyEmployee ( 
    ID            NUMBER(3) PRIMARY KEY, 
    FIRST_NAME    VARCHAR2(50), 
    LAST_NAME     VARCHAR2(50), 
    HIRE_DATE     DATE, 
    USERID        NUMBER(4), 
    SALARY        NUMBER(10, 2), 
    Dept_ID       NUMBER(2), 
    Gender_ID     NUMBER(1), 
    University_ID NUMBER(1), 
    EMP_IMAGE     BLOB, 
    MANAGER_ID    NUMBER(3), 
    JOB_TITLE     VARCHAR2(50) 
);

INSERT INTO GENDER (Gender_ID, Name) VALUES (1, 'Male');

INSERT INTO GENDER (Gender_ID, Name) VALUES (2, 'Female');

INSERT INTO MyDept (Dept_ID, Name) VALUES (10, 'IT');

INSERT INTO MyDept (Dept_ID, Name) VALUES (20, 'HR');

INSERT INTO MyDept (Dept_ID, Name) VALUES (30, 'Finance');

INSERT INTO University (ID, Name) VALUES (1, 'Balqa Applied University');

INSERT INTO University (ID, Name) VALUES (2, 'Jordan University');

INSERT INTO University (ID, Name) VALUES (3, 'JUST');

INSERT INTO University (ID, Name) VALUES (4, 'Yarmouk University');

INSERT INTO University (ID, Name) VALUES (5, 'hashemite university');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, Dept_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE) VALUES (101, 'Asem', 'Alsmadi', TO_DATE('2012-12-12', 'YYYY-MM-DD'), 2001, 12345.00, 10, 1, 1, NULL, 'Cybersecurity Engineer');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, Dept_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE) VALUES (102, 'Omar', 'Ali', TO_DATE('2020-10-04', 'YYYY-MM-DD'), 2002, 760.00, 20, 1, 2, 103, 'HR Manager');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, Dept_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE) VALUES (103, 'Mr', 'Beast', TO_DATE('2010-10-10', 'YYYY-MM-DD'), 2003, 99999.99, 30, 1, 1, NULL, 'Sales');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, Dept_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE) VALUES (104, 'Sara', 'Ahmad', TO_DATE('2022-12-18', 'YYYY-MM-DD'), 2004, 2040.00, 30, 2, 2, 103, 'Accountant');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, Dept_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE) VALUES (105, 'SCOTT', 'Tiger', TO_DATE('2005-09-09', 'YYYY-MM-DD'), 2005, 50000.00, 10, 1, 3, 103, 'Senior Developer');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, Dept_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE) VALUES (106, 'Ahmad', 'Saleh', TO_DATE('1980-10-10', 'YYYY-MM-DD'), 2006, 65000.00, 20, 1, 4, NULL, 'HR Specialist');

INSERT INTO MyEmployee (ID, FIRST_NAME, LAST_NAME, HIRE_DATE, USERID, SALARY, Dept_ID, Gender_ID, University_ID, MANAGER_ID, JOB_TITLE) VALUES (107, 'Rami', 'Khalil', TO_DATE('1980-05-24', 'YYYY-MM-DD'), 2007, 72000.00, 30, 1, 5, 103, 'Sales');

COMMIT;

SELECT * FROM MyEmployee;

SELECT  
    CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Employee_Name, 
    e.SALARY, 
    d.Name AS Department_Name, 
    CONCAT(m.FIRST_NAME, ' ', m.LAST_NAME) AS Manager_Name, 
    g.Name AS Gender, 
    u.Name AS University 
FROM  
    MyEmployee e 
LEFT JOIN MyDept d ON e.DEPT_ID = d.Dept_ID 
LEFT JOIN MyEmployee m ON e.MANAGER_ID = m.ID 
LEFT JOIN GENDER g ON e.Gender_ID = g.Gender_ID 
LEFT JOIN University u ON e.University_ID = u.ID;

CREATE OR REPLACE FUNCTION F_HR_QUERY 
RETURN SYS_REFCURSOR 
IS 
    v_cursor SYS_REFCURSOR; 
    v_scott_hire_date DATE; 
BEGIN 
    -- First, find the hire date of employee SCOTT 
    SELECT HIRE_DATE 
    INTO v_scott_hire_date 
    FROM MyEmployee 
    WHERE FIRST_NAME = 'SCOTT'; 
 
    -- Now, open the cursor to select employees hired after SCOTT's hire date 
    OPEN v_cursor FOR 
        SELECT 
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
            HIRE_DATE 
        FROM MyEmployee 
        WHERE HIRE_DATE > v_scott_hire_date; 
 
    -- Return the opened cursor 
    RETURN v_cursor; 
EXCEPTION 
    -- Handle case where SCOTT is not found to avoid errors 
    WHEN NO_DATA_FOUND THEN 
        OPEN v_cursor FOR 
            SELECT 'SCOTT not found' AS NAME, NULL AS HIRE_DATE FROM DUAL; 
        RETURN v_cursor; 
END F_HR_QUERY; 
/

SET SERVEROUTPUT ON


DECLARE 
    v_emp_cursor SYS_REFCURSOR; 
    v_full_name  VARCHAR2(101); 
    v_hire_date  DATE; 
BEGIN 
    -- This line calls your function 
    v_emp_cursor := F_HR_QUERY(); 
 
    -- This loop goes through each result 
    LOOP 
        FETCH v_emp_cursor INTO v_full_name, v_hire_date; 
        EXIT WHEN v_emp_cursor%NOTFOUND; 
        DBMS_OUTPUT.PUT_LINE(v_full_name || ' was hired on ' || TO_CHAR(v_hire_date, 'DD-MON-YYYY')); 
    END LOOP; 
    CLOSE v_emp_cursor; 
END; 
/

CREATE OR REPLACE PROCEDURE P_COPY_EMPLOYEE 
IS 
BEGIN 
    -- In a live environment, it's good practice to ensure the table 
    -- doesn't exist before trying to create it. We'll try to drop it first. 
    BEGIN 
       EXECUTE IMMEDIATE 'DROP TABLE MyEmployee_update'; 
    EXCEPTION 
       -- If the table doesn't exist, an error (ORA-00942) is raised. 
       -- We catch this error and simply continue, as that's our desired state. 
       WHEN OTHERS THEN 
          IF SQLCODE != -942 THEN 
             RAISE; 
          END IF; 
    END; 
 
    -- Create the new table and copy all data from MyEmployee. 
    EXECUTE IMMEDIATE 'CREATE TABLE MyEmployee_update AS SELECT * FROM MyEmployee'; 
 
    -- Optional: Display a confirmation message in the output. 
    DBMS_OUTPUT.PUT_LINE('Success: MyEmployee_update has been created and populated.'); 
 
END P_COPY_EMPLOYEE; 
/

CREATE OR REPLACE FUNCTION F_HR_QUERY 
RETURN SYS_REFCURSOR 
IS 
    v_cursor SYS_REFCURSOR; 
    v_scott_hire_date DATE; 
BEGIN 
    -- First, find the hire date of employee SCOTT 
    SELECT HIRE_DATE 
    INTO v_scott_hire_date 
    FROM MyEmployee 
    WHERE FIRST_NAME = 'SCOTT'; 
 
    -- Now, open the cursor to select employees hired after SCOTT's hire date 
    OPEN v_cursor FOR 
        SELECT 
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
            HIRE_DATE 
        FROM MyEmployee 
        WHERE HIRE_DATE > v_scott_hire_date; 
 
    -- Return the opened cursor 
    RETURN v_cursor; 
EXCEPTION 
    -- Handle case where SCOTT is not found to avoid errors 
    WHEN NO_DATA_FOUND THEN 
        OPEN v_cursor FOR 
            SELECT 'SCOTT not found' AS NAME, NULL AS HIRE_DATE FROM DUAL; 
        RETURN v_cursor; 
END F_HR_QUERY; 
/

CREATE OR REPLACE PROCEDURE P_COPY_EMPLOYEE 
IS 
BEGIN 
    -- In a live environment, it's good practice to ensure the table 
    -- doesn't exist before trying to create it. We'll try to drop it first. 
    BEGIN 
       EXECUTE IMMEDIATE 'DROP TABLE MyEmployee_update'; 
    EXCEPTION 
       -- If the table doesn't exist, an error (ORA-00942) is raised. 
       -- We catch this error and simply continue, as that's our desired state. 
       WHEN OTHERS THEN 
          IF SQLCODE != -942 THEN 
             RAISE; 
          END IF; 
    END; 
 
    -- Create the new table and copy all data from MyEmployee. 
    EXECUTE IMMEDIATE 'CREATE TABLE MyEmployee_update AS SELECT * FROM MyEmployee'; 
 
    -- Optional: Display a confirmation message in the output. 
    DBMS_OUTPUT.PUT_LINE('Success: MyEmployee_update has been created and populated.'); 
 
END P_COPY_EMPLOYEE; 
/

    BEGIN 
        P_COPY_EMPLOYEE(); 
    END; 
/

    /


FUNCTION F_HR_QUERY  


RETURN SYS_REFCURSOR  


IS  


create or replace FUNCTION F_HR_QUERY  
RETURN SYS_REFCURSOR  
IS  
    -- Variable to hold SCOTT HIRE_DATE .... 
    v_employee_cursor SYS_REFCURSOR; 
 
BEGIN  
    -- Find SCOTT's HIRE_DATE  
	OPEN v_employee_cursor FOR 
        SELECT 
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
            HIRE_DATE 
        FROM 
            MyEmployee 
        WHERE 
            HIRE_DATE > (SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = 'SCOTT'); 
 
     
    -- Now, open the cursor to select employees hired after SCOTT's hire date  
    OPEN v_cursor FOR  
        SELECT  
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,  
            HIRE_DATE  
        FROM MyEmployee  
        WHERE HIRE_DATE > v_scott_hire_date;  
  
   RETURN v_employee_cursor; 
 
END F_HR_QUERY_SIMPLE; 
/

drop procedure "F_HR_QUERY";

create or replace FUNCTION F_HR_QUERY  
RETURN SYS_REFCURSOR  
IS  
    -- Variable to hold SCOTT HIRE_DATE .... 
    v_employee_cursor SYS_REFCURSOR; 
 
BEGIN  
    -- Find SCOTT's HIRE_DATE  
	OPEN v_employee_cursor FOR 
        SELECT 
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
            HIRE_DATE 
        FROM 
            MyEmployee 
        WHERE 
            HIRE_DATE > (SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = 'SCOTT'); 
 
     
    -- Now, open the cursor to select employees hired after SCOTT's hire date  
    OPEN v_cursor FOR  
        SELECT  
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,  
            HIRE_DATE  
        FROM MyEmployee  
        WHERE HIRE_DATE > v_scott_hire_date;  
  
   RETURN v_employee_cursor; 
 
END F_HR_QUERY_SIMPLE; 
/

create FUNCTION F_HR_QUERY  
RETURN SYS_REFCURSOR  
IS  
    -- Variable to hold SCOTT HIRE_DATE .... 
    v_employee_cursor SYS_REFCURSOR; 
 
BEGIN  
    -- Find SCOTT's HIRE_DATE  
	OPEN v_employee_cursor FOR 
        SELECT 
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
            HIRE_DATE 
        FROM 
            MyEmployee 
        WHERE 
            HIRE_DATE > (SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = 'SCOTT'); 
 
     
    -- Now, open the cursor to select employees hired after SCOTT's hire date  
    OPEN v_cursor FOR  
        SELECT  
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,  
            HIRE_DATE  
        FROM MyEmployee  
        WHERE HIRE_DATE > v_scott_hire_date;  
  
   RETURN v_employee_cursor; 
 
END F_HR_QUERY_SIMPLE; 
/

drop procedure "F_HR_QUERY";

drop FUNCTION "F_HR_QUERY";

CREATE FUNCTION F_HR_QUERY 
RETURN SYS_REFCURSOR 
IS 
    -- Variable to hold SCOTT HIRE_DATE. 
    v_employee_cursor SYS_REFCURSOR; 
BEGIN 
 
    -- Find SCOTT's HIRE_DATE 
    OPEN v_employee_cursor FOR 
        SELECT 
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
            HIRE_DATE 
        FROM 
            MyEmployee 
        WHERE 
            HIRE_DATE > (SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = 'SCOTT'); 
 
    RETURN v_employee_cursor; 
 
END F_HR_QUERY_SIMPLE; 
/

 OR REPLACE


variable results refcursor


exec :results := F_HR_QUERY_SIMPLE()


print results


variable results refcursor


exec :results := F_HR_QUERY()


print results


variable results refcursor


exec :results := F_HR_QUERY()


print results


SET SERVEROUTPUT ON


DECLARE 
    -- A variable to hold the list of results from the function 
    v_results_cursor SYS_REFCURSOR; 
 
    -- Variables to hold the data for each single row as we loop 
    v_employee_name VARCHAR2(100); 
    v_employee_hire_date DATE; 
BEGIN 
    -- Call your simplified function and store the results in our cursor 
    v_results_cursor := F_HR_QUERY_SIMPLE(); 
 
    -- Loop through the results, one row at a time 
    LOOP 
        -- Fetch one row from the results into our variables 
        FETCH v_results_cursor INTO v_employee_name, v_employee_hire_date; 
 
        -- If there are no more rows, exit the loop 
        EXIT WHEN v_results_cursor%NOTFOUND; 
 
        -- Print the data for the current row 
        DBMS_OUTPUT.PUT_LINE(v_employee_name || ' was hired on ' || TO_CHAR(v_employee_hire_date, 'DD-MON-YYYY')); 
    END LOOP; 
 
    -- Close the cursor to free up resources 
    CLOSE v_results_cursor; 
END; 
/

SET SERVEROUTPUT ON


DECLARE 
    -- A variable to hold the list of results from the function 
    v_results_cursor SYS_REFCURSOR; 
 
    -- Variables to hold the data for each single row as we loop 
    v_employee_name VARCHAR2(100); 
    v_employee_hire_date DATE; 
BEGIN 
    -- Call your simplified function and store the results in our cursor 
    v_results_cursor := F_HR_QUERY(); 
 
    -- Loop through the results, one row at a time 
    LOOP 
        -- Fetch one row from the results into our variables 
        FETCH v_results_cursor INTO v_employee_name, v_employee_hire_date; 
 
        -- If there are no more rows, exit the loop 
        EXIT WHEN v_results_cursor%NOTFOUND; 
 
        -- Print the data for the current row 
        DBMS_OUTPUT.PUT_LINE(v_employee_name || ' was hired on ' || TO_CHAR(v_employee_hire_date, 'DD-MON-YYYY')); 
    END LOOP; 
 
    -- Close the cursor to free up resources 
    CLOSE v_results_cursor; 
END; 
/

drop procedure "F_HR_QUERY";

drop FUNCTION "F_HR_QUERY";

FUNCTION F_HR_QUERY  


RETURN SYS_REFCURSOR  


IS  


    v_employee_cursor SYS_REFCURSOR;  


BEGIN  
  
    -- Find SCOTT's HIRE_DATE  
    OPEN v_employee_cursor FOR  
        SELECT  
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,  
            HIRE_DATE  
        FROM  
            MyEmployee  
        WHERE  
            HIRE_DATE > (SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = 'SCOTT');  
  
    RETURN v_employee_cursor;  
  
END F_HR_QUERY;/
/

    v_employee_cursor SYS_REFCURSOR;  


BEGIN  
  
    -- Find SCOTT's HIRE_DATE  
    OPEN v_employee_cursor FOR  
        SELECT  
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,  
            HIRE_DATE  
        FROM  
            MyEmployee  
        WHERE  
            HIRE_DATE > (SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = 'SCOTT');  
  
    RETURN v_employee_cursor;  
  
END F_HR_QUERY;/
/

CREATE OR REPLACE FUNCTION F_HR_QUERY 
RETURN SYS_REFCURSOR 
IS 
    -- We only need one variable: to hold the results we want to return. 
    v_employee_cursor SYS_REFCURSOR; 
BEGIN 
    -- This is the core of the function. 
    -- We open our cursor and fill it with the results of a single SELECT statement. 
    -- The subquery '(SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = 'SCOTT')' 
    -- finds SCOTT's hire date first, and then the main query finds everyone 
    -- hired after that date. 
    OPEN v_employee_cursor FOR 
        SELECT 
            FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
            HIRE_DATE 
        FROM 
            MyEmployee 
        WHERE 
            HIRE_DATE > (SELECT HIRE_DATE FROM MyEmployee WHERE FIRST_NAME = 'SCOTT'); 
 
    -- Now that the cursor is filled with the data, we return it. 
    RETURN v_employee_cursor; 
 
END F_HR_QUERY; 
/

SET SERVEROUTPUT ON


DECLARE 
    -- A variable to hold the list of results from the function 
    v_results_cursor SYS_REFCURSOR; 
 
    -- Variables to hold the data for each single row as we loop 
    v_employee_name VARCHAR2(100); 
    v_employee_hire_date DATE; 
BEGIN 
    -- Call your simplified function and store the results in our cursor 
    v_results_cursor := F_HR_QUERY(); 
 
    -- Loop through the results, one row at a time 
    LOOP 
        -- Fetch one row from the results into our variables 
        FETCH v_results_cursor INTO v_employee_name, v_employee_hire_date; 
 
        -- If there are no more rows, exit the loop 
        EXIT WHEN v_results_cursor%NOTFOUND; 
 
        -- Print the data for the current row 
        DBMS_OUTPUT.PUT_LINE(v_employee_name || ' was hired on ' || TO_CHAR(v_employee_hire_date, 'DD-MON-YYYY')); 
    END LOOP; 
 
    -- Close the cursor to free up resources 
    CLOSE v_results_cursor; 
END; 
/

BEGIN 
	P_COPY_EMPLOYEE(); 
END;/
/

SELECT * FROM MyEmployeE;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
    GROUP_BY EMP_ID 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
    GROUP_BY Emp_ID 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
    GROUPBY EMP_ID 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
    ORDER BY Emp_ID 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID 
ORDER BY Emp.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
    ORDER BY Emp_ID 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
    ORDER BY EMP_ID 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID;

SELECT 
    emp.ID AS Emp_ID, 
    emp.FIRST_NAME || ' ' || emp.LAST_NAME AS Employee_Name, 
    emp.HIRE_DATE, 
    emp.SALARY, 
    dept.Name AS Department_Name, -- Replaces DEPT_ID with the department name 
    g.Name AS Gender, -- Replaces GENDER_ID with the gender name 
    u.Name AS University_Name, -- Replaces University_ID with the university name 
    mgr.FIRST_NAME || ' ' || mgr.LAST_NAME AS Manager_Name, -- Replaces MANAGER_ID with the manager's name 
    emp.JOB_TITLE 
FROM 
    MyEmployee emp 
    -- Join to get the Department Name 
    LEFT JOIN MyDept dept ON emp.Dept_ID = dept.Dept_ID 
 
    -- Join to get the Gender Name 
    LEFT JOIN GENDER g ON emp.Gender_ID = g.Gender_ID 
 
    -- Join to get the University Name 
    LEFT JOIN University u ON emp.University_ID = u.ID 
 
    -- This is a "self-join": we join the table to itself to find the manager's name. 
    -- We match the employee's MANAGER_ID with their manager's own ID. 
    LEFT JOIN MyEmployee mgr ON emp.MANAGER_ID = mgr.ID 
ORDER BY EMP.ID;

