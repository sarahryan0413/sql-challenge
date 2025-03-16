# 📊 SQL Challenge: Pewlett Hackard Employee Database
## Background
Welcome to Pewlett Hackard! It’s been two weeks since I joined as a data engineer, and my first big assignment is a deep dive into employee records from the 1980s and 1990s. The challenge? All that remains of the old database are six CSV files. My mission: design a relational database, import the data, and analyze key employee trends using SQL.
## 🏗️ Data Modeling
Before diving into SQL, I used QuickDBD to sketch out an Entity Relationship Diagram (ERD), mapping out how all the data connects. The database consists of:
- titles – Job titles over time
- employees – Employee details (name, birth date, hire date, etc.)
- departments – Department names and IDs
- dept_emp – Employee-department assignments
- dept_manager – Department managers
- salaries – Employee salary history
## ⚙️ Data Engineering
With the database structure mapped out, I created SQL tables with:
- Primary & Foreign Keys to maintain relationships
- Data Constraints (e.g., NOT NULL) to ensure data integrity
- Optimized Column Types for efficiency
Once the schema was ready, I imported the CSV data into the corresponding tables.
## 🔍 Data Analysis
With the data in place, I wrote SQL queries to uncover insights, including:
- Employee details (ID, name, salary)
- Employees hired in 1986
- Department managers and their departments
- Employees by department (Sales, Development, etc.)
- Employees with specific name patterns (e.g., "Hercules B.")
- Most common last names in the company
  
This project was a great hands-on experience in data modeling, engineering, and SQL querying. Check out the repository for the full analysis and SQL scripts!

📊 Data provided by edX Boot Camps LLC for educational purposes.
