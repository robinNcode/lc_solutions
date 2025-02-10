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