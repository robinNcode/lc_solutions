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