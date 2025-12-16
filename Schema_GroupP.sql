CREATE TABLE Students (
	student_ID varchar(4) PRIMARY KEY,
	age int,
	gender varchar(6)
);

CREATE TABLE Academic_Performance (
	student_ID varchar(4) PRIMARY KEY,
	High_School_GPA numeric(2,1),
	SAT_Score int,
	University_GPA numeric(2,1),
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
