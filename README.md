# DB_GroupP
TU Graz Database Course Group Project

This project is part of the Database Course (706010) at TU Graz. 

The purpose of this repository is to share all relevant files and reproducability steps for Group P.

# Project tittle
Comparing Soft Skills and Networking to Academic Success in Predicting Starting Salary

Research Problem?
Which factors contribute more to a higher starting salary: academic success or soft skills and networking?

Concept and Motivation
This project investigates if networking, soft skills, or academic achievement have a greater influence on starting pay.
Employers place a higher emphasis on networking and communication than students do on grades, therefore it's critical
to determine which aspects genuinely result in higher pay outcomes.

Importance of Relational Database
A relational database is appropriate because the dataset contains multiple logically distinct but connected entities, such as
students, academic performance, skills, networking experience, and career outcomes. Representing these entities in
separate tables linked by keys ensures data integrity, avoids redundancy, and enables meaningful queries to analyze how
different factors influence career outcomes.

Dataset
education_career_success.csv
https://www.kaggle.com/datasets/adilshamim8/education-and-career-success

# Reproducibility

Workflow and Steps
1. The original dataset (education_career_success.csv) was downloaded and inspected.
2. The dataset was preprocessed using Python (csvbreakup (1).ipynb) and split into multiple CSV files corresponding to the relational tables.
3. A relational database schema (Schema_GroupP.sql) was created in PostgreSQL based on the ER diagram.
4. The preprocessed CSV files were ingested (IngestDataGroupP.sql)into PostgreSQL tables using SQL COPY commands.
5. SQL queries were formulated to analyze the relationships between academic performance, skills, networking, and starting salary.
6. Visualizations were generated using Python (Pandas and Matplotlib) based on the dataset(visualizations.ipynb).
7. All steps can be reproduced by re-running the SQL scripts and Python code.

Tools and Environment
- PostgreSQL (relational database)
- pgAdmin (database management)
- Python (Pandas, Matplotlib)
- CSV files as data exchange format
  
