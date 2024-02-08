CREATE VIEW StoresSummary_Alan AS (
with summary AS(
SELECT ROUND(SUM(P.sale_price * O.product_quantity) ::numeric,2) AS total_sales,
COUNT(O.order_date_uuid) AS count_orders,
S.store_type as store_type
FROM orders as O
JOIN dim_product as P on P.product_code = O.product_code
JOIN dim_store as S on S.store_code = O.store_code
GROUP BY S.store_type)
,
grand_total_sales AS
(SELECT
SUM(summary.total_sales) AS grand_total_sales
FROM summary)
SELECT
summary.store_type,
summary.total_sales,
summary.count_orders,
ROUND((summary.total_sales/(SELECT grand_total_sales FROM grand_total_sales))*100::numeric,2) AS perc_sales
FROM summary
)

