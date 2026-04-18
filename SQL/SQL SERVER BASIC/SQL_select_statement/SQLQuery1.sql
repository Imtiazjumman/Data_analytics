Create database employee_details

use employee_details

CREATE TABLE employee (

	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR (50) NOT NULL,
	Department VARCHAR(50) NOT NULL,
	Salary Decimal(10, 2) NOT NULL,
	HireDate DATE NOT NULL
);

INSERT INTO employee (EmployeeID,FirstName,LastName,Department,Salary, HireDate)
VALUES 
(1,'John','Doe','HR',50000.00,'2020-01-15'),
(2,'Jane','Smith','IT',75000.00,'2019-03-23'),
(3,'Michael','Johnson','Finance',60000.00,'2021-07-30'),
(4,'Emily','Davis','Marketing',55000.00,'2018-11-12'),
(5,'David','Wilson','Sales',65000.00,'2022-02-20');