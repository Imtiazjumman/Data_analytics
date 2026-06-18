
-- Where and having clause to filter sales data for a specific product and date range

Select * from dbo.Sales

Select 
	ProductID,
	SUM(TotalAmount) AS TotalSales,
	AVG(TotalAmount) AS AvgSales,
	SUM(Quantity) AS TotalQuantitySold,
	AVG(Quantity) AS AvgQuantitySold
from dbo.Sales
group by ProductID
Having SUM(TotalAmount) <700 --Filter the group results to include only those products where the total sales are less than 700.

Select 
productid, sum(totalamount) as TotalSales from dbo.Sales
where TotalAmount>=160
group by productid -- This query will return the total sales for each product where the total amount of the sale is greater than or equal to 160. The results are grouped by product ID.
having sum(totalamount)<600 -- This query will further filter the results to include only those products where the total sales are less than 600.
Order by TotalSales desc -- This query will order the results by total sales in descending order, showing the products with the highest total sales first.