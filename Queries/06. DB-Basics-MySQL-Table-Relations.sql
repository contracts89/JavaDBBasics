-- TASK 1

CREATE TABLE passports(
passport INT,
passport_number VARCHAR(50)
);

CREATE TABLE persons(
person_id INT,
first_name VARCHAR(50),
salary DECIMAL(10,2),
passport_id INT
);

INSERT INTO passports VALUES
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2');

INSERT INTO persons VALUES
(1, 'Roberto', 43300.00, 102),
(2, 'Tom', 56100.00, 103),
(3, 'Yana', 60200.00, 101);


ALTER TABLE passports
ADD CONSTRAINT pk_passports PRIMARY KEY(passport);

ALTER TABLE persons
ADD CONSTRAINT pk_persons PRIMARY KEY(person_id),
ADD CONSTRAINT fk_persons_passports FOREIGN KEY(passport_id)
    REFERENCES passports(passport);

-- TASK 2

CREATE TABLE manufacturers(
manufacturer_id INT,
name VARCHAR(50),
established_on DATE
);

CREATE TABLE models(
model_id INT,
name VARCHAR(50),
manufacturer_id INT
);

INSERT INTO manufacturers VALUES
(1, 'BMW', '1916-03-07'),
(2, 'Tesla', '2003-01-01'),
(3, 'Lada', '0966-05-01');

INSERT INTO models VALUES
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova 3', 3);

ALTER TABLE manufacturers
ADD CONSTRAINT pk_manufacturers PRIMARY KEY(manufacturer_id);

ALTER TABLE models
ADD CONSTRAINT pk_models PRIMARY KEY(model_id),
ADD CONSTRAINT fk_models_manufacturers FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(manufacturer_id);

-- TASK 3

CREATE TABLE students(
student_id INT,
name VARCHAR(50)
);

CREATE TABLE exams(
exam_id INT,
name VARCHAR(50)
);

CREATE TABLE students_exams(
student_id INT,
exam_id INT
);

INSERT INTO students VALUES
(1, 'Mila'),
(2, 'Toni'),
(3, 'Ron');

INSERT INTO exams VALUES
(101, 'Spring MVC'),
(102, 'Neo4j'),
(103, 'Oracle 11g');

INSERT INTO students_exams VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103);

ALTER TABLE students
ADD CONSTRAINT pk_students PRIMARY KEY(student_id);

ALTER TABLE exams
ADD CONSTRAINT pk_exams PRIMARY KEY(exam_id);

ALTER TABLE students_exams
ADD CONSTRAINT pk_students_exams PRIMARY KEY(student_id, exam_id),
ADD CONSTRAINT fk_se_students FOREIGN KEY(student_id)
	 REFERENCES students(student_id),
ADD CONSTRAINT fk_se_exams FOREIGN KEY(exam_id)
	 REFERENCES exams (exam_id);

-- TASK 4

CREATE TABLE teachers(
teacher_id INT,
name VARCHAR(50),
manager_id INT
);

INSERT INTO teachers VALUES
(101, 'John', NULL),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101);

ALTER TABLE teachers
ADD CONSTRAINT pk_teachers PRIMARY KEY(teacher_id);

ALTER TABLE teachers
ADD CONSTRAINT fk_teachers FOREIGN KEY(manager_id)
 	 REFERENCES teachers(teacher_id);

-- TASK 5

CREATE TABLE cities(
city_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
name VARCHAR(50),
birthday DATE,
city_id INT,
CONSTRAINT fk_customers_cities FOREIGN KEY(city_id)
REFERENCES cities(city_id)
);

CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
CONSTRAINT fk_orders_customers FOREIGN KEY(customer_id)
REFERENCES customers(customer_id)
);

