
select * from exams

select * from students

select * from results

select * from questions


-- View 1
CREATE VIEW StudentBasicInfo AS
SELECT 
s.student_id, 
s.first_name, 
s.last_name, 
s.age, 
s.grade_level
FROM Students s
INNER JOIN Results r 
ON s.student_id = r.student_id
WHERE r.result_status = 'Pass'
ORDER BY last_name, first_name;

-- View 2
CREATE VIEW ExamDetails AS
SELECT exam_id,
exam_name,
subject, 
total_marks, 
exam_date
FROM Exams
WHERE total_marks > 50
ORDER BY exam_date DESC;


-- View 3
CREATE VIEW ResultSummary AS
SELECT
s.student_id,
s.first_name,
s.last_name,
COUNT(r.exam_id) AS number_of_exams,
AVG(r.percentage) AS average_percentage,
MAX(r.percentage) AS highest_percentage,
MIN(r.percentage) AS lowest_percentage
FROM Students s
INNER JOIN Results r ON s.student_id = r.student_id
WHERE r.result_status = 'Pass'
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(r.exam_id) > 1
ORDER BY AVG(r.percentage) DESC;

-- View 4
CREATE VIEW QuestionStats AS
SELECT exam_id, question_type, 
AVG(marks_allocated) AS avg_marks,
MAX(marks_allocated) AS max_marks, 
MIN(marks_allocated) AS min_marks
FROM Questions
GROUP BY exam_id, question_type
ORDER BY exam_id, question_type;


select * from studentbasicinfo

select * from questionstats

select * from ResultSummary

select * from StudentBasicInfo
