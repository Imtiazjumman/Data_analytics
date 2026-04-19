-- AND ,OR STATEMENT
-- Here are some examples of SQL queries using AND and OR statements based on the EmployeeRecords table:
-- IF one condition is true and the other is false, the AND statement will return false, while the OR statement will return true.


SELECT * from EmployeeRecords
where LastName = 'Miller' and EmployeeID = 3

SeLECT * from EmployeeRecords
where Department = 'HR' and Salary >=60000


select * from EmployeeRecords
where Department = 'Finance' or Department = 'IT'or Salary >= 90000

SELECT * from EmployeeRecords
where Department = 'IT' or Salary >= 80000

select * from EmployeeRecords
where (Department = 'Finance' or Department = 'IT') and Salary = 75000