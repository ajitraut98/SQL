====================================================================================================================================
-- CREATE 3 TABLE PERSON_DETAILS , EMPLOYEE and DEPARTMENT.
-- USED ORACLE
create database employeeDB;
use employeeDB;
----------------------------------------------------------
CREATE TABLE PERSON_DETAILS (
        PERSON_ID int not null,
        TITLE varchar(20),
        FIRST_NAME varchar(30) not null,
        LAST_NAME varchar(30) not null,
        GENDER varchar(01),
        BIRTH_DATE date not null,
        ADDRESS varchar(30),
        CITY varchar(20),
        STATE varchar(20),
        POSTAL_CODE varchar(10),
        START_DATE date not null
        );
        

CREATE TABLE EMPLOYEE_INFO (
        EMP_ID int not null,
        SUPERIOR_EMP_ID int,
        DEPT_ID int,
        SALARY int,
        END_DATE date default null,
        PERSON_ID int
        );

CREATE TABLE DEPARTMENT (
        DEPT_ID int not null,
        DEPT_NAME varchar(20) not null,
        DEPT_HEAD_EMP_ID int
        ); 
============================================================================================================================
--4. Identify and create primary keys for all mentioned 3 tables above
ALTER TABLE PERSON_DETAILS ADD CONSTRAINT PK_PERSON_DETAILS PRIMARY KEY (PERSON_ID);
ALTER TABLE EMPLOYEE_INFO ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY (EMP_ID);
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY (DEPT_ID);

--5. Add foreign key constraint on EMPLOYEE table for column SUPERIOR_EMP_ID referencing EMP_ID from EMPLOYEE table
ALTER TABLE EMPLOYEE_INFO
ADD FOREIGN KEY (SUPERIOR_EMP_ID) REFERENCES EMPLOYEE_INFO (EMP_ID);

--6. Add foreign key constraint on EMPLOYEE table for column PERSON_ID referencing PERSON_ID from PERSON_DETAILS table
ALTER TABLE EMPLOYEE_INFO
ADD FOREIGN KEY (PERSON_ID) REFERENCES PERSON_DETAILS (PERSON_ID);

--7. Add foreign key constraint on DEPARTMENT table for column DEPT_HEAD_EMP_ID referencing EMP_ID from EMPLOYEE table
ALTER TABLE DEPARTMENT
ADD FOREIGN KEY (DEPT_HEAD_EMP_ID) REFERENCES EMPLOYEE_INFO (EMP_ID);

--8. Add Check constraint against SALARY column in EMPLOYEE table to have salary value between 5000 to 40000
ALTER TABLE EMPLOYEE_INFO ADD CONSTRAINT CHECK_SALARY CHECK (SALARY BETWEEN 5000 AND 40000);


