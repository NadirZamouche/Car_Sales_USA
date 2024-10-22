SELECT
	state,
	COUNT(*) AS sales
FROM
	car_prices
WHERE
	LENGTH(state) = 2
GROUP BY
	state
ORDER BY
	sales DESC;

--Or using Temporary Table
CREATE TEMPORARY TABLE car_prices_valid AS (
	SELECT
		*
	FROM
		car_prices
	WHERE
		body != 'Navitgation'
);

SELECT
	state,
	COUNT(*) AS sales
FROM
	car_prices_valid
GROUP BY
	state
ORDER BY
	sales DESC;