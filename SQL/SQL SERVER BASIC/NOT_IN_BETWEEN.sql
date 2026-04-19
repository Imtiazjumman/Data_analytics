
--Not, Between,In in SQL Server are used to filter data based on specific conditions. Here are examples of how to use each of these operators

select * from EmployeeRecords

select * from EmployeeRecords
where not FirstName = 'John' and not Salary = 60000

select * from EmployeeRecords
where not LastName ='Smith' and not Department = 'Finance'

select * from EmployeeRecords
where Salary between 70000 and 75000

select * from dbo.EmployeeRecords
where not Salary between 50000 and 60000

select * from EmployeeRecords
where Department = 'IT' or Department = 'Finance'

select * from EmployeeRecords
where Department in ('IT', 'Finance')

select * from EmployeeRecords
where Department not in ('IT', 'Finance')