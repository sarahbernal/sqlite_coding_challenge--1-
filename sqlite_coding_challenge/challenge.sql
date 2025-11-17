-- Task 1
SELECT
  c.first_name || ' ' || c.last_name AS customer,
  ROUND(SUM(oi.quantity * oi.unit_price), 2)      AS total_spend
FROM orders o
JOIN customers c   ON c.id = o.customer_id
JOIN order_items oi ON oi.order_id = o.id;

--Task 2
SELECT
  p.category,
  ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM order_items oi
JOIN products p ON p.id = oi.product_id
JOIN orders   o ON o.id = oi.order_id;

--Task 3 
WITH dept_avg AS (
  SELECT department_id, AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
)
SELECT
  e.first_name,
  e.last_name,
  d.name                   AS department,
  e.salary,
  ROUND(da.avg_salary, 2)  AS dept_avg
FROM employees e
JOIN departments d ON d.id = e.department_id
JOIN dept_avg   da ON da.department_id = e.department_id
WHERE e.salary > da.avg_salary
ORDER BY d.name, e.salary DESC;

--Task 4
SELECT
  c.city,
  COUNT(*) AS gold_count
FROM customers c
WHERE c.loyalty_level = 'Gold'
GROUP BY c.city
ORDER BY gold_count DESC, c.city;