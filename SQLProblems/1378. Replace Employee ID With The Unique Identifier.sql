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