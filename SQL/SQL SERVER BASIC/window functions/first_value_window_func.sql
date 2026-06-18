

create database [window Func]

use [window Func]

CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'HR'),
(3, 'Charlie', 55000, 'HR'),
(4, 'David', 75000, 'Finance'),
(5, 'Eve', 80000, 'Finance'),
(6, 'Frank', 72000, 'Finance'),
(7, 'Grace', 90000, 'IT'),
(8, 'Heidi', 95000, 'IT'),
(9, 'Ivan', 87000, 'IT');

select * from EmployeeSalaries

--১. FIRST_VALUE() এর উদাহরণ (প্রতি ডিপার্টমেন্টে সর্বনিম্ন বেতন) আমরা যদি ডিপার্টমেন্ট অনুযায়ী ডাটা ভাগ করে (PARTITION BY Department), বেতন ছোট থেকে বড় হিসেবে সাজাই (ORDER BY Salary ASC), তবে প্রথম সারিটি হবে সর্বনিম্ন বেতন।

SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    Salary,
    FIRST_VALUE(Salary) OVER (
        PARTITION BY Department 
        ORDER BY Salary ASC
    ) AS Lowest_Dept_Salary
FROM EmployeeSalaries;

--২. LAST_VALUE() এর উদাহরণ (প্রতি ডিপার্টমেন্টে সর্বোচ্চ বেতন) একইভাবে সর্বোচ্চ বেতন বের করার জন্য আমরা ডাটা ছোট থেকে বড় সাজিয়ে (ORDER BY Salary ASC) একেবারে শেষ ভ্যালুটি নেব।

--সতর্কতা: পূর্বে যেমনটি বলেছিলাম, LAST_VALUE() ব্যবহারের সময় উইন্ডো ফ্রেম বা ROWS BETWEEN নির্দিষ্ট করে দিতে হয়, যাতে এটি বর্তমান সারি বা কারেন্ট রো-তে আটকে না গিয়ে পুরো ডিপার্টমেন্টের শেষ সারি পর্যন্ত চেক করে।

SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    Salary,
    LAST_VALUE(Salary) OVER (
        PARTITION BY Department 
        ORDER BY Salary ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS Highest_Dept_Salary
FROM EmployeeSalaries;