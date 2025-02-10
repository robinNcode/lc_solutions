# 1148. Article Views I -------------------------
SELECT DISTINCT author_id AS id FROM Views
WHERE author_id IN(SELECT viewer_id FROM Views)
AND author_id = viewer_id
ORDER BY id;

SELECT DISTINCT table1.author_id AS id
FROM Views table1
JOIN Views table2
  ON table1.author_id = table2.viewer_id
WHERE table1.author_id = table1.viewer_id
ORDER BY id;


# 1683. Invalid Tweets -----------------------------------------
CREATE TABLE IF NOT EXISTS Tweets(tweet_id INT, content VARCHAR(50));
TRUNCATE TABLE Tweets;
INSERT INTO Tweets (tweet_id, content) VALUES ('1', 'Let us Code');
INSERT INTO Tweets (tweet_id, content) VALUES ('2', 'More than fifteen chars are here!');

SELECT tweet_id FROM Tweets
WHERE CHAR_LENGTH(content) > 15;


# 1378. Replace Employee ID With The Unique Identifier -------------------
CREATE TABLE IF NOT EXISTS Employees (id INT, NAME VARCHAR(20));
CREATE TABLE IF NOT EXISTS EmployeeUNI (id INT, unique_id INT);
TRUNCATE TABLE Employees;
INSERT INTO Employees (id, NAME) VALUES ('1', 'Alice');
INSERT INTO Employees (id, NAME) VALUES ('7', 'Bob');
INSERT INTO Employees (id, NAME) VALUES ('11', 'Meir');
INSERT INTO Employees (id, NAME) VALUES ('90', 'Winston');
INSERT INTO Employees (id, NAME) VALUES ('3', 'Jonathan');
TRUNCATE TABLE EmployeeUNI;
INSERT INTO EmployeeUNI (id, unique_id) VALUES ('3', '1');
INSERT INTO EmployeeUNI (id, unique_id) VALUES ('11', '2');
INSERT INTO EmployeeUNI (id, unique_id) VALUES ('90', '3');

SELECT unique_id, NAME
FROM Employees AS e
LEFT JOIN EmployeeUni AS eu ON e.id = eu.id;


# 1068. Product Sales Analysis I ------------------------------
CREATE TABLE IF NOT EXISTS Sales (sale_id INT, product_id INT, YEAR INT, quantity INT, price INT);
CREATE TABLE IF NOT EXISTS Product (product_id INT, product_name VARCHAR(10));
TRUNCATE TABLE Sales;
INSERT INTO Sales (sale_id, product_id, YEAR, quantity, price) VALUES ('1', '100', '2008', '10', '5000');
INSERT INTO Sales (sale_id, product_id, YEAR, quantity, price) VALUES ('2', '100', '2009', '12', '5000');
INSERT INTO Sales (sale_id, product_id, YEAR, quantity, price) VALUES ('7', '200', '2011', '15', '9000');
TRUNCATE TABLE Product;
INSERT INTO Product (product_id, product_name) VALUES ('100', 'Nokia');
INSERT INTO Product (product_id, product_name) VALUES ('200', 'Apple');
INSERT INTO Product (product_id, product_name) VALUES ('300', 'Samsung');

# My solutions ...
SELECT product_name, YEAR, price
FROM Sales
JOIN Product ON Sales.product_id = Product.product_id;

SELECT P.product_name, S.year, S.price
FROM SALES AS S, PRODUCT AS P
WHERE S.product_id=P.product_id;

# 1581. Customer Who Visited but Did Not Make Any Transactions --------------
CREATE TABLE IF NOT EXISTS Visits(visit_id INT, customer_id INT);
CREATE TABLE IF NOT EXISTS Transactions(transaction_id INT, visit_id INT, amount INT);
TRUNCATE TABLE Visits;
INSERT INTO Visits (visit_id, customer_id) VALUES ('1', '23');
INSERT INTO Visits (visit_id, customer_id) VALUES ('2', '9');
INSERT INTO Visits (visit_id, customer_id) VALUES ('4', '30');
INSERT INTO Visits (visit_id, customer_id) VALUES ('5', '54');
INSERT INTO Visits (visit_id, customer_id) VALUES ('6', '96');
INSERT INTO Visits (visit_id, customer_id) VALUES ('7', '54');
INSERT INTO Visits (visit_id, customer_id) VALUES ('8', '54');
TRUNCATE TABLE Transactions;
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('2', '5', '310');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('3', '5', '300');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('9', '5', '200');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('12', '1', '910');
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES ('13', '2', '970');

