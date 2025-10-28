# SQL Sales Analysis

**Goal:** Analyze sales by customer, product, and region using SQL.  
**Dataset:** Sample e-commerce dataset (use SQLite / PostgreSQL).  
**Tools:** DB Browser for SQLite (free on Mac)

---

## 🧭 Objectives
1. Identify top-performing regions and products  
2. Calculate total revenue and customer lifetime value (LTV)  
3. Build monthly sales trend report  

---

## 🧠 Sample Queries
```sql
-- 1. Top 10 customers by revenue
SELECT customer_id, SUM(total_amount) AS total_revenue
FROM sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- 2. Monthly revenue trend
SELECT strftime('%Y-%m', order_date) AS month, SUM(total_amount) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

-- 3. Product performance by category
SELECT category, AVG(unit_price) AS avg_price, SUM(quantity) AS total_qty
FROM sales
GROUP BY category
ORDER BY total_qty DESC;

-- 4. Region revenue with window % of total
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
```

---

## 📈 Key Findings (example)
- North region leads with **35% of total revenue**  
- Electronics category drives **highest sales volume**  
- Repeat customers contribute **60%+** of monthly orders

---

## 📁 Folder Structure
```
da-sql-sales-analysis/
├─ data/
│  └─ sales_data.csv  (optional; put your file here)
├─ queries/
│  └─ sales_queries.sql
├─ images/
│  └─ sales_dashboard.png
└─ README.md
```

---

## ▶️ How to Run (SQLite)
1. Open **DB Browser for SQLite**  
2. Create new database → Import `data/sales_data.csv` as table `sales`  
3. Open `queries/sales_queries.sql` and execute  
4. Export results to CSV/PNG and save under `images/`

> Tip: Replace the placeholder image in `images/` with your real chart/screenshot.
