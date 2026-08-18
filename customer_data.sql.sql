USE campusX;
CREATE TABLE Customer_Data(
Customer_ID INT PRIMARY KEY,
Customer_Name VARCHAR(50),
Department VARCHAR(30),
Manager_ID INT,
Salary INT,
Age INT,
City VARCHAR(30)
);

INSERT INTO Customer_Data VALUES
(101,'Rahul','HR',NULL,45000,26,'Pune'),
(102,'Amit','IT',110,70000,30,'Mumbai'),
(103,'Neha','IT',110,70000,28,'Delhi'),
(104,'Priya','Finance',111,90000,35,'Pune'),
(105,'Karan','Finance',111,85000,32,'Mumbai'),
(106,'Sneha','HR',101,45000,25,'Delhi'),
(107,'Rohit','IT',110,60000,27,'Pune'),
(108,'Anjali','Finance',111,90000,34,'Delhi'),
(109,'Vikas','HR',101,50000,29,'Mumbai'),
(110,'Arjun','IT',NULL,100000,40,'Pune'),
(111,'Meera','Finance',NULL,110000,42,'Mumbai'),
(112,'Nitin','IT',110,55000,24,'Delhi'),
(113,'Komal','HR',101,48000,31,'Pune'),
(114,'Riya','Finance',111,75000,29,'Delhi'),
(115,'Suresh','IT',110,80000,33,'Mumbai');