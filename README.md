# sql-customer-data-analysis
SQL practice project covering subqueries, correlated subqueries, ANY/ALL, CTEs, aggregations, joins and analytical queries.
# SQL Customer Data Analysis

## Project Overview

A SQL practice project using a custom **Customer_Data** dataset to analyze salaries, departments, managers, and cities using MySQL.

The project focuses on writing analytical SQL queries and solving real-world style data problems.

##  Objectives

- Practice SQL filtering and aggregation
- Work with subqueries and correlated subqueries
- Use `IN`, `ANY`, and `ALL`
- Practice `GROUP BY`, `HAVING`, `ORDER BY`
- Use CTEs and CTEs with joins
- Perform department and city-level salary analysis

## Tools Used

- MySQL
- MySQL Workbench
- GitHub

##  Project Structure

```text
SQL-Customer-Data-Analysis/
│
├── README.md
│
├── data/
│   └── customer_data.sql
│
└── sql/
    ├── 01_basic_subqueries_any_all.sql
    ├── 02_cte.sql
    └── 03_advanced_cte_analysis.sql
```

## 📊Dataset

**Table:** `Customer_Data`

**15 records | 7 columns**

Columns include:

`Customer_ID`, `Customer_Name`, `Department`, `Manager_ID`, `Salary`, `Age`, `City`

##  SQL Concepts Covered

- Basic SQL Queries
- Aggregate Functions
- Subqueries
- Correlated Subqueries
- `IN`, `ANY`, `ALL`
- `GROUP BY` & `HAVING`
- Common Table Expressions (CTEs)
- CTE + JOIN
- Multiple CTEs
- Comparative Salary Analysis

##  Analysis Performed

The project includes queries to identify:

- Customers earning above average salary
- Highest-paid employees by department
- Departments with the highest average and total salary
- Customers earning above their department/city average
- Departments with the highest number of customers
- Salary and age comparisons across departments

##  How to Run

1. Open **MySQL Workbench**.
2. Run `data/customer_data.sql` to create and populate the table.
3. Execute the SQL files inside the `sql/` folder.
4. Each query includes a comment describing the problem being solved.

##  Author

**Pankaj Bhosale**

Aspiring Data Analyst | SQL | Python | Data Analytics
