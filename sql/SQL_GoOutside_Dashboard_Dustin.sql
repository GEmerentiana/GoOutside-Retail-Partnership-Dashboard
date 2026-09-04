# Sales by Products

WITH sales_summary_products AS (
    SELECT
        EXTRACT(YEAR FROM ds.Date) AS sales_year_products,
        p.`Product` AS products,
        ROUND(SUM(ds.Quantity * ds.`Unit sale price`), 2) AS total_sales_products
    FROM
        data-warehouse-506808.gooutside.daily_sales AS ds
    INNER JOIN
        data-warehouse-506808.gooutside.products AS p
        ON ds.`Product number` = p.`Product number`
    GROUP BY
      sales_year_products,
      products
),
ranked_sales_products AS (
    SELECT
        sales_year_products,
        products,
        total_sales_products,
        ROW_NUMBER() OVER (
            PARTITION BY sales_year_products
            ORDER BY total_sales_products DESC
        ) AS rank_products
    FROM
        sales_summary_products
)
SELECT
    sales_year_products,
    products,
    total_sales_products
FROM
    ranked_sales_products
ORDER BY
    sales_year_products,
    total_sales_products DESC;
    
# Sales by Brands

WITH sales_summary_brand AS (
    SELECT
        EXTRACT(YEAR FROM ds.Date) AS sales_year_brand,
        p.`Product brand` AS brand,
        ROUND(SUM(ds.Quantity * ds.`Unit sale price`), 2) AS total_sales_brand
    FROM
        data-warehouse-506808.gooutside.daily_sales AS ds
    INNER JOIN
        data-warehouse-506808.gooutside.products AS p
        ON ds.`Product number` = p.`Product number`
    GROUP BY
      sales_year_brand,
      brand
),
ranked_sales_brand AS (
    SELECT
        sales_year_brand,
        brand,
        total_sales_brand,
        ROW_NUMBER() OVER (
            PARTITION BY sales_year_brand
            ORDER BY total_sales_brand DESC
        ) AS rank_brand
    FROM
        sales_summary_brand
)
SELECT
    sales_year_brand,
    brand,
    total_sales_brand
FROM
    ranked_sales_brand
ORDER BY
    sales_year_brand,
    total_sales_brand DESC;

# Sales by Product Lines

WITH sales_summary_line AS (
    SELECT
        EXTRACT(YEAR FROM ds.Date) AS sales_year_line,
        p.`Product line` AS line,
        ROUND(SUM(ds.Quantity * ds.`Unit sale price`), 2) AS total_sales_line
    FROM
        data-warehouse-506808.gooutside.daily_sales AS ds
    INNER JOIN
        data-warehouse-506808.gooutside.products AS p
        ON ds.`Product number` = p.`Product number`
    GROUP BY
      sales_year_line,
      line
),
ranked_sales_line AS (
    SELECT
        sales_year_line,
        line,
        total_sales_line,
        ROW_NUMBER() OVER (
            PARTITION BY sales_year_line
            ORDER BY total_sales_line DESC
        ) AS rank_line
    FROM
        sales_summary_line
)
SELECT
    sales_year_line,
    line,
    total_sales_line
FROM
    ranked_sales_line
ORDER BY
    sales_year_line,
    total_sales_line DESC;

# Sales by Retailers

SELECT
    r.Country AS Country,
	r.`Retailer name` AS retailer_name,
	EXTRACT(YEAR FROM ds.Date) AS sales_year_retailer,
    COUNT(DISTINCT r.`Retailer code`) AS num_retailers,
    ROUND(
        SUM(
            (ds.`Unit sale price` - p.`Unit cost`) * ds.Quantity
        ), 2
    ) AS total_sales
FROM
    data-warehouse-506808.gooutside.daily_sales AS ds
JOIN
    data-warehouse-506808.gooutside.retailers AS r
    ON ds.`Retailer code` = r.`Retailer code`
JOIN
    data-warehouse-506808.gooutside.products AS p
    ON ds.`Product number` = p.`Product number`
WHERE
    ds.`Unit sale price` IS NOT NULL
    AND p.`Unit cost` IS NOT NULL
GROUP BY
    Country,
	retailer_name,
    sales_year_retailer
ORDER BY
    sales_year_retailer,
    total_sales DESC;

# Retailers# Sales by Country

SELECT
r.Country,
EXTRACT(YEAR FROM ds.Date) AS sales_year_retailer,
COUNT(DISTINCT r.`Retailer code`) AS num_retailers,
ROUND(SUM((ds.`Unit sale price` - p.`Unit cost`) * ds.Quantity), 2) AS total_profit
FROM
    data-warehouse-506808.gooutside.daily_sales AS ds
