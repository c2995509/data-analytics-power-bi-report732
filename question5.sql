SELECT P.category,ROUND(CAST(sum(O.product_quantity*P.sale_price) as BIGINT)) as Category_Revenue
FROM orders as O JOIN dim_date as D ON O.order_date=D.date
JOIN dim_product as P ON O.product_code=P.product_code
JOIN dim_store as S ON O.store_code=S.store_code
WHERE D.year=2022 AND S.country_region = 'Wiltshire'
GROUP BY P.category
ORDER BY Category_Revenue DESC