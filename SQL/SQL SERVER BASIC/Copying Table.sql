CREATE DATABASE SchoolDB;
GO -- (SQL Server-এর ক্ষেত্রে কমান্ডটি কার্যকর করতে ব্যবহৃত হয়)

USE SchoolDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,        -- অনন্য আইডি (পূর্ণসংখ্যা)
    FirstName VARCHAR(50) NOT NULL,   -- নাম (টেক্সট, খালি রাখা যাবে না)
    LastName VARCHAR(50),             -- পদবী
    Age TINYINT,                      -- বয়স (ছোট সংখ্যা)
    GPA DECIMAL(3,2),                 -- রেজাল্ট (যেমন: 3.95)
    EnrollmentDate DATE               -- ভর্তির তারিখ
);

INSERT INTO Students (StudentID, FirstName, LastName, Age, GPA, EnrollmentDate)
VALUES (101, 'Arif', 'Hossain', 20, 3.85, '2026-01-15');

INSERT INTO Students (StudentID, FirstName, LastName, Age, GPA, EnrollmentDate)
VALUES (102, 'Sumi', 'Akter', 19, 4.00, '2026-02-10');

SELECT * FROM Students;

-- ১. টেবিল তৈরি
CREATE TABLE OldStudents (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    GPA DECIMAL(3,2),
    Status VARCHAR(20)
);

-- ২. কিছু স্যাম্পল ডেটা যোগ করা
INSERT INTO OldStudents (StudentID, FirstName, GPA, Status) VALUES 
(1, 'Karim', 3.90, 'Graduated'),
(2, 'Rahim', 3.40, 'Graduated'),
(3, 'Sultana', 3.95, 'Graduated');

-- SELECT INTO ব্যবহার করে নতুন টেবিলে ডেটা কপি
SELECT StudentID, FirstName, GPA 
INTO TopStudents
FROM OldStudents
WHERE GPA > 3.50;

SELECT * FROM TopStudents;