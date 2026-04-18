
select * from [dbo].[EmployeeRecords]

select EmployeeID, FirstName, Salary from [dbo].[EmployeeRecords]
where EmployeeID = 1 and Salary > 50000

-- Want to filter the records based on the department and salary range. For example, if I want to find all employees in the 'Sales' department with a salary greater than 50000, how would I write that query?

select * from [dbo].[EmployeeRecords]
where Department = 'IT' and Salary <90000

select * from [dbo].EmployeeRecords
where Salary<=75000

select FirstName,LastName,Department, Salary from [dbo].EmployeeRecords
where Salary<=75000

select Distinct FirstName,LastName,Department, Salary from [dbo].EmployeeRecords
where Salary<=75000