SELECT v.`customer_id`, SUM(t.`visit_id` IS NULL) AS count_no_trans
FROM Visits v
LEFT JOIN transactions t ON v.`visit_id` = t.`visit_id`
WHERE t.`visit_id` IS NULL
GROUP BY v.`customer_id`;

# 197. Rising Temperature ---------------------------------------------
CREATE TABLE IF NOT EXISTS Weather (id INT, recordDate DATE, temperature INT);
TRUNCATE TABLE Weather;
INSERT INTO Weather (id, recordDate, temperature) VALUES ('1', '2015-01-01', '10');
INSERT INTO Weather (id, recordDate, temperature) VALUES ('2', '2015-01-02', '25');
INSERT INTO Weather (id, recordDate, temperature) VALUES ('3', '2015-01-03', '20');
INSERT INTO Weather (id, recordDate, temperature) VALUES ('4', '2015-01-04', '30');

SELECT w1.id
FROM Weather w1
LEFT JOIN Weather w2
ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;

SELECT w1.id 
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature;


# 185. Department Top Three Salaries ---------------------------
CREATE TABLE IF NOT EXISTS Employee (id INT, NAME VARCHAR(255), salary INT, departmentId INT);
CREATE TABLE IF NOT EXISTS Department (id INT, NAME VARCHAR(255));
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, NAME, salary, departmentId) VALUES ('1', 'Joe', '85000', '1');
INSERT INTO Employee (id, NAME, salary, departmentId) VALUES ('2', 'Henry', '80000', '2');
INSERT INTO Employee (id, NAME, salary, departmentId) VALUES ('3', 'Sam', '60000', '2');
INSERT INTO Employee (id, NAME, salary, departmentId) VALUES ('4', 'Max', '90000', '1');
INSERT INTO Employee (id, NAME, salary, departmentId) VALUES ('5', 'Janet', '69000', '1');
INSERT INTO Employee (id, NAME, salary, departmentId) VALUES ('6', 'Randy', '85000', '1');
INSERT INTO Employee (id, NAME, salary, departmentId) VALUES ('7', 'Will', '70000', '1');
TRUNCATE TABLE Department;
INSERT INTO Department (id, NAME) VALUES ('1', 'IT');
INSERT INTO Department (id, NAME) VALUES ('2', 'Sales');

