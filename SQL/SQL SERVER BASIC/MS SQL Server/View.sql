Use testDB

/*
MySQL-এ View (ভিউ) হলো একটি ভার্চুয়াল টেবিল (Virtual Table)। এর নিজস্ব কোনো বাস্তব ডাটা থাকে না বা এটি ডাটাবেজের মেমরিতে কোনো জায়গা দখল করে না।

সহজ কথায়, এটি হলো একটি সেভ করে রাখা SQL কুয়েরি (Stored Query)। আপনি যখন কোনো View রান করবেন, তখন এটি পেছনের আসল টেবিল (Base Table) থেকে রিয়েল-টাইম ডাটা তুলে এনে হুবহু একটি সাধারণ টেবিলের মতো স্ক্রিনে দেখাবে।

ভিউ ব্যবহারের সুবিধা
জটিলতা কমানো (Simplicity): ৩-৪টি টেবিলের বড় জয়েন কুয়েরিকে মাত্র ১ লাইনের SELECT কমান্ডে রূপান্তর করে।

নিরাপত্তা (Security): টেবিলের গোপন কলাম (যেমন: স্যালারি, পাসওয়ার্ড) লুকিয়ে রেখে ইউজারকে শুধু নির্দিষ্ট ডাটা দেখার অনুমতি দেওয়া যায়।

একই লজিক (Consistency): সব টিম যেন একই নিয়ম বা হিসাবের ডাটা দেখতে পায়, তা নিশ্চিত করে।
*/

-- ১. ডিপার্টমেন্ট টেবিল
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL
);

-- ২. এমপ্লয়ি টেবিল (এখানে স্যালারি কলামটি গোপন বা সিক্রেট)
CREATE TABLE Employeess (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Salary DECIMAL(10, 2) -- এই ডাটাটি আমরা সাধারণ ইউজারদের দেখাতে চাই না
);

-- ডিপার্টমেন্টের ডাটা
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES 
(101, 'IT'),
(102, 'HR'),
(103, 'Finance');

-- এমপ্লয়িদের ডাটা
INSERT INTO Employeess(EmployeeID, FirstName, LastName, Email, DepartmentID, Salary) VALUES 
(1, 'John', 'Smith', 'john@example.com', 101, 75000.00),
(2, 'Jane', 'Doe', 'jane@example.com', 102, 60000.00),
(3, 'Michael', 'Brown', 'michael@example.com', 101, 95000.00),
(4, 'Emily', 'Davis', 'emily@example.com', 103, 68000.00);

CREATE VIEW vw_EmployeePublicDetails AS
SELECT 
    e.EmployeeID,
    CONCAT(e.FirstName, ' ', e.LastName) AS FullName,
    e.Email,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- ভিউ থেকে ডাটা দেখা
SELECT * FROM vw_EmployeePublicDetails;