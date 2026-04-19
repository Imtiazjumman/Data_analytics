-- INSERT INTO Statement to add a new employee record into the Employee table

Select * from [dbo].[employee]
insert into [dbo].[employee] (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
values 
(6, 'Emily', 'Clark', 'Marketing', 65000, '2024-01-15'),
(7, 'Michael', 'Johnson', 'IT', 80000, '2024-02-20'),
(8, 'Sarah', 'Davis', 'Finance', 75000, '2024-03-10'),
(9, 'David', 'Wilson', 'HR', 60000, '2024-04-05'),
(10, 'Jessica', 'Miller', 'Marketing', 70000, '2024-05-01')

select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'employee'