JOIN
    data-warehouse-506808.gooutside.retailers AS r
    ON ds.`Retailer code` = r.`Retailer code`
JOIN
    data-warehouse-506808.gooutside.products AS p
    ON ds.`Product number` = p.`Product number`
WHERE
ds.`Unit sale price` IS NOT NULL
AND p.`Unit cost` IS NOT NULL
GROUP BY
r.country,
sales_year_retailer
ORDER BY
sales_year_retailer,
total_profit DESC;

# Sales Overall

WITH sales_summary_sales AS (
    SELECT
        EXTRACT(YEAR FROM ds.Date) AS sales_year,
  		ds.Quantity AS quantity,
  		ds.`Unit sale price` AS price,
        p.`Product` AS products,
  		p.`Product line` AS line,
  		p.`Product brand` AS brand,
  		r.`Retailer name` AS retailer_name,
  		r.`Country` AS country,
  		ROUND(SUM(ds.Quantity * ds.`Unit sale price`), 2) AS total_sales
    FROM
        data-warehouse-506808.gooutside.daily_sales AS ds
  	JOIN
    	data-warehouse-506808.gooutside.retailers AS r
    	ON ds.`Retailer code` = r.`Retailer code`
    INNER JOIN
        data-warehouse-506808.gooutside.products AS p
        ON ds.`Product number` = p.`Product number`
    GROUP BY
      sales_year,
  	  quantity,
 	  price,
      products,
  	  line,
  	  brand,
  	  retailer_name,
  	  country
),
ranked_sales_overall AS (
    SELECT
        sales_year,
  		quantity,
  		price,
        products,
  		line,
  		brand,
  		retailer_name,
  		country,
        total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY sales_year
            ORDER BY total_sales DESC
        ) AS rank_sales
    FROM
        sales_summary_sales
)
SELECT
    sales_year,
	quantity,
	price,
    products,
	line,
	brand,
	retailer_name,
	country,
    total_sales
FROM
    ranked_sales_overall
ORDER BY
    sales_year,
    total_sales DESC;

# Sales Growth by Retailers

WITH yearly_sales AS (
    SELECT
        r.Country AS Country,
  		r.`Retailer code` AS retailer_code,
        r.`Retailer name` AS retailer_name,
        EXTRACT(YEAR FROM s.`Date`) AS sales_year,
        SUM(s.`Quantity` * s.`Unit sale price`) AS total_sales
    FROM data-warehouse-506808.gooutside.daily_sales s
    JOIN data-warehouse-506808.gooutside.retailers r
        ON s.`Retailer code` = r.`Retailer code`
    GROUP BY
        Country,
  		retailer_code,
        retailer_name,
        EXTRACT(YEAR FROM s.`Date`)
),

sales_with_previous_year AS (
    SELECT
        Country,
  		retailer_code,
        retailer_name,
        sales_year,
        total_sales,
        LAG(total_sales) OVER (
            PARTITION BY retailer_code
            ORDER BY sales_year
        ) AS previous_year_sales
    FROM yearly_sales
)

SELECT
    Country,
	retailer_code,
    retailer_name,
    sales_year,
    total_sales,
    previous_year_sales,
    ROUND(
        (total_sales - previous_year_sales)
        / NULLIF(previous_year_sales, 0) * 100,
        2
    ) AS sales_increase_percentage
FROM sales_with_previous_year
ORDER BY
    retailer_name,
    sales_year;

# Retailer Growth

WITH yearly_retailers AS (
    SELECT
        EXTRACT(YEAR FROM `Date`) AS sales_year,
        COUNT(DISTINCT `Retailer code`) AS number_of_retailers
    FROM data-warehouse-506808.gooutside.daily_sales
    GROUP BY EXTRACT(YEAR FROM `Date`)
),

retailers_with_previous_year AS (
    SELECT
        sales_year,
        number_of_retailers,
        LAG(number_of_retailers) OVER (
            ORDER BY sales_year
        ) AS previous_year_retailers
    FROM yearly_retailers
)

SELECT
    sales_year,
    number_of_retailers,
    previous_year_retailers,
    ROUND(
        (number_of_retailers - previous_year_retailers)
        / NULLIF(previous_year_retailers, 0) * 100,
        2
    ) AS retailer_growth_percentage
FROM retailers_with_previous_year
ORDER BY sales_year;