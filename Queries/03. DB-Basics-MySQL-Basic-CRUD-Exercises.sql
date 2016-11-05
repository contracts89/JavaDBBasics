-- TASK 2

SELECT * FROM departments;

-- TASK 3

SELECT name FROM departments;

-- TASK 4

SELECT employees.first_name, employees.last_name, employees.salary FROM employees;

-- TASK 5

SELECT employees.first_name, employees.middle_name, employees.last_name FROM employees;

-- TASK 6

SELECT CONCAT(e.first_name, '.', e.last_name, '@softuni.bg') AS 'Full Email Address' FROM employees as e;

-- TASK 7

SELECT DISTINCT e.salary FROM employees AS e;

-- TASK 8

SELECT * FROM employees WHERE job_title = 'Sales Representative';

-- TASK 9

SELECT e.first_name, e.last_name, e.job_title FROM employees as e
 WHERE salary BETWEEN 20000 AND 30000;

-- TASK 10

SELECT CONCAT(e.first_name, ' ', e.middle_name, ' ', e.last_name) AS 'Full Name' FROM employees as e
 WHERE salary = 25000 OR salary = 14000 OR salary = 12500 OR salary = 23600;

-- TASK 11

SELECT e.first_name, e.last_name FROM employees as e
 WHERE e.manager_id IS NULL;

-- TASK 12

SELECT e.first_name, e.last_name, e.salary FROM employees as e
 WHERE e.salary > 50000
 ORDER BY salary DESC;

-- TASK 13

SELECT e.first_name, e.last_name FROM employees as e
 ORDER BY salary DESC LIMIT 5;

-- TASK 14

SELECT e.first_name, e.last_name FROM employees as e
WHERE e.department_id <> 4;

-- TASK 15

CREATE VIEW v_employees_salaries AS
SELECT e.first_name, e.last_name, e.salary FROM employees AS e;

-- TASK 16

CREATE VIEW v_employees_salaries AS
SELECT e.first_name, e.last_name, e.salary FROM employees AS e;

-- TASK 17

CREATE VIEW v_employees_job_titles AS
SELECT CONCAT(e.first_name, ' ', IFNULL(e.middle_name, ""), ' ', e.last_name) AS 'full_name', job_title FROM employees AS e;

-- TASK 18

SELECT DISTINCT job_title FROM employees

-- TASK 19

SELECT * FROM projects
 ORDER BY start_date ASC, name ASC LIMIT 10;

-- TASK 20

SELECT first_name, last_name, hire_date FROM employees
 ORDER BY hire_date DESC LIMIT 7;

-- TASK 21

UPDATE employees SET salary = salary + salary*0.12
 WHERE department_id = 1
  OR department_id = 2
  OR department_id = 4
  OR department_id = 11;
  
SELECT salary FROM employees;


-- TASK 22

SELECT peak_name FROM peaks ORDER BY peak_name ASC;

-- TASK 23

SELECT c.country_name, c.population FROM countries AS c
 WHERE c.continent_code = 'EU'
 ORDER BY c.population DESC LIMIT 30;

-- TASK 24

SELECT c.country_name, c.country_code, 
 CASE 
	 WHEN c.currency_code = 'EUR' THEN 'Euro'
	 ELSE 'Not Euro' 
 END AS 'Currency'
FROM countries AS c
ORDER BY c.country_name ASC;

-- TASK 25

SELECT name FROM characters ORDER BY name ASC;