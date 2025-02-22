--Steps 1-2: Data Modeling & Data Engineering

--Import and inspect the CSV files
CREATE TABLE "titles"(                               --table with staff titles and title id numbers
	"title_id" CHAR(5) NOT NULL,                     --s0001, e0002, m0001, etc. 
	"title" VARCHAR(20) NOT NULL,                    --Staff, Manager, etc.
	CONSTRAINT "pk_titles" PRIMARY KEY("title_id")   --PK ensures title_id is unique and cannot be null
);

CREATE TABLE "employees"(                            --table with employee demographics 
	"emp_no" INT NOT NULL,                           --473302, 475053, 57444, etc.
	"emp_title_id" CHAR(5) NOT NULL,                 --s0001, e0002, etc. (repeats) 
	"birth_date" DATE NOT NULL,                      --7/25/1953, etc.
	"first_name" VARCHAR(20) NOT NULL,               --Hideyuki, Byong, etc.
	"last_name" VARCHAR(20) NOT NULL,                --Zallocco, Delgrande, etc.
	"sex" CHAR(1) NOT NULL,                          --M/F/I
	"hire_date" DATE NOT NULL,                       --4/28/1990, etc.
	CONSTRAINT "pk_employees" PRIMARY KEY("emp_no")  --PK ensures emp_no is unique and cannot be null
);

CREATE TABLE "departments"(                             --table with dept numbers and names
	"dept_no" CHAR(4) NOT NULL,                         --d001, d002, etc.
	"dept_name" VARCHAR(20) NOT NULL,                   --Marketing, Finance, etc.
	CONSTRAINT "pk_departments" PRIMARY KEY("dept_no")  --PK ensures dept_no is unique and cannot be null
);

CREATE TABLE "dept_emp"(                                       --table with dept numbers and employee numbers
	"emp_no" INT NOT NULL,                                     --10001 to 499999
	"dept_no" CHAR(4) NOT NULL,                                --d005, d007, etc.
	CONSTRAINT "pk_dept_emp" PRIMARY KEY("emp_no", "dept_no")  --composite key
);

CREATE TABLE "dept_manager"(                                       --table with dept numbers and manager employee number
	"dept_no" CHAR(4) NOT NULL,                                    --d001, d002, etc.
	"emp_no" INT NOT NULL,                                         --110022 to 111939
	CONSTRAINT "pk_dept_manager" PRIMARY KEY("dept_no", "emp_no")  --composite key
);

CREATE TABLE "salaries"(                            --table with employee number and salary
	"emp_no" INT NOT NULL,                          --10001 to 499999
	"salary" INT NOT NULL,                          --60117, 100715, etc.
	CONSTRAINT "pk_salaries" PRIMARY KEY("emp_no")  --PK ensures emp_no is unique and cannot be null  
);

--Add foreign key restraint - refer to another table for data integrity
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


--Step 3: Data Analysis

--List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary  --selects the columns I want for the output
FROM employees e                                             --reference the employees table (with alias e)
INNER JOIN salaries s ON e.emp_no = s.emp_no;                --inner join assuming every employee has a salary

--List the first name, last name, and hire date for the employees who were hired in 1986
--Reference: https://www.sqltutorial.org/sql-date-functions/how-to-extract-year-from-date-in-sql/
SELECT e.first_name, e.last_name, e.hire_date   --selects the columns I want for the output
FROM employees e                                --reference the employees table (with alias e)
WHERE EXTRACT (YEAR FROM e.hire_date) = 1986;   --extract year from hire date and filter for 1986

--List the manager of each department along with their: department number, department name, employee number, last name, and first name
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name   --selects the columns I want for the output 
FROM dept_manager m                                                  --referencing dept_manager table first
	INNER JOIN employees e                                           --joining department manager to find their name in employees table 
		ON m.emp_no = e.emp_no                                       --joining using the employee number
	INNER JOIN departments d                                         --joining with departments to get dept_name
		ON m.dept_no = d.dept_no;                                    --joining using the department number 
	
--List the department number for each employee along with: that employee’s employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name  --selects the columns I want for the output
FROM employees e                                                     --referencing employees table first
	INNER JOIN dept_emp de                                           --joining department employee to find their department number
		ON e.emp_no = de.emp_no                                      --joining using the employee number
	INNER JOIN departments d                                         --joining with departments to get dept_name
		ON de.dept_no = d.dept_no;                                   --joining using the department number

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.first_name, e.last_name, e.sex   --selects the columns I want for the output
FROM employees e                          --referencing employees table
WHERE e.first_name = 'Hercules'           --only extracting first name of Hercules
AND last_name LIKE 'B%';                  --AND extracting last names starting with B

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name  --selects the columns I want for the output
FROM employees e                                         --referencing employees table
	INNER JOIN dept_emp de                               --joining department employee to find their department number
		ON e.emp_no = de.emp_no                          --joining using the employee number
	INNER JOIN departments d                             --joining with departments to get dept_name
		ON de.dept_no = d.dept_no                        --joining using the department number
WHERE d.dept_name = 'Sales';                             --only extracting Sales department

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name  --selects the columns I want for the output
FROM employees e                                         --referencing employees table
	INNER JOIN dept_emp de                               --joining department employee to find their department number
		ON e.emp_no = de.emp_no                          --joining using the employee number
	INNER JOIN departments d                             --joining with departments to get dept_name
		ON de.dept_no = d.dept_no                        --joining using the department number
WHERE d.dept_name = 'Sales'                              --extracting Sales department
OR d.dept_name = 'Development';                          --OR extracting Development department

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT e.last_name,                           --selects the columns I want for the output
       COUNT(e.last_name) AS last_name_count  --count how many employees have each last name
FROM employees e                              --referencing employees table
GROUP BY e.last_name                          --group by the last name so you have a row for each unique last name
ORDER BY last_name_count DESC                 --orders the result count in descending order
