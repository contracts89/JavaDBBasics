-- ALTER TABLE tickets DROP FOREIGN KEY fk_tickets_customers;
-- ALTER TABLE tickets DROP FOREIGN KEY fk_tickets_fligths;
-- DROP TRIGGER `tr_review_grade_insert`;

DROP TABlE tickets;
DROP TABlE flights;
DROP TABLE customer_reviews;

-- section 1 TASK 1: Data Definition

CREATE TABLE flights(
flight_id INT NOT NULL,
departure_time DATETIME NOT NULL,
arrival_time DATETIME NOT NULL,
`status` ENUM('Departing', 'Delayed', 'Arrived', 'Cancelled'),
origin_airport_id INT,
destination_airport_id INT,
airline_id INT,
CONSTRAINT pk_flisgths PRIMARY KEY(flight_id),
CONSTRAINT fk_fligths_airports FOREIGN KEY(origin_airport_id) REFERENCES airports(airport_id),
CONSTRAINT fk_fligths_airports2 FOREIGN KEY (destination_airport_id) REFERENCES airports(airport_id),
CONSTRAINT fk_fligths_airlines FOREIGN KEY(airline_id) REFERENCES airlines(airline_id)
);

CREATE TABLE tickets(
ticket_id INT,
price DECIMAL(8, 2) NOT NULL,
class VARCHAR(6),
seat VARCHAR(5) NOT NULL,
customer_id INT,
flight_id INT,
CONSTRAINT pk_tickets PRIMARY KEY(ticket_id),
CONSTRAINT fk_tickets_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
CONSTRAINT fk_tickets_fligths FOREIGN KEY(flight_id) REFERENCES flights(flight_id)
);

-- section 2 TASK 1: Data Insertion

