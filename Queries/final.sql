SELECT c.city_name, b.name, COUNT(*) FROM employees AS e
 INNER JOIN branches AS b
 	 ON b.branch_id = e.branch_id
 INNER JOIN cities AS c
 	 ON c.city_id = b.city_id
 WHERE c.city_id NOT IN (4, 5)
 GROUP BY c.city_name, b.name
 HAVING COUNT(*) >= 3;
 
SELECT SUM(l.amount), MAX(l.interest), MIN(e.salary)  FROM employees AS e
INNER JOIN employees_loans AS el
ON el.employee_id = e.employee_id
INNER JOIN loans AS l
ON l.loan_id = el.loan_id;

CREATE TABLE top_employees AS
SELECT e.first_name, s.city_name FROM employees AS e
INNER JOIN branches AS b
ON b.branch_id = e.branch_id
INNER JOIN cities AS s
ON s.city_id = b.city_id
LIMIT 3;

CREATE TABLE top_customers AS
SELECT c.first_name, city.city_name FROM customers AS c
INNER JOIN cities AS city
ON c.city_id = city.city_id
LIMIT 3;

SELECT * FROM top_employees
UNION ALL
SELECT * FROM top_customers;

DROP TABLE top_employees;
DROP TABLE top_customers;

SELECT c.customer_id, c.height FROM customers AS c
LEFT OUTER JOIN accounts AS a
ON a.customer_id = c.customer_id
WHERE a.account_id IS NULL
AND c.height BETWEEN 1.74 AND 2.04;

SELECT c.customer_id, l.amount FROM customers AS c
INNER JOIN loans as l
ON l.customer_id = c.customer_id
WHERE l.amount >
					(SELECT AVG(l.amount) AS avg_amount FROM customers AS c
					INNER JOIN loans as l
					ON l.customer_id = c.customer_id
					WHERE c.gender = 'm')
ORDER BY c.last_name
LIMIT 5;

SELECT c.customer_id, c.first_name, a.start_date FROM customers AS c
INNER JOIN accounts AS a
ON a.customer_id = c.customer_id
WHERE a.start_date =
						(SELECT MIN(a.start_date) FROM customers AS c
						INNER JOIN accounts as a
						ON a.customer_id = c.customer_id);

