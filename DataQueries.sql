DROP TABLE IF EXISTS career_outcome CASCADE;
DROP TABLE IF EXISTS skills_extra CASCADE;
DROP TABLE IF EXISTS academic_performance CASCADE;
DROP TABLE IF EXISTS students CASCADE;

CREATE TABLE Students (
	student_ID varchar(4) PRIMARY KEY,
	age int,
	gender varchar(6)
);

CREATE TABLE Academic_Performance (
	student_ID varchar(4) PRIMARY KEY,
	High_School_GPA numeric(4,2),
	SAT_Score int,
	University_GPA numeric(4,2),
	Field_of_Study varchar(50)
);

CREATE TABLE Skills_Extra (
	Student_ID varchar(4) PRIMARY KEY,
	Internships_Completed int,
	Projects_Completed int,
	Certifications int,
	Soft_Skills_Score int,
	Networking_Score int
);

CREATE TABLE Career_Outcome (
	Student_ID varchar(4) PRIMARY KEY,
	Job_Offers int,
	Starting_Salary int,
	Career_Satisfaction int,
	Years_to_Promotion int,
	Current_Job_Level varchar(10),
	Work_Life_Balance int,
	Entrepreneurship varchar(3)
);

COPY students(student_id, age, gender) FROM 'C:\Program Files\PostgreSQL\18\data\group work\students.csv' DELIMITER ',' CSV HEADER;

COPY academic_performance(student_id, High_School_GPA, SAT_Score, University_GPA, Field_of_Study) FROM 'C:\Program Files\PostgreSQL\18\data\group work\academic_performance.csv' DELIMITER ',' CSV HEADER;

COPY skills_extra(student_id, Internships_Completed, Projects_Completed, Certifications, Soft_Skills_Score, Networking_Score) FROM 'C:\Program Files\PostgreSQL\18\data\group work\skills_extra.csv' DELIMITER ',' CSV HEADER;

COPY career_outcome(student_id, Job_Offers, Starting_Salary, Career_Satisfaction, Years_to_Promotion, Current_Job_Level, Work_Life_Balance, Entrepreneurship) FROM 'C:\Program Files\PostgreSQL\18\data\group work\career_outcomes.csv' DELIMITER ',' CSV HEADER;

SELECT 'Students' AS tabelle, COUNT(*) AS anzahl FROM students
UNION ALL
SELECT 'Academic Performance', COUNT(*) FROM academic_performance
UNION ALL
SELECT 'Skills Extra', COUNT(*) FROM skills_extra
UNION ALL
SELECT 'Career Outcome', COUNT(*) FROM career_outcome;

SELECT * FROM students WHERE gender = 'Male';
SELECT * FROM students WHERE gender = 'Female';
SELECT age FROM students;

SELECT 
    s.student_ID,
    s.age,
    s.gender,
    ap.University_GPA,
    ap.SAT_Score,
    ap.Field_of_Study,
    se.Soft_Skills_Score,
    se.Networking_Score,
    se.Internships_Completed,
    co.Starting_Salary
FROM students s
JOIN academic_performance ap ON s.student_ID = ap.student_ID
JOIN skills_extra se ON LOWER(s.student_ID) = LOWER(se.Student_ID)
JOIN career_outcome co ON LOWER(s.student_ID) = LOWER(co.Student_ID)
LIMIT 10;

SELECT COUNT(*) AS vollstaendige_datensaetze
FROM students s
JOIN academic_performance ap ON s.student_ID = ap.student_ID
JOIN skills_extra se ON LOWER(s.student_ID) = LOWER(se.Student_ID)
JOIN career_outcome co ON LOWER(s.student_ID) = LOWER(co.Student_ID);

SELECT 
    ROUND(AVG(University_GPA), 2) AS avg_gpa,
    ROUND(MIN(University_GPA), 2) AS min_gpa,
    ROUND(MAX(University_GPA), 2) AS max_gpa,
    ROUND(AVG(SAT_Score), 0) AS avg_sat,
    MIN(SAT_Score) AS min_sat,
    MAX(SAT_Score) AS max_sat
