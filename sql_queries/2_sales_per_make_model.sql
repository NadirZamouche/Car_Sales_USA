CREATE TEMPORARY TABLE car_prices_valid AS (
	SELECT
		*
	FROM
		car_prices
	WHERE
		body != 'Navitgation'
);

SELECT
	make,
	model,
	COUNT(*) AS sales
FROM
	car_prices_valid
GROUP BY
	make,
	model
ORDER BY
	sales DESC;