-- DUMMY DATA INSERTED IN PERSON_DETAILS FOR THE SAKE OF ANSWERING FOLLOWING QUESTIONS.
INSERT INTO PERSON_DETAILS VALUES(11,'MR','PAUL','MCCARTHY','M',to_date('01-01-2000','dd-mm-YYYY'),'ELM STREET','SAN JOSE','CALIFORNIA',4141,to_date('01-01-2014','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(13,'MISS','JESSICA','ROOT','F',to_date('01-01-2003','dd-mm-YYYY'),'ABC ROAD','SAN FRANCISCO','CALIFORNIA',4628,to_date('17-11-2017','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(14,'MR','JOE','SMITH','M',to_date('18-01-1996','dd-mm-YYYY'),'MAPPLE HILL','SAN DIEGO','CALIFORNIA',5241,to_date('02-02-2018','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(16,'MRS','NEHA','PATEL','F',to_date('11-11-1995','dd-mm-YYYY'),'GM ROAD','RAJKOT','GUJRAT',7891,to_date('22-09-2012','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(12,'MR','AJIT','RAUT','M',to_date('13-01-1998','dd-mm-YYYY'),'NIBM','PUNE','MAHARASHTRA',5761,to_date('15-07-2016','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(17,'MISS','TAYLOR','HILL','F',to_date('01-09-2004','dd-mm-YYYY'),'PALM STREET','LAS VEGAS','NEVADA',6321,to_date('01-01-2019','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(15,'MRS','PAMELA','CRUZ','F',to_date('10-11-2005','dd-mm-YYYY'),'MJ STREET','BUFFALO','NEW YORK',9982,to_date('21-12-2015','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(19,'MR','GREG','LEE','M',to_date('30-09-1994','dd-mm-YYYY'),'CHATSWORTH','LOS ANGELES','CALIFORNIA',7641,to_date('25-05-2017','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(10,'MISS','TINA','SONG','F',to_date('30-10-1994','dd-mm-YYYY'),'XGJ','SACRAMENTO','CALIFORNIA',7541,to_date('02-05-2017','dd-mm-yyyy'));
INSERT INTO PERSON_DETAILS VALUES(18,'MISS','LANA','BROOK','F',to_date('15-12-1999','dd-mm-YYYY'),'AY ROAD','SALT LAKE','UTAH',9011,to_date('10-05-2020','dd-mm-yyyy'));


--9. Populate data for 10 records in EMPLOYEE table
INSERT INTO EMPLOYEE_INFO VALUES(1,1,21,18000,to_date('01-01-2022','dd-mm-yyyy'),18);
INSERT INTO EMPLOYEE_INFO VALUES(2,2,23,25000,to_date('05-03-2021','dd-mm-yyyy'),11);
INSERT INTO EMPLOYEE_INFO VALUES(3,3,22,37000,to_date('11-01-2020','dd-mm-yyyy'),12);
INSERT INTO EMPLOYEE_INFO VALUES(4,4,24,12000,to_date('13-05-2022','dd-mm-yyyy'),13);
INSERT INTO EMPLOYEE_INFO VALUES(5,5,25,6500,to_date('09-11-2021','dd-mm-yyyy'),15);
INSERT INTO EMPLOYEE_INFO VALUES(6,6,26,35000,to_date('26-01-2020','dd-mm-yyyy'),16);
INSERT INTO EMPLOYEE_INFO VALUES(7,7,27,9500,to_date('13-01-2022','dd-mm-yyyy'),17);
INSERT INTO EMPLOYEE_INFO VALUES(8,8,30,6600,to_date('25-06-2019','dd-mm-yyyy'),14);
INSERT INTO EMPLOYEE_INFO VALUES(9,9,28,8000,to_date('20-07-2018','dd-mm-yyyy'),19);
INSERT INTO EMPLOYEE_INFO VALUES(10,10,29,15000,to_date('26-03-2020','dd-mm-yyyy'),10);

--10. Populate data for 5 records in DEPARTMENT table
INSERT INTO DEPARTMENT VALUES(21,'IT',1);
INSERT INTO DEPARTMENT VALUES(22,'SALES',2);
INSERT INTO DEPARTMENT VALUES(23,'MARKETING',3);
INSERT INTO DEPARTMENT VALUES(24,'FINANCE',4);
INSERT INTO DEPARTMENT VALUES(25,'HR',5);

--11. Update EMPLOYEE and DEPARTMENT table with foreign key values for about 50% of populated records in the table

UPDATE EMPLOYEE_INFO SET PERSON_ID = 10 WHERE SUPERIOR_EMP_ID = 1;
UPDATE EMPLOYEE_INFO SET PERSON_ID = 18 WHERE SUPERIOR_EMP_ID = 10;
UPDATE EMPLOYEE_INFO SET PERSON_ID = 19 WHERE SUPERIOR_EMP_ID = 8;
UPDATE EMPLOYEE_INFO SET PERSON_ID = 14  WHERE SUPERIOR_EMP_ID = 9;

UPDATE DEPARTMENT SET DEPT_HEAD_EMP_ID = 6 WHERE DEPT_ID = 21;
UPDATE DEPARTMENT SET DEPT_HEAD_EMP_ID = 1 WHERE DEPT_ID = 25;
==================================================================================================================


SELECT * FROM PERSON_DETAILS;
SELECT * FROM EMPLOYEE_INFO;
SELECT * FROM DEPARTMENT;
--------------------------------------------
--Write queries for below -
--1. Select first_name, last_name and gender from person_details table who were born on or after 01-01-2000
--alter session set nls_date_format = 'dd-mm-YYYY' #(Run this command before executing below query)
SELECT FIRST_NAME, LAST_NAME , GENDER FROM PERSON_DETAILS WHERE TO_DATE(BIRTH_DATE,'dd-mm-YYYY') >= '01-01-2000';

--2. Create a view person_view on person_details table to retrieve TITLE, FIRST_NAME, LAST_NAME, CITY and STATE
CREATE VIEW PERSON_VIEW
AS
SELECT TITLE, FIRST_NAME, LAST_NAME, CITY, STATE FROM PERSON_DETAILS;

--3. select employee FIRST_NAME, LAST_NAME and DEPT_NAME who draw salary greater than 10000
SELECT PD.FIRST_NAME, PD.LAST_NAME, D.DEPT_NAME 
FROM PERSON_DETAILS PD, EMPLOYEE_INFO E, DEPARTMENT D
WHERE
PD.PERSON_ID = E.PERSON_ID AND E.EMP_ID = D.DEPT_HEAD_EMP_ID 
AND
E.SALARY > 10000;

--4. select employee FIRST_NAME, LAST_NAME and DEPT_NAME who draw salary greater than 10000 and who are from a specific STATE 
--(provide the state value as per the data inserted in table)
SELECT PD.FIRST_NAME, PD.LAST_NAME, D.DEPT_NAME , PD.STATE
FROM PERSON_DETAILS PD, EMPLOYEE_INFO E, DEPARTMENT D
WHERE
PD.PERSON_ID = E.PERSON_ID AND E.EMP_ID = D.DEPT_HEAD_EMP_ID  
AND
E.SALARY > 10000 AND STATE = 'CALIFORNIA';

--5. Select first_name and city from person_view        
SELECT FIRST_NAME,CITY FROM PERSON_VIEW;
=========================================================================================================================================================


         
  
 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
