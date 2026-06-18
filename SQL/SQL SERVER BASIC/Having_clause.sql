-- Having Clause: No

Select * from  dbo.Sales

-- Total Sales ,Avg sales, Total Quantity Sold, Average Quantity Sold for each distinct ProductID

Select 
	ProductID,
	SUM(TotalAmount) AS TotalSales,
	AVG(TotalAmount) AS AvgSales,
	SUM(Quantity) AS TotalQuantitySold,
	AVG(Quantity) AS AvgQuantitySold
from dbo.Sales
group by ProductID
Having SUM(TotalAmount) <700 -- This query will return the total sales, average sales, total quantity sold, and average quantity sold for each distinct ProductID where the total sales are less than 700.

Select 
	ProductID,
	SUM(TotalAmount) AS TotalSales,
	AVG(TotalAmount) AS AvgSales,
	SUM(Quantity) AS TotalQuantitySold,
	AVG(Quantity) AS AvgQuantitySold
from dbo.Sales
group by ProductID
Having SUM(TotalAmount) <700 and sum(Quantity) = 21 -- This query will return the total sales, average sales, total quantity sold, and average quantity sold for each distinct ProductID where the total sales are less than 700 and the total quantity sold equals 21.