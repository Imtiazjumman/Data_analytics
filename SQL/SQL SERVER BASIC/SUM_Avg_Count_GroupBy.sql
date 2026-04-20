
-- SUM, Average, Count and Group By example for Sales table in Sales Database

select * from dbo.Sales

select sum(Quantity)[TotalQuantity] from dbo.Sales
select sum(TotalAmount)[TotalSales] from dbo.Sales

select sum(quantity)[TotalQuantity], sum(TotalAmount)[TotalSales] from dbo.Sales

-- Average
select * from dbo.Sales
select avg(Quantity)[AverageQuantity] from dbo.Sales
select avg(TotalAmount)[AverageTotalAmount] from dbo.Sales

select avg(Quantity)[AverageQuantity], avg(TotalAmount)[AverageTotalAmount] from dbo.Sales

-- Sum of quantity and total amount , avg of quantity and avg total amount by product id

select 
ProductID,
sum(Quantity) as [Total Quantity],
sum(TotalAmount) as [Sum of Amount],
avg(Quantity) [Average Quantity Sold],
avg(TotalAmount) [Average Amount]
from dbo.Sales
group by ProductID

select 
ProductID,StoreID,
sum(Quantity) as [Total Quantity],
sum(TotalAmount) as [Sum of Amount],
avg(Quantity) [Average Quantity Sold],
avg(TotalAmount) [Average Amount]
from dbo.Sales
group by ProductID,StoreID

-- Count different records from Sales table

select * from dbo.Sales

select count(*)[Number of Rows] from dbo.Sales

--Null value wont be counted in count function

select count(PaymentMethod)[Number of Payment Methods] from dbo.Sales

-- Distinct product ids

select count(distinct ProductID)[Number of Distinct Products] from dbo.Sales

select paymentmethod, count(distinct paymentMethod)[Number of Payment Methods] from dbo.Sales
group by paymentmethod

-- Count how many times each payment method was used

select paymentmethod, count(PaymentMethod)[number of payment] from dbo.Sales
group by paymentmethod

select * from dbo.Sales
