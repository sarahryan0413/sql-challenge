--Drop table if exists
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

--Import and inspect the CSV files
CREATE TABLE departments(         --table with dept numbers and names
	dept_no CHAR(4),              --d001, d002, etc.
	dept_name VARCHAR(20)         --Marketing, Finance, etc.
);

--CSV not importing??????
CREATE TABLE dept_emp(            --table with dept numbers and employee numbers
	dept_no CHAR(4),              --d005, d007, etc.
	emp_no VARCHAR(10)            --10001 to 499999
);

CREATE TABLE dept_manager(        --table with dept numbers and manager employee number
	dept_no CHAR(4),              --d001, d002, etc.
	emp_no CHAR(6)                --110022 to 111939
);

CREATE TABLE employees(           --table with employee demographics 
	emp_no VARCHAR(10),           --473302, 475053, 57444, etc.
	emp_title_id CHAR(5),         --s0001, e0002, etc. (repeats) 
	birth_date DATE,              --7/25/1953, etc.
	first_name VARCHAR(20),       --Hideyuki, Byong, etc.
	last_name VARCHAR(20),        --Zallocco, Delgrande, etc.
	sex CHAR(1),                  --M/F
	hire_date DATE                --4/28/1990
);

CREATE TABLE salaries(             --table with employee number and salary
	emp_no VARCHAR(10),            --10001 to 499999
	salary INT                     --60117, 100715, etc.
);

CREATE TABLE titles(               --table with title id and job title
	title_id CHAR(5),                     --s0001, e0002, m0001, etc. 
	title VARCHAR(20)              --Staff, Manager, etc.
);
