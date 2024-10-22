SELECT
    make brand,
	COUNT(DISTINCT model) models_count,
    COUNT(*) sales,
    ROUND(MIN(sellingprice), 0) min_price,
	ROUND(AVG(sellingprice), 0) avg_price,
	ROUND(MAX(sellingprice), 0) max_price
FROM
    car_prices
WHERE
	make IS NOT NULL
    AND model IS NOT NULL
GROUP BY
    brand
ORDER BY
    brand;