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
