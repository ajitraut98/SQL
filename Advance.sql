
=======================================================================================================
--2)Write a SQL query to fetch the second last record from a employee table.
select * from employee_data;

select * from
(select e.*, row_number() over(order by rownum desc)as rno from employee_data e) x
where x.rno = 2;
=======================================================================================================================
--3)Write a SQL query to display only the details of employees who either earn the highest salary or the lowest salary in each department from the employee table.
select * from employee_data;

select x.*
from employee_data e
join (select e.*,
max(salary) over (partition by dept_name) as max_salary,
min(salary) over (partition by dept_name) as min_salary
from employee_data e) x
on e.emp_id = x.emp_id
and (e.salary = x.max_salary or e.salary = x.min_salary)
order by x.dept_name, x.salary;

--4) From the doctors table, fetch the details of doctors who work in the same hospital but in different speciality.

create table doctors
(
id int primary key,
name varchar(50) not null,
speciality varchar(100),
hospital varchar(50),
city varchar(50),
consultation_fee int
);


insert into doctors values(1, 'Dr. Shashank', 'Ayurveda', 'Apollo Hospital', 'Bangalore', 2500);
insert into doctors values(2, 'Dr. Abdul', 'Homeopathy', 'Fortis Hospital', 'Bangalore', 2000);
insert into doctors values(3, 'Dr. Shwetha', 'Homeopathy', 'KMC Hospital', 'Manipal', 1000);
insert into doctors values(4, 'Dr. Murphy', 'Dermatology', 'KMC Hospital', 'Manipal', 1500);
insert into doctors values(5, 'Dr. Farhana', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1700);
insert into doctors values(6, 'Dr. Maryam', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1500);

select * from doctors;

select a.name, a.speciality, a.hospital from doctors a, doctors b
where a.hospital = b.hospital AND a.speciality <> b.speciality AND a.id <> b.id;


--5) From the login_details table, fetch the users who logged in consecutively 3 or more times.

select * from login_details;

select distinct repeated_names from
(select e.*, 
     case 
      when user_name = lead(user_name) over(order by login_id) AND 
           user_name = lead(user_name,2) over(order by login_id) 
                       then user_name 
                       else null end as repeated_names
                       from login_details e)x
                       where x.repeated_names is not null;



-- Query 7:From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more. Note: Weather is considered to be extremely cold then its temperature is less than zero.
create table weather
(
id int,
city varchar(50),
temperature int,
day date
);
insert into weather values(1, 'London', -1, ('2021-01-01','YYYY-mm-dd'));
insert into weather values(2, 'London', -2,('2021-01-02','yyyy-mm-dd'));
insert into weather values(3, 'London', 4, to_date('2021-01-03','YYYY-MM-DD'));
insert into weather values(4, 'London', 1, to_date('2021-01-04','yyyy-mm-dd'));
insert into weather values(5, 'London', -2, CAST(to_char('2021-01-05','yyyy-mm-dd'), as date));
insert into weather values(6, 'London', -5, to_date('2021-01-06','yyyy-mm-dd'));
insert into weather values(7, 'London', -7, to_date('2021-01-07','yyyy-mm-dd'));
insert into weather values(8, 'London', 5, to_date('2021-01-08','YYYY-mm-dd'));
insert into weather values(8, 'London', 5, to_char('2021-01-08','yyyy-mm-dd'));
insert into weather values(8, 'London', 5, to_char('2021-01-08','YYYY-mm-dd'));
--------------------------------------------------------
alter session set nls_date_format = 'dd-mm-YYYY'
---------------------------------------------------------
select * from weather;

select id, city, temperature, day from (
 select e.*,
        case when temperature < 0
              and lead(temperature) over(order by day) < 0
              and lead(temperature,2) over(order by day) < 0
        then 'Y'
        when temperature < 0
              and lead(temperature) over(order by day) < 0
              and lag(temperature) over(order by day) < 0
        then 'Y'
        when temperature < 0
              and lag(temperature) over(order by day) < 0
              and lag(temperature,2) over(order by day) < 0
        then 'Y'
        end as flag
    from weather e) x
where x.flag = 'Y';
============================================================================================================================================

--WITH CLAUSE
The clause is used for defining a temporary relation such that the output of this temporary relation is available and is used by the query that is associated with the WITH clause.
create table e_data
( e_ID int
, e_NAME varchar(50)
, e_SALARY int);

insert into e_data values(101, 'Mohan', 40000);
insert into e_data  values(102, 'James', 50000);
insert into e_data  values(103, 'Robin', 60000);
insert into e_data  values(104, 'Carol', 70000);
insert into e_data  values(105, 'Alice', 80000);
insert into e_data  values(106, 'Jimmy', 90000);

select * from e_data ;

--Example 1:  Find all the employee whose salary is more than the average salary of all employees.

with temp(avgs) as 
      (select avg(e_salary) from e_data)
      select * from e_data , temp 
      where e_data.e_salary > temp.avgs;

---------- OR -------------
select * from e_data where e_salary > (select avg(e_salary)from e_data);
----------------------------------------------------------------------------------------------------












































































