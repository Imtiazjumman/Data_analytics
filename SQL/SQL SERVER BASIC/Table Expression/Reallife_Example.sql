

--আমরা এখানে একটি **E-commerce (ই-কমার্স)** সিনারিও দেখব। বাস্তব জীবনে ম্যানেজমেন্ট প্রায়ই জানতে চায়: **"আমাদের টপ কাস্টমাররা কে কোন পণ্যটি সবচেয়ে বেশি কিনেছেন এবং তারা মোট কত টাকা খরচ করেছেন?"**

-- ১. ডাটাবেজ তৈরি এবং সিলেক্ট করা
CREATE DATABASE EComDB;
GO

USE EComDB;
GO

-- ২. কাস্টমার এবং অর্ডারের তথ্য রাখার জন্য টেবিল তৈরি
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(50),
    ProductName VARCHAR(50),
    OrderAmount INT,
    OrderDate DATE
);

-- ৩. বাস্তবসম্মত কিছু ডাটা ইনসার্ট করা
INSERT INTO Orders (OrderID, CustomerName, ProductName, OrderAmount, OrderDate) VALUES
(101, 'Rahim', 'Laptop', 60000, '2026-01-10'),
(102, 'Karim', 'Phone', 25000, '2026-01-11'),
(103, 'Rahim', 'Mouse', 1500, '2026-01-12'),
(104, 'Sultana', 'Laptop', 65000, '2026-01-14'),
(105, 'Karim', 'Headphone', 3000, '2026-01-15'),
(106, 'Rahim', 'Keyboard', 2500, '2026-01-16'),
(107, 'Sultana', 'Phone', 30000, '2026-01-17'),
(108, 'Karim', 'Phone', 25000, '2026-01-18');

-- ৪. CTE ব্যবহার করে মাল্টি-স্টেজ রিয়েল লাইফ কুয়েরি
WITH CustomerSpending AS (
    -- ১ম ধাপ: প্রতিটি কাস্টমার মোট কত খরচ করেছেন এবং কয়টি অর্ডার করেছেন তা বের করা
    SELECT 
        CustomerName,
        SUM(OrderAmount) AS TotalSpent,
        COUNT(OrderID) AS TotalOrders
    FROM Orders
    GROUP BY CustomerName
),
FavProduct AS (
    -- ২য় ধাপ: উইন্ডো ফাংশন দিয়ে প্রতিটি কাস্টমারের সবচেয়ে দামি কেনা প্রোডাক্টটি খুঁজে বের করা
    SELECT 
        CustomerName,
        ProductName AS MostExpensivePurchase,
        ROW_NUMBER() OVER(PARTITION BY CustomerName ORDER BY OrderAmount DESC) AS RankNum
    FROM Orders
)
-- চূড়ান্ত ধাপ: দুটি CTE-কে জয়েন করে ফাইনাল রিপোর্ট তৈরি করা
SELECT 
    spending.CustomerName,
    spending.TotalSpent,
    spending.TotalOrders,
    fav.MostExpensivePurchase
FROM CustomerSpending spending
JOIN FavProduct fav ON spending.CustomerName = fav.CustomerName
WHERE fav.RankNum = 1 -- শুধু মাত্র সবচেয়ে দামি প্রোডাক্টটি ফিল্টার করার জন্য
ORDER BY spending.TotalSpent DESC;
/*
-- এই কুয়েরি আমাদেরকে নিম্নলিখিত তথ্য প্রদান করবে:
1. আপনার ভিআইপি বা টপ কাস্টমার কারা? (`TotalSpent` দিয়ে সর্ট করা)
2. তারা মোট কত টাকার ব্যবসা দিয়েছে?
3. তারা কতবার আপনার ওয়েবসাইট থেকে কেনাকাটা করেছে?
4. তাদের কেনা সবচেয়ে দামি বা প্রিমিয়াম প্রোডাক্ট কোনটি ছিল?
*/