---
Module 9 Challenge
---
### Background

This project involves designing and implementing a relational database for a fictional company, Pewlett Hackard, and performing various data analysis tasks using SQL. The goal is to model the company's employee data and perform queries to retrieve specific insights related to the employees, their departments, and salaries.

#### Data Modeling

Utilized QuickDBD website to create the ERD and initial tables.

This section includes the schema of the tables created in the database:
- titles: Contains information about employee titles.
- employees: Stores employee demographic data such as names, birth date, hire date, and sex.
- departments: Contains department numbers and department names.
- dept_emp: Stores the mapping of employees to departments.
- dept_manager: Stores information about department managers.
- salaries: Stores employee salary information.

#### Data Engineering

The database includes several key data engineering tasks:
- Table Creation: SQL commands to create the tables with appropriate column types, constraints, and primary/foreign key relationships.
- Foreign Key Relationships: All necessary tables are connected via foreign keys to maintain data integrity.
- Constraints: Not null constraints and appropriate column sizes have been applied to ensure consistency in the database.

#### Data Analysis
The following queries were created to analyze employee data:
- Employee Data: Query to list employee number, last name, first name, sex, and salary.
- Hiring Year Filter: Query to list employees hired in 1986.
- Department Manager: Query to list the manager of each department with their employee and department details.
- Employee-Department Assignment: Query to list employees and their corresponding departments.
- Employee Name Search: Query to find employees with specific first and last names.
- Department Employees: Query to list employees from the 'Sales' and 'Development' departments.
- Last Name Frequency: Query to list how many employees share the same last name, sorted in descending order.
