create database constraints

use constraints


/*
SQL-এ **Constraints** বা সীমাবদ্ধতা হলো কিছু নিয়ম (Rules) যা একটি টেবিলের ডেটার ওপর প্রয়োগ করা হয়। এর মূল উদ্দেশ্য হলো ডাটাবেসে সংরক্ষিত ডেটার নির্ভুলতা (Accuracy) এবং নির্ভরযোগ্যতা (Reliability) নিশ্চিত করা।

নিচে প্রধান SQL Constraints গুলোর সংক্ষিপ্ত বর্ণনা দেওয়া হলো:



### ১. NOT NULL
এই কনস্ট্রেইন্ট নিশ্চিত করে যে, একটি কলাম কখনো **খালি (Null)** থাকতে পারবে না। অর্থাৎ, ওই কলামে আপনাকে অবশ্যই কোনো মান দিতে হবে।
* *উদাহরণ:* শিক্ষার্থীর নাম (Name) কলামে এটি ব্যবহার করা হয়।

### ২. UNIQUE
এটি নিশ্চিত করে যে, একটি কলামের প্রতিটি মান একে অপরের থেকে আলাদা হবে। কোনো মান পুনরায় ব্যবহার (Duplicate) করা যাবে না।
* *উদাহরণ:* ইমেইল অ্যাড্রেস বা ফোন নম্বর।

### ৩. PRIMARY KEY
এটি **NOT NULL** এবং **UNIQUE** এর সংমিশ্রণ। এটি একটি টেবিলের প্রতিটি রো (Row) কে আলাদাভাবে চেনার জন্য ব্যবহৃত হয়। একটি টেবিলে কেবল একটিই Primary Key থাকতে পারে।
* *উদাহরণ:* StudentID বা EmployeeID।

### ৪. FOREIGN KEY
এটি দুটি টেবিলের মধ্যে সম্পর্ক তৈরি করে। এটি একটি টেবিলের এমন একটি কলাম যা অন্য একটি টেবিলের Primary Key-কে নির্দেশ করে। এটি ডেটার রেফারেন্সিয়াল ইন্টিগ্রিটি বজায় রাখে।

### ৫. CHECK
এটি নিশ্চিত করে যে, একটি কলামের মান একটি নির্দিষ্ট শর্ত পূরণ করছে।
* *উদাহরণ:* `CHECK (Age >= 18)` দিলে ১৮ বছরের নিচের কারো তথ্য ইনসার্ট করা যাবে না।

### ৬. DEFAULT
যদি কোনো কলামে কোনো মান দেওয়া না হয়, তবে এই কনস্ট্রেইন্টটি স্বয়ংক্রিয়ভাবে একটি ডিফল্ট মান বসিয়ে দেয়।
* *উদাহরণ:* কোনো অর্ডারের তারিখ না দিলে স্বয়ংক্রিয়ভাবে আজকের তারিখ (`GETDATE()`) বসে যাওয়া।

---

### কোড উদাহরণ:

```sql

```

**সংক্ষেপে:** কনস্ট্রেইন্ট ব্যবহার করলে ভুল ডেটা এন্ট্রি হওয়ার সম্ভাবনা কমে যায় এবং ডাটাবেস গুছিয়ে রাখা সহজ হয়।

*/

CREATE TABLE Employees_detailing (
    ID INT PRIMARY KEY,               -- Primary Key
    Name VARCHAR(50) NOT NULL,        -- Not Null
    Email VARCHAR(100) UNIQUE,        -- Unique
    Age INT CHECK (Age >= 18),        -- Check
    City VARCHAR(50) DEFAULT 'Dhaka'  -- Default
);

INSERT INTO Employees_detailing (ID, Name, Email, Age, City) 
VALUES (1, 'Arif Ahmed', 'arif@email.com', 25, 'Chittagong');

-- Default City (Dhaka) ব্যবহার করতে চাইলে:
INSERT INTO Employees_detailing (ID, Name, Email, Age) 
VALUES (2, 'Sumi Akter', 'sumi@email.com', 22); 
-- এখানে City কলাম উল্লেখ না করায় স্বয়ংক্রিয়ভাবে 'Dhaka' বসে যাবে।

select * from Employees_detailing

INSERT INTO Employees_detailing(ID,Name,Email) VALUES (3, 'test@email.com'); 
-- Error: Name কলাম খালি রাখা যাবে না।

INSERT INTO Employees_detailing(ID, Name, Age) VALUES (4, 'Rohan', 15); 
-- Error: Age অবশ্যই ১৮ বা তার বেশি হতে হবে।

INSERT INTO Employees_detailing(ID, Name, Email) VALUES (1, 'Kabir', 'arif@email.com'); 
-- Error: ID (1) অথবা Email আগে থেকেই আছে।

INSERT INTO Employees_detailing(ID, Name, Email, Age, City) 
VALUES 
(5, 'Rakib Hasan', 'rakib@email.com', 28, 'Sylhet'),
(6, 'Tahmina', 'tahmina@email.com', 24, 'Rajshahi'),
(7, 'Jashim Uddin', 'jashim@email.com', 30, DEFAULT);

SELECT * FROM Employees_detailing;