CREATE TABLE item_types(
item_type_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE items(
item_id INT PRIMARY KEY,
name VARCHAR(50),
item_type_id INT,
CONSTRAINT fk_items_item_types FOREIGN KEY(item_type_id)
REFERENCES item_types(item_type_id)
);

CREATE TABLE order_items(
order_id INT,
item_id INT,
CONSTRAINT pk_order_items PRIMARY KEY (order_id, item_id),
CONSTRAINT fk_order_items_orders FOREIGN KEY(order_id)
REFERENCES orders(order_id),
CONSTRAINT fk_order_items_items FOREIGN KEY(item_id)
REFERENCES items(item_id)
);

-- TASK 6

CREATE DATABASE university;

USE university;

CREATE TABLE majors(
major_id INT PRIMARY KEY,
name VARCHAR (50)
);

CREATE TABLE students(
student_id INT PRIMARY KEY,
student_number VARCHAR(12),
student_name VARCHAR (50),
major_id INT,
CONSTRAINT students_majors FOREIGN KEY(major_id) REFERENCES majors(major_id)
);

CREATE TABLE payments(
payment_id INT PRIMARY KEY,
ayment_date DATE,
payment_amount DECIMAL(8, 2),
student_id INT,
CONSTRAINT fk_payments_students FOREIGN KEY(student_id) REFERENCES students(student_id)
);

CREATE TABLE subjects(
subject_id INT PRIMARY KEY,
subject_name VARCHAR(50)
);

CREATE TABLE agenda(
student_id INT,
subject_id INT,
CONSTRAINT pk_agenda PRIMARY KEY (student_id, subject_id),
CONSTRAINT fk_agenda_students FOREIGN KEY(student_id) REFERENCES students(student_id),
CONSTRAINT fk_agenda_subjects FOREIGN KEY(subject_id) REFERENCES subjects(subject_id)
);

-- TASK 9

SELECT e.employee_id, e.job_title, e.address_id, a.address_text FROM employees AS e
INNER JOIN addresses AS a
ON a.address_id = e.address_id
ORDER BY e.address_id
LIMIT 5;

-- TASK 10

SELECT e.employee_id, e.first_name, e.salary, d.name FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.salary > 15000
ORDER BY e.department_id
LIMIT 5;

-- TASK 11

SELECT e.employee_id, e.first_name FROM employees AS e
LEFT JOIN employees_projects AS ep
ON ep.employee_id = e.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id
LIMIT 3;

-- TASK 12

SELECT e.employee_id,  e.first_name , p.name FROM employees as e
INNER JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
INNER JOIN projects as p on p.project_id= ep.project_id
WHERE  start_date > '2002-13-08'
AND end_date IS NULL
ORDER BY employee_id ASC
LIMIT 5;

-- TASK 13

SELECT e.employee_id, e.first_name, p.name AS project_name FROM employees AS e
INNER JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id
LEFT OUTER JOIN projects AS p
ON ep.project_id = p.project_id
AND p.start_date < '20050101'
WHERE e.employee_id = 24;

-- TASK 14

SELECT e.employee_id, e.first_name, e.manager_id, a.first_name  FROM employees AS e
INNER JOIN employees AS a
ON a.employee_id = e.manager_id
WHERE e.manager_id = 3 OR e.manager_id = 7
ORDER BY e.employee_id;

-- TASK 15

SELECT c.country_code, m.mountain_range, p.peak_name, p.elevation FROM countries AS c
INNER JOIN mountains_countries AS mc
ON c.country_code = mc.country_code
INNER JOIN mountains AS m
ON mc.mountain_id = m.id
INNER JOIN peaks AS p
ON m.id = p.mountain_id
WHERE c.country_code = 'BG' AND p.elevation > 2835
ORDER BY p.elevation DESC;

-- TASK 16

SELECT c.country_code, COUNT(m.mountain_range) FROM countries AS c
INNER JOIN mountains_countries AS mc
ON c.country_code = mc.country_code
INNER JOIN mountains AS m
ON mc.mountain_id = m.id
WHERE c.country_code = 'BG' OR c.country_code = 'US' OR c.country_code = 'RU'
GROUP BY c.country_code;

-- TASK 17

SELECT c.country_name, r.river_name FROM countries AS c
INNER JOIN continents AS co
ON c.continent_code = co.continent_code
LEFT OUTER JOIN countries_rivers AS cr
ON c.country_code = cr.country_code
LEft OUTER JOIN rivers AS r
ON cr.river_id = r.id
WHERE co.continent_name = 'Africa'
ORDER BY c.country_name
LIMIT 5

-- TASK 18

SELECT c.continent_code, cc.currency_code, COUNT(cc.country_code) AS currency_usage FROM continents AS c
JOIN countries AS cc ON c.continent_code = cc.continent_code 
GROUP BY c.continent_code , cc.currency_code
HAVING COUNT(cc.country_code) = (SELECT MAX(xxx.currencyXX) FROM (SELECT cx.continent_code, ccx.currency_code, COUNT(ccx.country_code) AS currencyXX
    FROM continents cx
    JOIN countries ccx ON cx.continent_code = ccx.continent_code 
    WHERE c.continent_code = cx.continent_code 
    GROUP BY cx.continent_code , ccx.currency_code) AS xxx)
AND COUNT(cc.country_code) > 1
ORDER BY c.continent_code;

-- TASK 19

SELECT COUNT(c.country_code) FROM countries c
WHERE c.country_code NOT IN
(SELECT mc.country_code FROM mountains_countries mc);