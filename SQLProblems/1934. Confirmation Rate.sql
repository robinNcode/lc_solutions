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

SELECT s.user_id, 
       ROUND(COALESCE(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id), 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;