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
    year,
    make,
    model,
    trim,
    body,
    transmission,
    vin,
    state,
    condition,
    odometer,
    color,
    interior,
    seller,
    mmr,
    sellingprice,
    saledate,
    sale_year,
    month,
    sale_month,
    vin_sales
FROM (
        SELECT
            year,
            make,
            model,
            trim,
            body,
            transmission,
            vin,
            state,
            condition,
            odometer,
            color,
            interior,
            seller,
            mmr,
            sellingprice,
            saledate,
            sale_year,
            month,
            sale_month,
            COUNT(*) OVER (PARTITION BY vin) vin_sales
        FROM
           car_prices_valid
)
WHERE
    vin_sales > 1
ORDER BY
    vin,
    sale_year,
    month