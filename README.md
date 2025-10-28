# 🧮 SQL Sales Analysis

Analyze customer, product, and regional revenue trends using SQLite.  
This project demonstrates how SQL can be used for **data analysis, reporting, and decision support**.

---

## 📊 Project Overview
This dataset simulates company sales transactions including:
- Customer IDs  
- Product categories and regions  
- Unit price, quantity, and total revenue  

**Objectives**
- Identify top customers and regions  
- Track monthly revenue growth  
- Compare product performance across categories  
- Estimate customer LTV using aggregated order data  

---

## 🧰 Tools Used
| Tool | Purpose |
|------|----------|
| 🐍 **SQLite** | Store and query the data |
| 🧮 **SQL** | Data analysis and aggregation |
| 🧱 **VS Code** | Code editing and project management |
| 💻 **GitHub** | Version control and portfolio hosting |

---

## 🧾 Example Queries
```sql
-- Top 10 customers by total revenue
SELECT customer_id, SUM(total_amount) AS total_revenue
FROM sales
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;
