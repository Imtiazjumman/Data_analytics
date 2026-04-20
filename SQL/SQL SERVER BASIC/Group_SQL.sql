

 -- Find total amount of sales for each payment method in the Sales table
 select * from dbo.Sales

 select * from dbo.Sales

select PaymentMethod, sum(TotalAmount)[Total Sales] from dbo.Sales
group by PaymentMethod

select PaymentMethod,ProductId, sum(TotalAmount)[Total Sales] from dbo.Sales
group by PaymentMethod,ProductId
order by ProductID