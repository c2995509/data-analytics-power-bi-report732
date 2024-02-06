SELECT country,sum(staff_numbers) as Total_Staff_Numbers
FROM dim_store
WHERE country_code='GB'
GROUP BY country;

