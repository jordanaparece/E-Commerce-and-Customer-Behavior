-- Main business question: What behavioral and transactional factors most strongly correlate with customer churn,
-- and how do they vary by demographic and shopping patterns?

--- Overall churn rate
SELECT
    ROUND(AVG(churn), 4) AS churn_rate
FROM
    ecommerce

-- Churn rate by product category
SELECT
    product_category,
    COUNT(*) AS total,
    ROUND(AVG(churn), 4) AS churn_rate
FROM
    ecommerce
GROUP BY
    product_category
ORDER BY
    churn_rate DESC

-- Average purchase behavior by Churn Status
WITH behavior_status AS (
    SELECT
        churn,
        ROUND(AVG(total_value)::NUMERIC, 2) AS avg_spent,
        ROUND(AVG(returns)::NUMERIC, 4) AS avg_returns,
        ROUND(AVG(quantity)::NUMERIC, 2) AS avg_quantity
    FROM
        ecommerce
    GROUP BY
        churn
)
SELECT
    *,
    CASE
        WHEN churn = 1 THEN 'Churned'
        ELSE 'Not Churned'
    END AS churn_status
FROM
    behavior_status


-- Top 5 customers by total spend
WITH ranked_customers AS (
    SELECT
        customer_id,
        customer_name,
        SUM(total_value) AS total_spent,
        RANK() OVER(ORDER BY SUM(total_value) DESC) AS overall_rank
    FROM
        ecommerce
    GROUP BY
        customer_id,
        customer_name
)
SELECT
    *
FROM
    ranked_customers
LIMIT 5


-- Churn rate by age group
WITH age_churn_group AS (
    SELECT
        CASE
            WHEN age < 25 THEN '18-24'
            WHEN age BETWEEN 25 AND 34 THEN '25-34'
            WHEN age BETWEEN 34 AND 44 THEN '34-44'
            WHEN age BETWEEN 45 and 60 THEN '45-60'
            ELSE '60+'
        END AS age_group,
        COUNT(*) AS customer_count,
        ROUND(AVG(churn)::NUMERIC, 4) AS churn_rate
    FROM
        ecommerce 
    GROUP BY
        age_group
)
SELECT
    *
FROM
    age_churn_group
ORDER BY
    churn_rate DESC


-- Return behavior and its effect on churn
SELECT
    was_returned,
    COUNT(*) AS count,
    ROUND(AVG(churn)::NUMERIC, 4) AS churn_rate
FROM
    ecommerce
GROUP BY
    was_returned
ORDER BY
    churn_rate DESC


-- Weekend vs weekday purchases and churn
SELECT
    is_weekend,
    COUNT(*) AS num_purchases,
    ROUND(AVG(churn)::NUMERIC, 4) AS churn_rate
FROM
    ecommerce
GROUP BY
    is_weekend
ORDER BY
    churn_rate DESC


-- Daily churn trends
SELECT
    purchase_date::DATE AS day,
    COUNT(*) AS total_orders,
    SUM(churn) AS total_churned,
    ROUND(SUM(churn)::NUMERIC / COUNT(*), 4) AS churn_rate,
    ROUND(AVG(SUM(churn)) OVER(ORDER BY purchase_date::DATE ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 4) AS rolling_weekly_avg
FROM
    ecommerce
GROUP BY
    purchase_date::DATE
ORDER BY
    day

-- High spend customers: are they more loyal?
WITH spend_ranks AS (
    SELECT
        *,
        NTILE(4) OVER(ORDER BY total_value DESC) AS spend_quartile
    FROM
        ecommerce
)
SELECT
    spend_quartile,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn)::NUMERIC, 4) AS avg_churn_rate
FROM
    spend_ranks
GROUP BY
    spend_quartile
ORDER BY
    spend_quartile

-- Payment method churn comparison
SELECT
    payment_method,
    COUNT(*) AS total_customers,
    ROUND(AVG(churn)::NUMERIC, 4) AS avg_churn_rate
FROM
    ecommerce
GROUP BY
    payment_method
ORDER BY
    avg_churn_rate DESC

-- Most common time of day for churned transactions
SELECT
    time_of_day,
    COUNT(*) AS churned_transactions,
    ROUND(AVG(churn)::NUMERIC, 4) AS avg_churn_rate
FROM
    ecommerce
GROUP BY
    time_of_day
ORDER BY
    avg_churn_rate DESC


-- Top 3 categories with the highest churn rate
WITH ranked_products AS (
    SELECT
        product_category,
        ROUND(AVG(returns)::NUMERIC, 2) AS avg_return_rate,
        RANK() OVER(ORDER BY ROUND(AVG(returns)::NUMERIC, 4) DESC) AS rank
    FROM
        ecommerce
    GROUP BY
        product_category
)
SELECT
    *
FROM
    ranked_products
WHERE
    rank <= 3

-- Product categories that have higher than average churn rates
SELECT
    product_category,
    quantity,
    ROUND(AVG(churn)::NUMERIC, 4) AS higher_than_avg
FROM
    ecommerce
GROUP BY
    product_category,
    quantity
HAVING
    ROUND(AVG(churn)::NUMERIC, 4) > (
        SELECT 
            ROUND(AVG(churn)::NUMERIC, 4) AS avg_churn_rate
        FROM
            ecommerce
)
ORDER BY
    higher_than_avg DESC

SELECT *
FROM ecommerce 
