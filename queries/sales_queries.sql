-- sales_queries.sql

-- 1) Top 10 customers by revenue
SELECT customer_id, SUM(total_amount) AS total_revenue
FROM sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 2) Monthly revenue trend (YYYY-MM)
SELECT strftime('%Y-%m', order_date) AS month, SUM(total_amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 3) Product performance by category
SELECT category, AVG(unit_price) AS avg_price, SUM(quantity) AS total_qty
FROM sales
GROUP BY category
ORDER BY total_qty DESC;

-- 4) Region revenue with percentage of total (window function)
WITH region_rev AS (
  SELECT region, SUM(total_amount) AS revenue
  FROM sales
  GROUP BY region
)
SELECT region,
       revenue,
       ROUND(100.0 * revenue / SUM(revenue) OVER (), 2) AS pct_of_total
FROM region_rev
ORDER BY revenue DESC;

-- 5) Simple customer LTV proxy (sum of orders per customer)
SELECT customer_id,
       COUNT(*) AS orders,
       SUM(total_amount) AS ltv_proxy
FROM sales
GROUP BY customer_id
ORDER BY ltv_proxy DESC;
