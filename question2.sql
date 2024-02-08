SELECT D.month_name,ROUND(CAST(sum(O.product_quantity*P.sale_price) as BIGINT)) as Monthly_Revenue
FROM orders as O JOIN dim_date as D ON O.order_date=D.date
JOIN dim_product as P ON O.product_code=P.product_code
WHERE D.year=2022 
GROUP BY D.month_name
ORDER BY Monthly_Revenue DESC



