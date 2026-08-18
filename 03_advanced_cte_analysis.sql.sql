-- 05_advanced_cte_analysis.sql
-- Question 26:
-- Find the customer(s) who have the highest salary in each department
-- using a CTE.
With Max_salary AS (
 select Department,max(salary) as Highest_salary from customer_data group by Department
 )
 select * from Customer_Data C
 join Max_salary M 
 ON C.Department = M.Department 
 Where C.Salary = M.Highest_salary;
 
-- Question 27:
-- Calculate the average salary for each city and find customers
-- whose salary is above their city's average salary.
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

-- Question 28:
-- For each department, calculate the average salary and average age.
-- Find customers whose salary is above their department's average salary
-- and whose age is below their department's average age.

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

-- Question 29:
-- Calculate the total salary paid by each department and find
-- the department with the highest total salary.

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

-- Question 30:
-- Find all customers whose salary is above the average salary
-- of their department using CTEs.
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

-- Question 31:
-- Using multiple CTEs, find customers who earn more than
-- their department's average salary and belong to Pune
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