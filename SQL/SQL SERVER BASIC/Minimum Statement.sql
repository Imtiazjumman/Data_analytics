

-- MINIMUM FUNCTION and GROUP BY EXAMPLE

select * from dbo.Sales
SELECT min(Quantity)[MinQuantity] from dbo.Sales

select ProductID, min(Quantity)[MinQuantity] from dbo.Sales
group by ProductID

select min(PaymentMethod)[MinPaymentMethod] from dbo.Sales

select StoreID, min(TotalAmount)[MinTotalAmount] from dbo.Sales
group by StoreID