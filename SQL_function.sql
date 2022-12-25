
33.-- SQL FUNCTIONS --
/* DATE FUNCTION 

DATEPART  (interval,datetime(YYYY-MM-DD))
DATEADD   (interval,increment int, expression smalldatetime)
DATEDIFF  (interval, start_date, end_date)
EOMONTH ( start_date [, month_to_add ] )
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

select EOMONTH ( '2022-12-23' )


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


/*   ANALYTICS FUNCTION

1) CUME_DIST( )  OVER ( [ partition_by_clause ] order_by_clause )
2) FIRST_VALUE ( [scalar_expression ] )  [ IGNORE NULLS | RESPECT NULLS ] OVER ( [ partition_by_clause ] order_by_clause [ rows_range_clause ] )
3) LAST_VALUE ( [ scalar_expression ] )  [ IGNORE NULLS | RESPECT NULLS ] OVER ( [ partition_by_clause ] order_by_clause [ rows_range_clause ] )
4) LAG (scalar_expression [,offset] [,default]) OVER ( [ partition_by_clause ] order_by_clause )
5) LEAD ( scalar_expression [ ,offset ] , [ default ] ) OVER ( [ partition_by_clause ] order_by_clause )
*/


SELECT product_id, price, FIRST_VALUE(price) OVER(ORDER BY product_id) AS lowest_price FROM products;

SELECT *, LAST_VALUE(stu_name) OVER(ORDER BY course_id) AS highest_price FROM school; 


/* CONVERSION FUNCTION
1) CAST ( expression AS data_type [ ( length ) ] )
*/

select cast(50.25 as int)


/* MATHMATICAL FUNCTION
1) ABS ( numeric_expression )
2) CEILING ( numeric_expression )   --This function returns the smallest integer greater than, or equal to, the specified numeric expression.
3) EXP ( float_expression )       --Returns the exponential value of the specified float expression.
4) FLOOR ( numeric_expression )   --Returns the largest integer less than or equal to the specified numeric expression.
5) PI ( )
6) POWER ( float_expression , y )
7) RAND ( [ seed ] )       --Returns a pseudo-random float value from 0 through 1, exclusive.
8) ROUND ( numeric_expression , length [ ,function ] )
9) SQRT ( float_expression )
10) SQUARE ( float_expression )
*/

select ABS (-5)
select CEILING(98.55)
select EXP(2)
select FLOOR(98.55)
select PI ( )
select POWER (2,3)
select RAND(2)
SELECT ROUND(123.4545, 2), ROUND(123.45, -2);
SELECT SQRT(1.00), SQRT(9);
select SQUARE (5)


/* STRING FUNCTION
1) CONCAT ( string_value1, string_value2 [, string_valueN ] )
2) LEFT ( character_expression , integer_expression )
3) LEN ( string_expression )
4) LOWER ( character_expression )
5) LTRIM ( character_expression , [ characters ] )
6) REPLACE ( string_expression , string_pattern , string_replacement )
7) REPLICATE ( string_expression , integer_expression )
8) REVERSE ( string_expression )
9) RIGHT ( character_expression , integer_expression )
10) RTRIM ( character_expression , [ characters ] )
11) STUFF ( character_expression , start , length , replaceWith_expression ) --The STUFF function inserts a string into another string. 
12) TRIM ( string )
13) UPPER ( character_expression )
14) TRANSLATE ( inputString, characters, translations )
15) SUBSTRING ( expression ,start , length )
*/

SELECT CONCAT ( 'Happy ', 'Birthday ', 13, '/', '01' ) AS Result;
SELECT LEFT('abcdefg',2);  
SELECT LEN('ajit') AS Length
SELECT LOWER('ARGENTINA') AS [lower]
SELECT LTRIM('     Five spaces are at the beginning of this string.');
SELECT REPLACE('abcdefghicde','cde','xxx');  
SELECT REPLICATE ('twitter ', 3)
SELECT REVERSE(1234) AS Reversed ;  
SELECT RIGHT('abcdefg', 2);
SELECT RTRIM('Removes trailing spaces.   ');
SELECT STUFF('abcdef', 2, 3, 'ijklmn');  
SELECT TRIM( '     test    ') AS Result;
SELECT UPPER ('argentina') as [upper]
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');
SELECT SUBSTRING('abcdef', 2, 3);


/* RELATIONAL OPERATOR
1) STRING_SPLIT ( string , separator [ , enable_ordinal ] )

*/
SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');



