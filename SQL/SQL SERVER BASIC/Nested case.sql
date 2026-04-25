
-- Nested case statement

select * from [dbo].[Products]

--We need to group the data based on columns category & price into different categories i.e affordable & premium

SELECT *,
    CASE 
        WHEN Category = 'Electronics' THEN
            CASE 
                WHEN Price >= 300 THEN 'Premium Elect'
                ELSE 'Affordable Elect'
            END
        WHEN Category = 'Furniture' THEN
            CASE 
                WHEN Price >= 250 THEN 'Premium Fur'
                ELSE 'Affordable Fur'
            END
        ELSE -- This handles 'Accessories'
            CASE 
                WHEN Price >= 25 THEN 'Premium Access'
                ELSE 'Affordable Access'
            END
    END AS [Groups]
FROM Products;


-- Pro 

SELECT *,
    CASE 
        WHEN Category = 'Electronic' AND price >= 300 THEN 'Premium Elect'
        WHEN Category = 'Electronic' THEN 'Affordable Elect'
        WHEN Category = 'Furniture' AND price >= 250 THEN 'Premium Fur'
        WHEN Category = 'Furniture' THEN 'Affordable Fur'
        WHEN price >= 25 THEN 'Premium Access'
        ELSE 'Affordable Access'
    END AS [Groups]
FROM Products;