INSERT INTO flights VALUES
(1, STR_TO_DATE('2016-10-13 06:00 AM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2016-10-13 10:00 AM', '%Y-%m-%d %h:%i %p'), 'Delayed', 1, 4, 1),
(2, STR_TO_DATE('2016-10-12 12:00 PM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2016-10-12 12:01 PM', '%Y-%m-%d %h:%i %p'), 'Departing',1, 3, 2),
(3, STR_TO_DATE('2016-10-14 03:00 PM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2016-10-20 04:00 AM', '%Y-%m-%d %h:%i %p'), 'Delayed', 4, 2, 4),
(4, STR_TO_DATE('2016-10-12 01:24 PM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2016-10-12 4:31 PM', '%Y-%m-%d %h:%i %p'), 'Departing', 3, 1, 3),
(5, STR_TO_DATE('2016-10-12 08:11 AM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2016-10-12 11:22 PM', '%Y-%m-%d %h:%i %p'), 'Departing', 4, 1, 1),
(6, STR_TO_DATE('1995-06-21 12:30 PM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('1995-06-22 08:30 PM', '%Y-%m-%d %h:%i %p'), 'Arrived', 2, 3, 5),
(7, STR_TO_DATE('2016-10-12 11:34 PM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2016-10-13 03:00 AM', '%Y-%m-%d %h:%i %p'), 'Departing', 2, 4, 2),
(8, STR_TO_DATE('2016-11-11 01:00 PM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2016-11-12 10:00 PM', '%Y-%m-%d %h:%i %p'), 'Delayed', 4, 3, 1),
(9, STR_TO_DATE('2015-10-01 12:00 PM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2015-12-01 01:00 AM', '%Y-%m-%d %h:%i %p'), 'Arrived', 1, 2, 1),
(10, STR_TO_DATE('2016-10-12 07:30 PM', '%Y-%m-%d %h:%i %p'), STR_TO_DATE('2016-10-13 12:30 PM', '%Y-%m-%d %h:%i %p'), 'Departing', 2, 1, 7);

INSERT INTO tickets VALUES
(1, 3000.00, 'First', '233-A', 3, 8),
(2, 1799.90, 'Second', '123-D', 1, 1),
(3, 1200.50, 'Second', '12-Z', 2, 5),
(4, 410.68, 'Third', '45-Q', 2, 8),
(5, 560.00, 'Third', '201-R', 4, 6),
(6, 2100.00, 'Second', '13-T', 1, 9),
(7, 5500.00, 'First', '98-O', 2, 7);

-- section 2 TASK 2: Update Arrived Flights

UPDATE flights SET airline_id = 1
WHERE status = 'Arrived';

-- section 2 TASK 3: Update Tickets

UPDATE tickets AS t SET
t.price = t.price + t.price * 0.05
		WHERE t.flight_id IN
		(SELECT f.flight_id FROM flights AS f
 			WHERE f.airline_id =
	   	(SELECT a.airline_id FROM airlines AS a
		 	 WHERE a.rating = (SELECT MAX(a.rating) FROM airlines AS a)));
		 	 
-- section 2 TASK 4: Table Creation

CREATE TABLE customer_reviews(
review_id INT,
review_content VARCHAR(255) NOT NULL,
review_grade INT,
airline_id INT,
customer_id INT,
CONSTRAINT pk_customer_reviews PRIMARY KEY(review_id),
CONSTRAINT fk_customer_reviews_airlines FOREIGN KEY(airline_id) REFERENCES airlines(airline_id),
CONSTRAINT fk_customer_reviews_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
    
DELIMITER //
CREATE TRIGGER `tr_review_grade_insert` BEFORE INSERT ON `customer_reviews` FOR EACH ROW BEGIN
    IF NEW.review_grade NOT BETWEEN 0 AND 10 THEN
    SIGNAL SQLSTATE '12345'
        SET MESSAGE_TEXT = 'check constraint on Pass failed';
    END IF;
END//
DELIMITER ;

CREATE TABLE customer_bank_accounts(
account_id INT,
account_number VARCHAR(10) NOT NULL,
balance DECIMAL(10, 2) NOT NULL,
customer_id INT,
UNIQUE(account_number),
CONSTRAINT pk_customer_bank_accounts PRIMARY KEY(account_id),
CONSTRAINT fk_customer_bank_accounts_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- section 2 TASK 5: Fill the new Tables with Data

INSERT INTO customer_reviews VALUES
(1, 'Me is very happy. Me likey this airline. Me good.', 10, 1, 1),
(2, 'Ja, Ja, Ja… Ja, Gut, Gut, Ja Gut! Sehr Gut!', 10, 1, 4),
(3, 'Meh…', 5, 4, 3),
(4, 'Well I’ve seen better, but I’ve certainly seen a lot worse…', 7, 3, 5);

INSERT INTO customer_bank_accounts VALUES
(1, '123456790', 2569.23, 1),
(2, '18ABC23672', 14004568.23, 2),
(3, 'F0RG0100N3', 19345.20, 5);

-- section 3 TASK 1: Extract All Tickets

SELECT t.ticket_id, t.price, t.class, t.seat FROM tickets AS t
ORDER BY t.ticket_id;

-- section 3 TASK 2: Extract All Customers

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS 'Full Name', c.gender FROM customers AS c
ORDER BY CONCAT(c.first_name, ' ', c.last_name), c.customer_id;

-- section 3 TASK 3: Extract Delayed Flights

SELECT f.flight_id, f.departure_time, f.arrival_time FROM flights AS f
WHERE f.`status` = 'Delayed'
ORDER BY f.flight_id;

-- section 3 TASK 4: Extract Top 5 Most Highly Rated Airlines which have any Flights

SELECT a.airline_id, a.airline_name, a.nationality, a.rating FROM airlines AS a
INNER JOIN flights AS f 
ON a.airline_id = f.airline_id
WHERE f.`status` = 'Departing'
ORDER BY rating DESC
LIMIT 5;

-- section 3 TASK 5: Extract all Tickets with price below 5000, for First Class

SELECT t.ticket_id, a.airport_name AS destination, CONCAT(c.first_name, ' ', c.last_name) FROM tickets AS t
INNER JOIN customers AS c
ON c.customer_id = t.customer_id
INNER JOIN flights AS f
ON t.flight_id = f.flight_id
INNER JOIN airports AS a
ON a.airport_id = f.destination_airport_id
WHERE t.price < 5000 AND t.class = 'First';

-- section 3 TASK 6: Extract all Customers which are departing from their Home Town

