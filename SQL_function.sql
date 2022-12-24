
33.-- SQL FUNCTIONS --
/* DATE FUNCTION 

DATEPART  (interval,datetime(YYYY-MM-DD))
DATEADD   (interval,increment int, expression smalldatetime)
DATEDIFF  (interval, start_date, end_date)

*/

select GETDATE()

select DATEPART(month,'2022-12-22')

select DATEADD(day,2,'2022-12-22')

select DATEDIFF(day,'2022-12-01','2022-12-22')

select order_date, ship_date, DATEDIFF(day,order_date,ship_date) as 'days to ship' from superstore_orders

select order_date, ship_date, DATEDIFF(day,order_date,ship_date) as 'days to ship' 
, DATEDIFF(week,order_date,ship_date) as 'week between days'
, DATEDIFF(day,order_date,ship_date)  - 2 * DATEDIFF(week,order_date,ship_date) as 'business days to sheep'
from superstore_orders

-- calculate current age
select DATEDIFF(year,'1998-01-13',GETDATE()) as age

select order_date from superstore_orders where DATEPART(year,Order_Date) = 2019

select CURRENT_TIMESTAMP

select top 5 ship_date, ship_mode from superstore_orders;



/*  LOGICAL FUNCTION
1) IIF( boolean_expression, true_value, false_value )
2) CHOOSE ( index, val_1, val_2 [, val_n ] )
*/

select iif(40>30, 'y','n')

SELECT CHOOSE ( 2, 'Manager', 'Director', 'Developer', 'Tester' ) AS Result;

/*  RANKING FUNCTION

1) NTILE
2) RANK
3) ROW_NUMBER
4) DENSE_RANK

*/

select * from school
select stu_id, stu_name,marks , NTILE(2) over (partition by marks order by marks) as rnk from school




