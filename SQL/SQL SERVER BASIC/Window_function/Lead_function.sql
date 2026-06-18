
--LEAD() fetches a value from a subsequent row in the dataset. It is most commonly used to look ahead, such as finding the next action a user took or calculating the time gap between the current event and the next one.
-- Next Month profit
Create database [Profit DB]

Use[Profit DB]


-- Create a table to store monthly profit data for different products
CREATE  TABLE ProfitData (
    MonthNumber INT,
    MonthName VARCHAR(3),
    Product VARCHAR(50),
    Profit INT
);

-- Insert data into the ProfitData table
INSERT INTO ProfitData (MonthNumber, MonthName, Product, Profit) VALUES
(1, 'Jan', 'Product A', 1000),
(2, 'Feb', 'Product A', 1500),
(3, 'Mar', 'Product A', 1200),
(4, 'Apr', 'Product A', 1700),
(5, 'May', 'Product A', 1300),
(6, 'Jun', 'Product A', 1600),
(1, 'Jan', 'Product B', 2000),
(2, 'Feb', 'Product B', 2500),
(3, 'Mar', 'Product B', 2200),
(4, 'Apr', 'Product B', 2700),
(5, 'May', 'Product B', 2300),
(6, 'Jun', 'Product B', 2600);

select * from ProfitData
select *, LEAD(Profit) over(partition by Product order by MonthNumber) as [NextMonth_Profit]
from ProfitData

-- We dont want product column in the output but we want each months total profit to be showed by monthnumber and month name, also a new column should be added to show the next months total profit

select monthnumber,monthname, sum(Profit) as [Total_profit]
from ProfitData
group by MonthNumber,MonthName
order by MonthNumber

select monthnumber,monthname, sum(Profit) as [Total_profit],
LEAD(sum(profit)) over(Order by monthnumber asc)[Next_month_Total_profit]
from ProfitData
group by MonthNumber,MonthName
order by MonthNumber