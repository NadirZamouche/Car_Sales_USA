SELECT
    make,
    model,
    body,
    sales,
    body_rank
FROM (
    SELECT
        make,
        model,
        body,
        COUNT(*) AS sales,
        RANK() OVER(PARTITION BY body ORDER BY COUNT(*) DESC) AS body_rank
    FROM
        car_prices
    WHERE
        body IS NOT NULL
        AND make IS NOT NULL
        AND model IS NOT NULL
    GROUP BY
        make,
        model,
        body
)
WHERE
    body_rank <= 5
ORDER BY
    body,
    sales DESC;