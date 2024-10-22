SELECT
    CASE
        WHEN condition BETWEEN 0 AND 9 THEN '0 to 9'
        WHEN condition BETWEEN 10 AND 19 THEN '10 to 19'
        WHEN condition BETWEEN 20 AND 29 THEN '20 to 29'
        WHEN condition BETWEEN 30 AND 39 THEN '30 to 39'
        WHEN condition BETWEEN 40 AND 49 THEN '40 to 49'
    END AS condition_tier,
    COUNT(*) sales,
    ROUND(AVG(sellingprice), 0) avg_price
FROM
    car_prices
WHERE
	condition IS NOT NULL
GROUP BY
    condition_tier
ORDER BY
    condition_tier;