FROM academic_performance;

SELECT 
    ROUND(AVG(Soft_Skills_Score), 2) AS avg_soft_skills,
    MIN(Soft_Skills_Score) AS min_soft_skills,
    MAX(Soft_Skills_Score) AS max_soft_skills,
    ROUND(AVG(Networking_Score), 2) AS avg_networking,
    MIN(Networking_Score) AS min_networking,
    MAX(Networking_Score) AS max_networking
FROM skills_extra;

SELECT 
    ROUND(AVG(Starting_Salary), 2) AS avg_salary,
    MIN(Starting_Salary) AS min_salary,
    MAX(Starting_Salary) AS max_salary
FROM career_outcome;

SELECT 
    CASE 
        WHEN ap.University_GPA >= 3.7 THEN 'High GPA (3.7+)'
        WHEN ap.University_GPA >= 3.3 THEN 'Medium GPA (3.3-3.7)'
        ELSE 'Low GPA (<3.3)'
    END AS gpa_category,
    COUNT(*) AS number_students,
    ROUND(AVG(co.Starting_Salary), 2) AS avg_salary,
    MIN(co.Starting_Salary) AS min_salary,
    MAX(co.Starting_Salary) AS max_salary
FROM academic_performance ap
JOIN career_outcome co ON LOWER(ap.student_ID) = LOWER(co.Student_ID)
GROUP BY gpa_category
ORDER BY avg_salary DESC;

SELECT 
    CASE 
        WHEN ap.SAT_Score >= 1400 THEN 'High SAT (1400+)'
        WHEN ap.SAT_Score >= 1200 THEN 'Medium SAT (1200-1400)'
        ELSE 'Low SAT (<1200)'
    END AS sat_kategorie,
    COUNT(*) AS anzahl_studenten,
    ROUND(AVG(co.Starting_Salary), 2) AS avg_salary
FROM academic_performance ap
JOIN career_outcome co ON LOWER(ap.student_ID) = LOWER(co.Student_ID)
GROUP BY sat_kategorie
ORDER BY avg_salary DESC;

SELECT 
    ap.student_ID,
    ap.University_GPA,
    ap.SAT_Score,
    co.Starting_Salary
FROM academic_performance ap
JOIN career_outcome co ON LOWER(ap.student_ID) = LOWER(co.Student_ID)
WHERE ap.University_GPA >= 3.7
ORDER BY co.Starting_Salary DESC;

SELECT 
    CASE 
        WHEN se.Soft_Skills_Score >= 8 THEN 'High Soft Skills (9+)'
        WHEN se.Soft_Skills_Score >= 6 THEN 'Medium Soft Skills (6-9)'
        ELSE 'Low Soft Skills (<6)'
    END AS soft_skills_category,
    COUNT(*) AS number_students,
    ROUND(AVG(co.Starting_Salary), 2) AS avg_salary,
    MIN(co.Starting_Salary) AS min_salary,
    MAX(co.Starting_Salary) AS max_salary
FROM skills_extra se
JOIN career_outcome co ON LOWER(se.Student_ID) = LOWER(co.Student_ID)
GROUP BY soft_skills_category
ORDER BY avg_salary DESC;

SELECT 
    CASE 
        WHEN se.Networking_Score >= 8 THEN 'High Networking (8+)'
        WHEN se.Networking_Score >= 6 THEN 'Medium Networking (6-8)'
        ELSE 'Low Networking (<6)'
    END AS networking_category,
    COUNT(*) AS number_students,
    ROUND(AVG(co.Starting_Salary), 2) AS avg_salary,
    MIN(co.Starting_Salary) AS min_salary,
    MAX(co.Starting_Salary) AS max_salary
FROM skills_extra se
JOIN career_outcome co ON LOWER(se.Student_ID) = LOWER(co.Student_ID)
GROUP BY networking_category
ORDER BY avg_salary DESC;

