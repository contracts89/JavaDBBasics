-- TASK 7

SELECT w.deposit_group, SUM(w.deposit_amount) AS total_sum FROM wizzard_deposits AS w
 WHERE w.magic_wand_creator = 'Ollivander family'
 GROUP BY w.deposit_group
HAVING total_sum < 150000
 ORDER BY SUM(w.deposit_amount) DESC;
 
-- TASK 8
 
 SELECT w.deposit_group, w.magic_wand_creator, MIN(w.deposit_charge) FROM wizzard_deposits AS w
  GROUP BY w.deposit_group, w.magic_wand_creator
  ORDER BY w.magic_wand_creator, w.deposit_group;
  
-- TASK 9

SELECT CASE 
	WHEN age <= 10 THEN '[0-10]' 
	WHEN age <= 20 THEN '[11-20]' 
	WHEN age <= 30 THEN '[21-30]' 
	WHEN age <= 40 THEN '[31-40]' 
	WHEN age <= 50 THEN '[41-50]' 
	WHEN age <= 60 THEN '[51-60]' 
       ELSE '[61+]' END AS age_group, 
COUNT(*) AS wizzard_count 
FROM wizzard_deposits
GROUP BY CASE 
WHEN age <= 10 THEN '[0-10]' 
WHEN age <= 20 THEN '[11-20]' 
WHEN age <= 30 THEN '[21-30]' 
WHEN age <= 40 THEN '[31-40]' 
WHEN age <= 50 THEN '[41-50]' 
WHEN age <= 60 THEN '[51-60]' 
ELSE '[61+]' END

-- TASK 10

SELECT LEFT(first_name, 1) AS first_letter FROM wizzard_deposits
WHERE deposit_group = 'Troll Chest'
GROUP BY LEFT(first_name, 1)
ORDER BY first_letter

-- TASK 11

SELECT w.deposit_group, w.is_deposit_expired AS is_deposit_expired, AVG(w.deposit_interest) AS average_interest FROM wizzard_deposits AS w
WHERE w.deposit_start_date > '1985-01-01'
GROUP BY w.deposit_group, w.is_deposit_expired
ORDER BY w.deposit_group DESC, w.is_deposit_expired ASC

-- TASK 12

CREATE TABLE wizard_depozits AS
SELECT w.first_name AS host_wizard,
 	w.deposit_amount AS host_deposit,
   	w2.first_name AS guest_name,
  w2.deposit_amount AS guest_deposit
  FROM wizzard_deposits AS w
  JOIN wizzard_deposits AS w2
    ON w2.id - 1 = w.id;
    
SELECT SUM(host_deposit - guest_deposit) AS sum_difference FROM wizard_depozits;

DROP TABLE wizard_depozits;

-- TASK 13

SELECT e.department_id, MIN(e.salary) FROM employees AS e
WHERE e.department_id = 2 OR e.department_id = 5 OR e.department_id = 7 AND e.hire_date > 2000-01-01
GROUP BY e.department_id;

-- TASK 14

CREATE TABLE employees_with_big_salaries AS 
SELECT * FROM employees AS e
 WHERE e.salary > 30000;
 
DELETE FROM employees_with_big_salaries
WHERE manager_id = 42;

UPDATE employees_with_big_salaries SET salary = salary + 5000
WHERE department_id = 1;

SELECT e1.department_id, AVG(e1.salary) FROM employees_with_big_salaries AS e1
GROUP BY e1.department_id;

DROP TABLE employees_with_big_salaries;

-- TASK 15

SELECT e.department_id, MAX(e.salary) AS max_salary FROM employees AS e
GROUP BY e.department_id
HAVING MAX(e.salary) NOT BETWEEN 30000 AND 70000;

-- TASK 16

SELECT COUNT(e.employee_id) AS `count` FROM employees AS e
WHERE e.manager_id IS NULL
GROUP BY e.manager_id;

-- TASK 17

SELECT e.department_id, MAX(e.salary) AS max_salary FROM employees AS e
JOIN
(SELECT e.department_id, MAX(e.salary) AS max_salary FROM employees AS e
JOIN
(SELECT e.department_id, MAX(e.salary) AS max_salary FROM employees AS e
GROUP BY e.department_id) AS max_salary
ON e.department_id = max_salary.department_id
AND e.salary < max_salary.max_salary
GROUP BY department_id) AS second_max_salary
ON e.department_id = second_max_salary.department_id
AND e.salary < second_max_salary.max_salary
GROUP BY e.department_id;

-- TASK 18

SELECT e.first_name, e.last_name, e.department_id FROM employees AS e
JOIN
(SELECT e.first_name, e.last_name, e.department_id, AVG(e.salary) AS avg_salary FROM employees AS e
  GROUP BY e.department_id) AS avg_salary
ON e.department_id = avg_salary.department_id
WHERE e.salary > avg_salary.avg_salary
ORDER BY e.department_id
LIMIT 10;