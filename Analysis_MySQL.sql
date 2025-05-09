-- Question 1: What are the different payment methods, and how many transactions and items were sold with each method?
SELECT
	payment_method,
    COUNT(*) AS orders
FROM walmart_sales
GROUP BY 
	payment_method
ORDER BY orders DESC;
    
-- Question 2: Which category received the highest average rating in each branch?
SELECT *
FROM
(	SELECT
		branch,
		category,
		ROUND(AVG(rating), 2) AS rating,
        RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS ranks
	FROM walmart_sales
	GROUP BY 
		branch,
		category
) AS rating_table
WHERE ranks = 1;

-- Question 3: What is the busiest day of the week for each branch based on transaction volume?
SELECT *
FROM
(
	SELECT
		branch,
		DATE_FORMAT(date, '%W') AS day_name,
		COUNT(*) AS transactions,
		RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranks
	FROM walmart_sales
	GROUP BY
		branch,
		day_name
) AS ranking_table
WHERE ranks = 1;

--  Question 4: How many items were sold through each payment method?
SELECT
	payment_method,
    SUM(quantity) AS item_sold
FROM 
	walmart_sales
GROUP BY
	1
ORDER BY
	2 DESC;

-- Question 5: What are the average, minimum, and maximum ratings for each category in each city?
SELECT 
	city,
	category,
    ROUND(AVG(rating), 2) AS avg_rating,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating
    
FROM
	walmart_sales
GROUP BY
	city,
	category;
    
-- Question 6: What is the total profit for each category, ranked from highest to lowest?
SELECT
	category,
    ROUND(SUM(total), 2) AS total_profit,
    RANK() OVER(ORDER BY SUM(total) DESC) AS ranks
FROM 
	walmart_sales
GROUP BY
	category;
    
-- Question 7: What is the most frequently used payment method in each branch?

WITH payment_counts AS
(
	SELECT
		branch,
		payment_method,
		COUNT(*) AS transactions,
		RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranks
	FROM 
		walmart_sales
	GROUP BY 
		branch,
		payment_method
)
SELECT * FROM payment_counts
WHERE ranks = 1;

-- Question 8: How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?
SELECT
	branch,
    CASE
		WHEN time BETWEEN '06:00:00' AND '11:59:59' THEN 'morning'
        WHEN time BETWEEN '12:00:00' AND '17:59:59' THEN 'afternoon'
        WHEN time BETWEEN '18:00:00' AND '23:59:59' THEN 'evening'
        ELSE 'night'
	END AS shifts,
    COUNT(*) AS transactions
FROM
	walmart_sales
GROUP BY
	branch,
    shifts
ORDER BY
	branch ASC,
	transactions DESC;

-- Question 9: Which branches experienced the largest decrease in revenue compared to the previous year?
-- 2022 sales
WITH revenue_2022 AS
(
	SELECT
		branch,
		SUM(total) AS revenue
	FROM
		walmart_sales
	WHERE
		YEAR(date) = 2022
	GROUP BY 
		 branch
),

-- 2023 sales
revenue_2023 AS 
(
	SELECT
		branch,
		SUM(total) AS revenue
	FROM
		walmart_sales
	WHERE
		YEAR(date) = 2023
	GROUP BY 
		 branch
)

-- Join both tables
SELECT
	ls.branch,
    ls.revenue AS last_year_revenue,
    cs.revenue AS curr_year_revenue,
    ROUND(
		(ls.revenue - cs.revenue) / ls.revenue * 100,
		2)
        AS rev_des_ratio
FROM 
	revenue_2022 AS ls
JOIN 
	revenue_2023 AS cs
ON ls.branch = cs.branch
WHERE
	ls.revenue > cs.revenue
ORDER BY
	rev_des_ratio DESC;
