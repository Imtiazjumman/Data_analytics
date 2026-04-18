-- create a replica of the Employee table with the same structure.

select * into #temp1
from dbo.Employee

select * from #temp1

select * from dbo.Employee

-- Replica of employee table records
select * into ##temp2
from [dbo].[EmployeeRecord]

select * from ##temp2
select * from #temp1