SELECT d.name AS Department, e.name AS Employee, e.salary
FROM Employee e 
WHERE (SELECT COUNT(*) FROM Employee e2;



# 1661. Average Time of Process per Machine ----------------------------------------
CREATE TABLE IF NOT EXISTS Activity (machine_id INT, process_id INT, activity_type ENUM('start', 'end'), TIMESTAMP FLOAT);
TRUNCATE TABLE Activity;
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('0', '0', 'start', '0.712');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('0', '0', 'end', '1.52');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('0', '1', 'start', '3.14');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('0', '1', 'end', '4.12');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('1', '0', 'start', '0.55');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('1', '0', 'end', '1.55');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('1', '1', 'start', '0.43');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('1', '1', 'end', '1.42');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('2', '0', 'start', '4.1');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('2', '0', 'end', '4.512');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('2', '1', 'start', '2.5');
INSERT INTO Activity (machine_id, process_id, activity_type, TIMESTAMP) VALUES ('2', '1', 'end', '5');

SELECT a.machine_id,
ROUND(
(SELECT AVG(a1.timestamp) FROM Activity a1 WHERE a1.activity_type = 'end' AND a1.machine_id = a.machine_id)
- (SELECT AVG(a1.timestamp) FROM Activity a1 WHERE a1.activity_type = 'start' AND a1.machine_id = a.machine_id)
, 3) AS processing_time
FROM Activity a
GROUP BY a.machine_id;


# 577. Employee Bonus ---------------------------

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus IS NULL OR b.bonus < 1000;

# 1280. Students and Examinations ---------------------------------------
CREATE TABLE IF NOT EXISTS Students (student_id INT, student_name VARCHAR(20));
CREATE TABLE IF NOT EXISTS Subjects (subject_name VARCHAR(20));
CREATE TABLE IF NOT EXISTS Examinations (student_id INT, subject_name VARCHAR(20));
TRUNCATE TABLE Students;
INSERT INTO Students (student_id, student_name) VALUES ('1', 'Alice');
INSERT INTO Students (student_id, student_name) VALUES ('2', 'Bob');
INSERT INTO Students (student_id, student_name) VALUES ('13', 'John');
INSERT INTO Students (student_id, student_name) VALUES ('6', 'Alex');
TRUNCATE TABLE Subjects;
INSERT INTO Subjects (subject_name) VALUES ('Math');
INSERT INTO Subjects (subject_name) VALUES ('Physics');
INSERT INTO Subjects (subject_name) VALUES ('Programming');
TRUNCATE TABLE Examinations;
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('2', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Programming');
INSERT INTO Examinations (student_id, subject_name) VALUES ('13', 'Physics');
INSERT INTO Examinations (student_id, subject_name) VALUES ('2', 'Math');
INSERT INTO Examinations (student_id, subject_name) VALUES ('1', 'Math');

SELECT stdt.student_id, stdt.student_name, sub.subject_name,
COALESCE(
	(SELECT COUNT(e.student_id) 
		FROM Examinations e 
		WHERE e.student_id = stdt.student_id AND e.subject_name = sub.subject_name)
, 0) AS attended_exams
FROM Students AS stdt, Subjects AS sub
ORDER BY stdt.student_id, sub.subject_name;

# 570. Managers with at Least 5 Direct Reports -------------
SELECT e1.name 
FROM Employee AS e1
JOIN Employee AS e2 ON e1.id = e2.managerId
GROUP BY e1.id, e1.name
HAVING COUNT(e2.id) >= 5;

# 1934. Confirmation Rate ----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Signups (user_id INT, time_stamp DATETIME);
CREATE TABLE IF NOT EXISTS Confirmations (user_id INT, time_stamp DATETIME, ACTION ENUM('confirmed','timeout'));
TRUNCATE TABLE Signups;
INSERT INTO Signups (user_id, time_stamp) VALUES ('3', '2020-03-21 10:16:13');
INSERT INTO Signups (user_id, time_stamp) VALUES ('7', '2020-01-04 13:57:59');
INSERT INTO Signups (user_id, time_stamp) VALUES ('2', '2020-07-29 23:09:44');
INSERT INTO Signups (user_id, time_stamp) VALUES ('6', '2020-12-09 10:39:37');
TRUNCATE TABLE Confirmations;
INSERT INTO Confirmations (user_id, time_stamp, ACTION) VALUES ('3', '2021-01-06 03:30:46', 'timeout');
INSERT INTO Confirmations (user_id, time_stamp, ACTION) VALUES ('3', '2021-07-14 14:00:00', 'timeout');
INSERT INTO Confirmations (user_id, time_stamp, ACTION) VALUES ('7', '2021-06-12 11:57:29', 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, ACTION) VALUES ('7', '2021-06-13 12:58:28', 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, ACTION) VALUES ('7', '2021-06-14 13:59:27', 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, ACTION) VALUES ('2', '2021-01-22 00:00:00', 'confirmed');
INSERT INTO Confirmations (user_id, time_stamp, ACTION) VALUES ('2', '2021-02-28 23:59:59', 'timeout');

# 1934. Confirmation Rate ----------------------------------------------------------------------
SELECT s.user_id, 
       ROUND(COALESCE(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id), 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

# 620. Not Boring Movies -------------------------------------
SELECT * FROM cinema WHERE id % 2 != 0 AND description != 'boring'
ORDER BY rating DESC;

# 1251. Average Selling Price -------------------------------------
SELECT 
    p.product_id, 
    COALESCE(ROUND(SUM(p.price * u.units) / NULLIF(SUM(u.units), 0), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u 
    ON p.product_id = u.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
