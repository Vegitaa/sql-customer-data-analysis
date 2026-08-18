--  1. Basic Data Retrieval
-- Question 1:- 
-- Retrieve all records from the Customer_Data table.

select * from customer_data;

-- 2. Subqueries
-- Question 2:
-- Find all customers whose salary is greater than
-- the overall average salary.

select * from customer_data where salary > (select avg(salary) from customer_data);

-- Question 3:
-- Find all customers whose salary is
-- greater than the average salary of their own department.

select * from customer_data  c1 where c1.salary > (select Avg(c2.salary) from customer_data c2 where c1.Department= c2.Department);

-- Question 4: 
-- Find the department with the highest average salary.

select Department,Avg(Salary) as avg_salary from customer_data group by Department order by (avg_salary) desc limit 1; 

-- Question 5:
-- Find the department with the highest average salary.

select * from customer_data c1 where c1.Salary = (select max(c2.Salary) from customer_data c2 where c2.Department=c1.Department);

-- Question 6:
-- Find all customers whose age is greater than the average age of all customers.


select * from customer_data where Age >(select avg(Age) from customer_data);

-- 3. ANY and ALL
-- Question 7:
-- Find customers whose salary is less than every salary in the Finance department.
SELECT *  FROM Customer_data WHERE 
Salary < ALL 
(SELECT Salary FROM  Customer_data 
WHERE Department = 'Finance');


-- 3. ANY and ALL

-- Question 8:
-- Find customers whose salary is greater than at least one salary in the HR department.

SELECT *  FROM Customer_data WHERE 
Salary > ANY 
(SELECT Salary FROM  Customer_data 
WHERE Department = 'HR');

-- Question 9:
-- Find customers who live in a city where at least one Finance department employee lives.
SELECT * FROM Customer_data c1 WHERE c1.City IN
(SELECT c2.City FROM Customer_data c2 WHERE
Department = 'Finance');

-- Question 10:
-- Find departments that have more than 3 customers.
SELECT Department,count(*) as Number_of_Customer FROM Customer_data 
GROUP BY Department
 HAVING Number_of_Customer > 3;
 

 -- Question 11:
-- Find the department(s) having the lowest average salary using the ALL operator.
 SELECT Department, Avg(Salary) as avg_salary 
 FROM Customer_data Group by Department 
 HAVING avg_salary <= ALL
 (SELECT AVG(Salary) as Avg_Salary FROM Customer_data GROUP BY Department);
 
 WITH all_row AS (
 SELECT * FROM Customer_data
 )
 SELECT * FROM all_row;
 
 WITH IT_Customer AS (
 SELECT * FROM Customer_data WHERE
Department ='IT'
 )
 SELECT * FROM IT_Customer;
 
 
 WITH AVG_Dep AS (
 SELECT Department ,AVG(Salary) as avg_salary FROM Customer_data GROUP BY Department
 )
SELECT c.Customer_Name,
	c.Department,
	c.Salary,
	d.avg_salary 
from Customer_Data c
join AVG_Dep d
on c.Department=d.Department;

 WITH AVG_Dep AS (
 SELECT Department ,AVG(Salary) as avg_salary FROM Customer_data GROUP BY Department
 )
SELECT c.Customer_Name,
	c.Department,
	c.Salary,
	d.avg_salary 
from Customer_Data c
join AVG_Dep d
on c.Department=d.Department
 where c.Salary>d.avg_salary;
 
 WITH IT_Departments AS (
 SELECT * FROM Customer_Data
 WHERE Department ='IT'
 )
 SELECT Customer_ID,Customer_Name,Department,Salary FROM IT_departments;
 
 
 WITH Avg_salary AS (
 SELECT AVG(Salary) as avg_salary FROM Customer_Data
 )
select * from Customer_data 
where Salary > (
Select avg_salary from Avg_salary
);

WITH Salary_age AS (
SELECT * FROM Customer_Data WHERE salary > 70000
)
SELECT * FROM Salary_age WHERE age > 30;


