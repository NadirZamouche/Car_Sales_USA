CREATE TEMPORARY TABLE car_prices_valid AS (
	SELECT
        *,
        substring(saledate FROM 12 FOR 4) AS sale_year,
        substring(saledate FROM 5 FOR 3) AS sale_month,
        substring(saledate FROM 1 FOR 3) AS sale_day,
        CASE substring(saledate FROM 5 FOR 3)
            WHEN 'Jan' THEN 1
            WHEN 'Feb' THEN 2
            WHEN 'Mar' THEN 3
            WHEN 'Apr' THEN 4
            WHEN 'May' THEN 5
            WHEN 'Jun' THEN 6
            WHEN 'Jul' THEN 7
            WHEN 'Aug' THEN 8
            WHEN 'Sep' THEN 9
            WHEN 'Oct' THEN 10
            WHEN 'Nov' THEN 11
            WHEN 'Dec' THEN 12
        END AS month
	FROM
        car_prices
	WHERE
        body != 'Navitgation'
        AND body IS NOT NULL
        AND make IS NOT NULL
        AND model IS NOT NULL
);

SELECT
    make,
    model,
    vin,
    sale_year,
    sale_month,
    sale_day,
    sellingprice sold_at,
    ROUND(avg_model_price, 0) avg_model_price,
    ROUND(sellingprice - avg_model_price, 0) AS price_dif,
    ROUND(sellingprice / avg_model_price, 2) AS price_ratio
FROM (
    SELECT
        make,
        model,
        vin,
        sale_year,
        sale_month,
        sale_day,
        sellingprice,
        AVG(sellingprice) OVER (PARTITION BY make, model) avg_model_price
    FROM
        car_prices_valid
)
WHERE
    sellingprice > avg_model_price
ORDER BY
    price_ratio DESC;