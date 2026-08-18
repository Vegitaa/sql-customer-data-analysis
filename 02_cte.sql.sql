 -- 04_cte.sql 
 -- -- Question 12:
-- Create a CTE that returns all records from the Customer_Data table.
 WITH all_row AS (
 SELECT * FROM Customer_data
 )
 SELECT * FROM all_row;
 
 
--  Question 13:
-- Create a CTE that returns only customers who belong to the IT department.
 WITH IT_Customer AS (
 SELECT * FROM Customer_data WHERE
Department ='IT'
 )
 SELECT * FROM IT_Customer;
 
-- Question 14:
-- Using a CTE, calculate the average salary of each department
-- and display each customer's salary along with their department's average salary.
 
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


-- Question 15:
-- Using the department-average CTE, find customers whose salary
-- is above their department's average salary.

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
 
-- Question 16:
-- Using a CTE, retrieve the Customer ID, Customer Name,
-- Department, and Salary of all IT customers.
 
 WITH IT_Departments AS (
 SELECT * FROM Customer_Data
 WHERE Department ='IT'
 )
 SELECT Customer_ID,Customer_Name,Department,Salary FROM IT_departments;
 
 -- Question 17:
-- Create a CTE containing the overall average salary,
-- then find all customers whose salary is above the overall average.

 WITH Avg_salary AS (
 SELECT AVG(Salary) as avg_salary FROM Customer_Data
 )
select * from Customer_data 
where Salary > (
Select avg_salary from Avg_salary
);

-- Question 18:
-- Using a CTE, find customers whose salary is greater than 70,000
-- and whose age is greater than 30.

WITH Salary_age AS (
SELECT * FROM Customer_Data WHERE salary > 70000
)
SELECT * FROM Salary_age WHERE age > 30;

-- Question 19:
-- Calculate the average salary for each department and display
-- only departments whose average salary is greater than 65,000.

WITH department_Avg_salary AS(
SELECT Department ,avg(Salary) as Avg_salary FROM Customer_Data 
GROUP BY Department
)
 SELECT Department,Avg_Salary FROM department_Avg_salary WHERE Avg_salary >65000;
 
 -- Question 20:
-- Using a CTE, find the customer(s) from Pune with the highest salary.
 
 WITH Customer_pune AS (
 SELECT * FROM Customer_Data
 WHERE city ='Pune'
 )
 SELECT * FROM Customer_pune
 WHERE Salary =(Select Max(Salary) from Customer_pune);
 
 
-- Question 21:
-- Find all customers who have a manager assigned. 
 SELECT * FROM customer_Data WHERE Manager_ID IS NOT NULL ;
 
 
-- Question 22:
-- Using a CTE, find customers whose Manager_ID is 110
-- and display their Customer Name and Manager ID.
 WITH Not_null AS (
	SELECT * FROM customer_Data WHERE Manager_ID IS NOT NULL 
 )
 SELECT Customer_Name, Manager_ID FROM Not_null where Manager_ID = 110;
 
-- Question 23:
-- Find the department with the highest number of customers.
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
 
-- Question 24:
-- Find all customers whose salary is above their department's
-- average salary using a CTE.
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
 
-- Question 25:
-- Find all customers whose salary is above their department's
-- average salary using a CTE.
 WITH Pune_Customer AS (
 SELECT * FROM Customer_Data WHERE 
 City = 'Pune'
 ),
Mumbai_avg_salary AS (
 SELECT AVG(Salary) as Mumbai_avg_Salary FROM Customer_Data WHERE City = 'Mumbai'
 )
 
 SELECT * FROM Pune_Customer where Salary >(SELECT Mumbai_avg_Salary FROM Mumbai_avg_salary);
 
 
