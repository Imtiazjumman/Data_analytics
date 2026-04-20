-- delet, drop, and truncate 

SELECT * FROM [dbo].[EmployeeRecord]

INSERT INTO [dbo].[EmployeeRecord] (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(6, 'Sarah', 'Miller', 'HR', 52000),
(7, 'Robert', 'Brown', 'Finance', 80000),
(8, 'Jessica', 'Taylor', 'Marketing', 48000),
(9, 'Daniel', 'Anderson', 'IT', 62000),
(10, 'Laura', 'Thomas', 'HR', 53000);

SELECT * FROM [dbo].[EmployeeRecord]

delete from [dbo].[EmployeeRecord] 
where lastname = 'Miller' or department = 'Sales'

SELECT * FROM [dbo].[EmployeeRecord]

--Truncate the table to remove all records

Select * into #TempEmployeeRecord from [dbo].[EmployeeRecord] 

select * from #TempEmployeeRecord
truncate table #TempEmployeeRecord
select * from #TempEmployeeRecord

-- Drop the temporary table
Select * into #Temp_EmployeeRecord from [dbo].[EmployeeRecord]
select * from #Temp_EmployeeRecord
drop table #Temp_EmployeeRecord
select * from #Temp_EmployeeRecord

