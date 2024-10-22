SELECT
    CASE
        WHEN odometer < 100000 THEN '0 - 99,999'
        WHEN odometer < 200000 THEN '100,000 - 199,999'
        WHEN odometer < 300000 THEN '200,000 - 299,999'
        WHEN odometer < 400000 THEN '300,000 - 399,999'
        WHEN odometer < 500000 THEN '400,000 - 499,999'
		WHEN odometer < 600000 THEN '500,000 - 599,999'
		WHEN odometer < 700000 THEN '600,000 - 699,999'
		WHEN odometer < 800000 THEN '700,000 - 799,999'
		WHEN odometer < 900000 THEN '800,000 - 899,999'
		WHEN odometer < 1000000 THEN '900,000 - 999,999'
    END AS odometer_bucket,
    COUNT(*) sales,
    ROUND(AVG(sellingprice), 0) avg_price
FROM
    car_prices
WHERE
	odometer IS NOT NULL
GROUP BY
    odometer_bucket
ORDER BY
    odometer_bucket;