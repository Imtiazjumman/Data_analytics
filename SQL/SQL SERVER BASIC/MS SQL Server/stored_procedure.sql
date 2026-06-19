
/*
Stored Procedure (স্টোর্ড প্রসিডিউব) হলো এক বা একাধিক SQL স্টেটমেন্টের একটি কালেকশন বা গ্রুপ, যা ডাটাবেজে একটি নির্দিষ্ট নাম দিয়ে সেভ বা সংরক্ষণ করে রাখা হয়।

সহজ কথায়, এটি হলো SQL-এর একটি ফাংশন বা মেথড-এর মতো। আপনি যদি একই SQL কোড বারবার লিখতে না চান, তবে সেই কোডটিকে একবার একটি Stored Procedure-এর ভেতর ঢুকিয়ে সেভ করে রাখবেন। পরবর্তীতে মাত্র এক লাইনের একটি কমান্ড দিয়ে পুরো কোডটি রান করা যায়।
*/

create database testDB
use testDB

/*NVARCHAR(50): এখানে সর্বোচ্চ ৫০টি অক্ষর রাখা যাবে। (যেমন: নাম, ইমেইল, পাসওয়ার্ড)।

NVARCHAR(MAX): এটি বিশাল টেক্সটের জন্য ব্যবহৃত হয়। এখানে সর্বোচ্চ প্রায় ২ গিগাবাইট (GB) পর্যন্ত ডাটা বা বড় বড় প্যারাগ্রাফ রাখা যায় (যেমন: ব্লগের আর্টিকেল বা প্রোডাক্ট ডেসক্রিপশন)।
*/

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

select * from Employees

--Example 1- Get Employees by Department

-- প্রসিডিউর তৈরি
CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DeptID INT
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, Email, Salary
    FROM Employees
    WHERE DepartmentID = @DeptID;
END;
GO

-- প্রসিডিউর রান করার নিয়ম (যেমন: ১০১ নম্বর ডিপার্টমেন্টের ডাটা দেখতে)
EXEC sp_GetEmployeesByDepartment @DeptID = 101;

--Example 2- Update Employee Salary

-- প্রসিডিউর তৈরি
CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmpID INT,
    @NewSalary DECIMAL(10, 2)
AS
BEGIN
    UPDATE Employees
    SET Salary = @NewSalary
    WHERE EmployeeID = @EmpID;
    
    -- আপডেট ঠিকঠাক হয়েছে কিনা তা নিশ্চিত করতে একটি কনফার্মেশন মেসেজ দেখাবে
    SELECT 'Salary updated successfully for Employee ID: ' + CAST(@EmpID AS VARCHAR(10)) AS StatusMessage;
END;
GO

-- প্রসিডিউর রান করার নিয়ম (যেমন: ৪ নম্বর আইডির বেতন ৬৮০০০ থেকে বাড়িয়ে ৭২০০Group করা)
EXEC sp_UpdateEmployeeSalary @EmpID = 4, @NewSalary = 72000.00;

--Example03 : Employee validation with email

-- প্রসিডিউর তৈরি
CREATE PROCEDURE sp_InsertEmployee
    @EmpID INT,
    @FName NVARCHAR(50),
    @LName NVARCHAR(50),
    @Email NVARCHAR(100),
    @DeptID INT,
    @HDate DATE,
    @Salary DECIMAL(10, 2)
AS
BEGIN
    -- ইমেইলটি অলরেডি আছে কিনা চেক করা হচ্ছে
    IF EXISTS (SELECT 1 FROM Employees WHERE Email = @Email)
    BEGIN
        PRINT 'Error: এই ইমেইলটি দিয়ে অলরেডি একজন কর্মচারী আছেন!';
    END
    ELSE
    BEGIN
        -- ইমেইল না থাকলে ডাটা ইনসার্ট হবে
        INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
        VALUES (@EmpID, @FName, @LName, @Email, @DeptID, @HDate, @Salary);
        
        PRINT 'Success: নতুন কর্মচারী সফলভাবে যোগ করা হয়েছে!';
    END
END;
GO

-- প্রসিডিউর রান করার নিয়ম (সঠিক ডাটা দিয়ে)
EXEC sp_InsertEmployee 6, 'Kamal', 'Hasan', 'kamal.hasan@example.com', 103, '2026-06-20', 60000.00;