WITH department_Avg_salary AS(
SELECT Department ,avg(Salary) as Avg_salary FROM Customer_Data 
GROUP BY Department
)
 SELECT Department,Avg_Salary FROM department_Avg_salary WHERE Avg_salary >65000;
 
 WITH Customer_pune AS (
 SELECT * FROM Customer_Data
 WHERE city ='Pune'
 )
 SELECT * FROM Customer_pune
 WHERE Salary =(Select Max(Salary) from Customer_pune);
 
 SELECT * FROM customer_Data WHERE Manager_ID IS NOT NULL ;
 
 WITH Not_null AS (
	SELECT * FROM customer_Data WHERE Manager_ID IS NOT NULL 
 )
 SELECT Customer_Name, Manager_ID FROM Not_null where Manager_ID = 110;
 
 WITH Total_Customer AS (
 SELECT Department,
 Count(Department) as 
 total
FROM Customer_Data
GROUP BY Department
 )
 SELECT * FROM Total_Customer
 WHERE total
 =
 (Select 
 Max(total) 
 from Total_Customer);
 
 WITH avg_salary_Department AS (
 SELECT AVG(Salary) as avg_salary,
 department 
 FROM Customer_Data 
 GROUP BY Department
 )
 SELECT * FROM Customer_Data C
 JOIN avg_salary_Department A 
 ON C.Department = A.department 
 where C.Salary > A.avg_salary;
 
 
 WITH Pune_Customer AS (
 SELECT * FROM Customer_Data WHERE 
 City = 'Pune'
 ),
Mumbai_avg_salary AS (
 SELECT AVG(Salary) as Mumbai_avg_Salary FROM Customer_Data WHERE City = 'Mumbai'
 )
 
 SELECT * FROM Pune_Customer where Salary >(SELECT Mumbai_avg_Salary FROM Mumbai_avg_salary);
 
 
 With Max_salary AS (
 select Department,max(salary) as Highest_salary from customer_data group by Department
 )
 select * from Customer_Data C
 join Max_salary M 
 ON C.Department = M.Department 
 Where C.Salary = M.Highest_salary;
 
 
 WITH avg_city_salary AS (
 SELECT City,Avg(Salary) as avg_salary FROM Customer_Data GROUP BY City 
 )
 SELECT C.Customer_ID,
		C.Customer_Name,
        C.Department,
        C.City, 
        C.Salary,
        A.avg_Salary
FROM Customer_Data C 
JOIN avg_city_salary A
ON A.City =C.City 
WHERE C.Salary >A.avg_salary;


WITH Avg_age_salary AS (
SELECT  Avg(Salary) as Avg_Salary, 
		Avg(Age) as Avg_Age,
        Department
        FROM Customer_Data 
        GROUP BY Department 
)
SELECT C.Customer_Name,
	   C.Department,
       C.Salary,
       C.Age,
       A.Avg_Salary,
       A.Avg_Age 
       FROM Customer_Data C JOIN Avg_age_salary A
ON 
C.Department = A.Department 
WHERE C.Salary > A.Avg_Salary and C.Age < A.Avg_Age;


WITH Department_Total AS (
SELECT Department,
SUM(salary) as Total_Salary 
FROM Customer_Data 
GROUP BY Department
)
SELECT Department,
Total_Salary FROM Department_Total 
WHERE 
Total_Salary 
= (SELECT MAX(Total_Salary) FROM Department_Total);


WITH Department_avg AS (
SELECT Department,avg(salary) as 
Avg_Salary
 FROM Customer_Data 
GROUP BY Department
),
Above_Avg AS  (
SELECT C.Customer_Name, C.Department, C.Salary 
FROM Customer_Data C 
JOIN Department_avg D
on C.Department= D.Department 
where C.Salary > D.Avg_Salary
)
SELECT Customer_Name,
Department,
Salary 
FROM Above_Avg;




WITH Department_avg AS (
SELECT Department,Avg(Salary) AS Avg_Salary FROM Customer_Data GROUP BY Department
),
Above_avg AS (
SELECT 
C.Customer_Name,
C.Department,
C.City,
C.Salary FROM Customer_Data C
JOIN Department_avg D
ON C.Department=D.Department
WHERE 
C.Salary>D.Avg_Salary 
),
Pune_above_avg AS (
SELECT 
Customer_Name,
Department,
City,
Salary 
FROM  Above_avg 
Where City='Pune'
)

Select Customer_Name,
Department,
City,
Salary FROM Pune_above_avg