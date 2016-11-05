-- TASK 1

SELECT e.first_name, e.last_name FROM employees AS e
WHERE e.first_name LIKE 'SA%';

-- TASK 2

SELECT e.first_name, e.last_name FROM employees AS e
WHERE e.last_name LIKE '%ei%';

-- TASK 3

SELECT e.first_name FROM employees AS e
WHERE e.department_id = 3 OR e.department_id = 10 AND e.hire_date BETWEEN '1995-01-01' AND '2005-12-31';

-- TASK 4

SELECT e.first_name, e.last_name FROM employees AS e
WHERE e.job_title NOT LIKE '%engineer%';

-- TASK 5

SELECT t.name FROM towns AS t
WHERE CHAR_LENGTH(t.name) = 5 OR CHAR_LENGTH(t.name) = 6
ORDER BY t.name ASC;

-- TASK 6

SELECT t.town_id, t.name FROM towns AS t
WHERE t.name LIKE'm%'
 OR t.name LIKE 'k%'
 OR t.name LIKE'b%'
 OR t.name LIKE 'e%'
ORDER BY t.name;

-- TASK 7

SELECT t.town_id, t.name FROM towns AS t
WHERE t.name NOT LIKE 'r%'
 AND t.name NOT LIKE 'b%'
 AND t.name NOT LIKE 'd%'
ORDER BY t.name;

-- TASK 8

CREATE VIEW v_employees_hired_after_2000 AS
SELECT e.first_name, e.last_name FROM employees AS e
WHERE e.hire_date > '2000-12-31';

-- TASK 9

SELECT e.first_name, e.last_name FROM employees AS e
WHERE CHAR_LENGTH(e.last_name) = 5;

-- TASK 10

SELECT c.country_name, c.iso_code FROM countries AS c
WHERE c.country_name LIKE '%a%a%a%'
ORDER BY c.iso_code;

-- TASK 11

SELECT p.peak_name, r.river_name, LOWER(CONCAT(LEFT(p.peak_name, CHAR_LENGTH(p.peak_name) - 1), r.river_name)) AS mix FROM peaks AS p
INNER JOIN rivers AS r
ON RIGHT(p.peak_name, 1) = LEFT(r.river_name, 1)
ORDER BY mix;

-- TASK 12

SELECT g.name, DATE_FORMAT(g.`start`, '%Y-%m-%d') AS `start` FROM games AS g
WHERE YEAR(start) IN (2011, 2012)
ORDER BY g.`start`, g.name
LIMIT 50;

-- TASK 13

SELECT u.user_name, SUBSTRING(u.email, LOCATE('@', u.email)+1) AS mail FROM users AS u
ORDER BY mail, u.user_name ASC;

-- TASK 14

SELECT u.user_name AS 'User Name', u.ip_address AS 'IP Address' FROM users AS u
WHERE u.ip_address LIKE '___.1%.%.___'
ORDER BY u.user_name;

-- TASK 15

SELECT g.name AS 'Game',
	CASE 
		WHEN EXTRACT(HOUR FROM g.`start`) >= 0 AND EXTRACT(HOUR FROM g.`start`) < 12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM g.`start`) >= 12 AND EXTRACT(HOUR FROM g.`start`) < 18 THEN 'Afternoon'
		WHEN EXTRACT(HOUR FROM g.`start`) >= 18 AND EXTRACT(HOUR FROM g.`start`) < 24 THEN 'Evening'
	END AS 'Part of the Day',
	CASE
		WHEN g.duration <= 3 THEN 'Extra Short'
		WHEN g.duration >= 4 AND g.duration <=6 THEN 'Short'
		WHEN g.duration > 6 THEN 'Long'
		WHEN g.duration IS NULL THEN 'Extra Long'
	END AS 'Duration'
 FROM games AS g
ORDER BY g.name, `Duration`, `Part of the Day`;

-- TASK 16

SELECT product_name, order_date,
	DATE_ADD(order_date, INTERVAL 3 DAY) AS pay_due,
	DATE_ADD(order_date, INTERVAL 1 MONTH) AS deliver_due
FROM orders AS o;

-- TASK 17

CREATE TABLE people(
id INT,
name VARCHAR(50),
birthdate DATETIME
);

INSERT INTO people VALUES
(1, 'Victor', '2000-12-07 00:00:00'),
(2, 'Steven', '1992-09-10 00:00:00'),
(3, 'Stephen', '1910-09-19 00:00:00'),
(4, 'John', '2010-01-06 00:00:00');

SELECT
	p.name,
	FLOOR(DATEDIFF(NOW(), p.birthdate) / 365) AS 'age_in_years',
	FLOOR(DATEDIFF(NOW(), p.birthdate) / 365 * 12) AS 'age_in_months',
	FLOOR(DATEDIFF(NOW(), p.birthdate) / 365 * 1440) AS 'age_in_years'
FROM people AS p