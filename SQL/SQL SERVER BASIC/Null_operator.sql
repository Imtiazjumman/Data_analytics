CREATE TABLE Employee_Record (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(18, 2)
);

INSERT INTO Employee_Record (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
    (1, 'John', 'Doe', 'HR', 50000.00),
    (2, 'Jane', 'Smith', 'IT', 60000.00),
    (3, 'Michael', 'Johnson', 'Finance', 55000.00),
    (4, 'Emily', 'Davis', 'Marketing', 45000.00),
    (5, 'David', 'Wilson', 'Sales', 70000.00),
    (6, 'Sarah', 'Miller', 'HR', 52000.00),
    (7, 'Chris', NULL, 'IT', 62000.00),         -- LastName is NULL
    (8, 'Jessica', 'Taylor', 'Finance', 58000.00),
    (9, 'Daniel', 'Anderson', '', 47000.00),  -- Department is NULL
    (10, 'Laura', 'Thomas', 'Sales', 0);      -- Salary set to NULL instead of 0

    select * from Employee_Record
    where Salary is not null and Department is not null and LastName is not null;

    select * from Employee_Record
    where  lastname is null;