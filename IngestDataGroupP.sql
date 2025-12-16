COPY students(student_id, age, gender) FROM '/private/tmp/GroupPData/students.csv' DELIMITER ',' CSV HEADER;

COPY academic_performance(student_id, High_School_GPA, SAT_Score, University_GPA, Field_of_Study) FROM '/private/tmp/GroupPData/academic_performance.csv' DELIMITER ',' CSV HEADER;

COPY skills_extra(student_id, Internships_Completed, Projects_Completed, Certifications, Soft_Skills_Score, Networking_Score) FROM '/private/tmp/GroupPData/skills_extra.csv' DELIMITER ',' CSV HEADER;

COPY career_outcome(student_id, Job_Offers, Starting_Salary, Career_Satisfaction, Years_to_Promotion, Current_Job_Level, Work_Life_Balance, Entrepreneurship) FROM '/private/tmp/GroupPData/career_outcomes.csv' DELIMITER ',' CSV HEADER;
