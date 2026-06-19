
--Common Table Expression (CTE) হলো SQL-এর একটি সাময়িক বা অস্থায়ী রেজাল্ট সেট (Temporary Result Set), যা একটি নির্দিষ্ট কুয়েরি (SELECT, INSERT, UPDATE, বা DELETE) চালানোর সময় তৈরি হয় এবং কুয়েরিটি শেষ হওয়া মাত্রই মুছে যায়।

--সহজ কথায়, এটি একটি বড় বা জটিল কুয়েরিকে ছোট ছোট অংশে ভাগ করে কোডকে আরও পরিষ্কার, পঠনযোগ্য (Readable) এবং পরিচ্ছন্ন করতে সাহায্য করে। এটিকে আপনি একটি অস্থায়ী টেবিল বা ভার্চুয়াল ভিউ-এর মতো ভাবতে পারেন।

--CTE শুরু করার জন্য WITH কিওয়ার্ড ব্যবহার করতে হয়।

use [employee_details]
select * from employee

--create a replica of employees table
select * into employee_copy from employee

select * from employee_copy


--- Example 1 :CTE
with CTE_Employee as
(
	select EmployeeID, FirstName,LastName,Department
	from employee_copy
)

select * from CTE_Employee

---- Example 2: CTE with WHERE clause
with CTE_Employee as
(
	select EmployeeID, FirstName,LastName,Department
	from employee_copy
	where Department='IT'
)
select * from CTE_Employee

---- Example 3: CTE new column and copyying that into new table
with CTE_Employee as
(
	select EmployeeID, FirstName,LastName,Department, Salary*12 as AnnualSalary
	from employee_copy
)
select * into employee_annual_salary from CTE_Employee
select * from employee_annual_salary

---- Example 4: CTE with update statement

WITH CTE_IT_Employees AS
(
    SELECT EmployeeID, FirstName, LastName, Department, Salary
    FROM employee_copy
    WHERE Department = 'IT'
)
UPDATE CTE_IT_Employees
SET Salary = Salary * 1.10

select * from employee_copy

---- Example 5: CTE with delete statement

with CTE_IT_Employees AS
(
	SELECT EmployeeID, FirstName, LastName, Department, Salary
	FROM employee_copy
	WHERE Department = 'IT'
)
delete from CTE_IT_Employees
select * from employee_copy

---- Example 6: CTE with insert statement

-- Created by GitHub Copilot in SSMS - review carefully before executing
WITH CTE_New_Employees AS
(
	SELECT 11 AS EmployeeID, 'John' AS FirstName, 'Doe' AS LastName, 'HR' AS Department, 50000 AS Salary, CAST('2024-01-15' AS DATE) AS HireDate
	UNION ALL
	SELECT 12, 'Jane', 'Smith', 'HR', 55000, CAST('2024-01-20' AS DATE)
)
INSERT INTO dbo.employee_copy (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
SELECT EmployeeID, FirstName, LastName, Department, Salary, HireDate FROM CTE_New_Employees;

SELECT EmployeeID, FirstName, LastName, Department, Salary, HireDate FROM employee_copy;
select * from employee_copy
