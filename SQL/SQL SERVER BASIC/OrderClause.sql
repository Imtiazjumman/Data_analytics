
-- AQL ORDER BY clause is used to sort the result set of a query by one or more columns. The syntax for the ORDER BY clause is as follows:

select * from [dbo].[Employee]

order by Salary asc


select * from [dbo].[Employee]
order by Salary desc

select * from [dbo].[Employee]
order by Department asc

select * from [dbo].[Employee]
order by FirstName asc, Salary desc

select * from [dbo].[Employee]
order by HireDate asc,FirstName desc