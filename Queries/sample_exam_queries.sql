/*
-- Section 3.1
SELECT e.employee_id, e.hire_date, e.salary, e.branch_id FROM employees AS e
WHERE e.salary > 2000 AND e.hire_date > '2009-06-15';

SELECT c.first_name, 
		 c.date_of_birth, 
		 FLOOR(DATEDIFF('2016-10-01', c.date_of_birth)/360) 
		 AS age FROM customers AS c
WHERE DATEDIFF('2016-10-01', c.date_of_birth)/360 BETWEEN 40 AND 50;

-- Section 3.2
SELECT c.first_name, 
		 c.date_of_birth, 
		 FLOOR(DATEDIFF('2016-10-01', c.date_of_birth)/360) 
		 AS age FROM customers AS c
WHERE FLOOR(DATEDIFF('2016-10-01', c.date_of_birth)/360) BETWEEN 40 AND 50;
--- Section 3.3


SELECT c.customer_id, c.first_name, c.last_name, c.gender, cy.city_name FROM customers AS c
INNER JOIN cities AS cy
ON c.city_id = cy.city_id
WHERE  CHAR_LENGTH(cy.city_name) >= 8 AND (c.last_name REGEXP '^Bu' OR c.first_name REGEXP 'a$')
ORDER BY c.customer_id;

-- Section 3.4

SELECT e.employee_id, em.first_name, a.account_number FROM employees_accounts AS e
INNER JOIN employees AS em
ON e.employee_id = em.employee_id
INNER JOIN accounts AS a
ON e.account_id = a.account_id
WHERE YEAR(a.start_date) > 2012
ORDER BY em.first_name DESC LIMIT 5;



-- Section 3.5

SELECT c.city_name, b.name, COUNT(*) as employees_count FROM employees AS e
INNER JOIN branches AS b
	ON b.branch_id = e.branch_id
INNER JOIN cities AS c
	ON c.city_id = b.city_id
WHERE c.city_id NOT IN (4, 5)
GROUP BY c.city_name, b.name
HAVING COUNT(*) >= 3;


-- Section 3.6

SELECT SUM(l.amount) AS total_loan_amount, MAX(l.interest) AS max_interest, MIN(e.salary) AS min_employee_salary FROM loans AS l
INNER JOIN employees_loans AS em
	ON l.loan_id = em.loan_id
INNER JOIN employees AS e
	ON em.employee_id = e.employee_id;


-- Section 3.7
CREATE TABLE top_employees
SELECT e.first_name, c.city_name FROM employees AS e
INNER JOIN branches AS b
	ON b.branch_id = e.branch_id
INNER JOIN cities AS c
	ON b.city_id = c.city_id
LIMIT 3;

CREATE TABLE top_customers
SELECT c.first_name, cit.city_name FROM customers AS c
INNER JOIN cities AS cit
	ON c.city_id = cit.city_id
LIMIT 3;

SELECT * FROM top_employees

UNION ALL

SELECT * FROM top_customers;

DROP TABLE top_employees;
DROP TABLE top_customers;


-- Section 3.8
SELECT * FROM customers AS c
LEFT OUTER JOIN accounts AS a
ON c.customer_id = a.customer_id 
WHERE a.account_id IS NULL
	AND c.height BETWEEN 1.74 AND 2.04;

-- Section 3.9
SELECT c.customer_id, l.amount FROM customers AS c
INNER JOIN loans AS l
	ON c.customer_id = l.customer_id
WHERE l.amount >  (SELECT AVG(l.amount) amount FROM customers AS c
						INNER JOIN loans AS l
						ON c.customer_id = l.customer_id
						WHERE c.gender = 'M')
ORDER BY c.last_name LIMIT 5;


-- Section 3.10

SELECT c.customer_id, c.first_name, a.start_date AS start_date FROM customers AS c
INNER JOIN accounts AS a
	ON c.customer_id = a.customer_id
WHERE a.start_date = 
							(SELECT MIN(a.start_date) FROM customers AS c
							INNER JOIN accounts AS a
							ON c.customer_id = a.customer_id)
*/

