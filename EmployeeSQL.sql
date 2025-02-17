--Import and inspect the CSV files
CREATE TABLE departments(
	dept_no CHAR(4) PRIMARY KEY,  --dept are 4 characters each - a good option for primary key
	dept_name VARCHAR(20)
);
SELECT * FROM departments;