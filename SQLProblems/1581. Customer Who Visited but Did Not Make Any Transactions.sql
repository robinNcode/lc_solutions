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
