SELECT S.store_type,S.country,D.month_name,ROUND(CAST(sum(O.total_orders*P.sale_price) as BIGINT)) as Monthly_Revenue
FROM orders as O JOIN dim_date as D ON O.order_date=D.date
JOIN dim_product as P ON O.product_code=P.product_code
JOIN dim_store as S ON O.store_code=S.store_code
WHERE D.year=2022 AND S.country='Germany'
GROUP BY D.month_name,S.store_type,S.country
ORDER BY Monthly_Revenue DESC
LIMIT 15
