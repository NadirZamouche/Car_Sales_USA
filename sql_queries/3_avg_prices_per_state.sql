CREATE TEMPORARY TABLE car_prices_valid AS (
	SELECT *
	FROM
		car_prices
	WHERE
		body != 'Navitgation'
);

SELECT
	state,
	ROUND(AVG(sellingprice),0) AS avg_price
FROM
	car_prices_valid
WHERE
    sellingprice IS NOT NULL
GROUP BY
	state
ORDER BY
	avg_price DESC;