/*
SQL Index (ইনডেক্স) হলো একটি বইয়ের সূচিপত্র বা Index Page-এর মতো। একটি ৫০০ পৃষ্ঠার বইয়ের নির্দিষ্ট একটি অধ্যায় যেমন পুরো বই না খুঁজে সূচিপত্র দেখে ১ সেকেন্ডে বের করা যায়, ডাটাবেজের ইনডেক্সও ঠিক একইভাবে কাজ করে।

ইনডেক্স ছাড়া ডাটাবেজকে কোনো তথ্য খুঁজতে দিলে সে পুরো টেবিল প্রথম থেকে শেষ পর্যন্ত খোঁজে (যাকে Table Scan বলে)। আর ইনডেক্স থাকলে সে সরাসরি নির্দিষ্ট লাইনে চলে যায় (যাকে Index Seek বলে)। এর ফলে কুয়েরির স্পিড বা পারফরম্যান্স ১০০০ গুণ পর্যন্ত বেড়ে যেতে পারে।
*/

CREATE DATABASE IndexDemoDB;

USE IndexDemoDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY, -- এখানে অটোমেটিক একটি Clustered Index তৈরি হয়ে গেছে
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    City NVARCHAR(50)
);

INSERT INTO Customers (CustomerID, FullName, Email, City) VALUES 
(1, 'Rahim Ahmed', 'rahim@example.com', 'Dhaka'),
(2, 'Karim Uddin', 'karim@example.com', 'Chittagong'),
(3, 'Sultana Razia', 'sultana@example.com', 'Sylhet'),
(4, 'Asif Karim', 'asif@example.com', 'Dhaka'),
(5, 'Tamim Iqbal', 'tamim@example.com', 'Chittagong'),
(6, 'Rony Khan', 'rony@example.com', 'Barisal'),
(7, 'Nusrat Jahan', 'nusrat@example.com', 'Dhaka'),
(8, 'Arif Chowdhury', 'arif@example.com', 'Sylhet'),
(9, 'Farhana Yasmin', 'farhana@example.com', 'Khulna'),
(10, 'Sajid Islam', 'sajid@example.com', 'Rajshahi'),
(11, 'Anika Tabassum', 'anika@example.com', 'Dhaka'),
(12, 'Imran Hossen', 'imran@example.com', 'Chittagong');

/*
ইনডেক্স ছাড়া খোঁজার সমস্যা (The Problem):
মনে করুন, আপনার টেবিলে ১০ লাখ ডাটা আছে এবং আপনি নিচের কুয়েরিটি চালালেন:যেহেতু City কলামে কোনো ইনডেক্স নেই, ডাটাবেজ ইঞ্জিন পুরো ১০ লাখ মানুষের ডাটা এক এক করে চেক করবে। এতে কুয়েরি রান হতে অনেক সময় লাগবে (Table Scan)।
*/

SELECT * FROM Customers WHERE City = 'Sylhet';

/*
Non-Clustered Index তৈরি করা (The Solution)
এখন আমরা City কলামের ওপর একটি ইনডেক্স তৈরি করব*/

CREATE INDEX idx_Customers_City 
ON Customers (City);

SELECT * FROM Customers WHERE City = 'Sylhet';

/*
ইনডেক্স ব্যবহারের কিছু জরুরি নিয়ম (A to Z Best Practices)
কখন ব্যবহার করবেন: যে কলামগুলো WHERE, JOIN, ORDER BY অথবা GROUP BY-তে সবচেয়ে বেশি ব্যবহার করা হয়, সেগুলোতে ইনডেক্স তৈরি করুন।

কখন ব্যবহার করবেন না: ছোট টেবিলে ইনডেক্স করার দরকার নেই। আবার যে কলামে ঘন ঘন INSERT, UPDATE বা DELETE হয়, সেখানে বেশি ইনডেক্স তৈরি করলে উল্টো পারফরম্যান্স কমে যায়। কারণ প্রতিবার ডাটা পরিবর্তন হলে ডাটাবেজকে পেছনের সূচিপত্র বা ইনডেক্সটিও আপডেট করতে হয়।
*/