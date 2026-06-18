--LAG() fetches a value from a previous row in the dataset. It is most commonly used to calculate trends, such as comparing this month's sales to last month's sales.

-- Previous month profit

select * from ProfitData

select *, LAG(profit) over(partition by product order by monthnumber)[Previous_profit]
from ProfitData

select monthnumber, monthname,sum(profit) [TotalProfit]
from profitdata
group by MonthNumber,monthname
order by monthnumber

select monthnumber, monthname,sum(profit) [TotalProfit],
LAG(sum(Profit)) over(order by monthnumber asc)
from profitdata
group by MonthNumber,monthname
order by monthnumber