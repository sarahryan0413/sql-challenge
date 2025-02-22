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
	"emp_no" VARCHAR(10) NOT NULL,                                 --110022 to 111939
	CONSTRAINT "pk_dept_manager" PRIMARY KEY("dept_no", "emp_no")  --composite key
);

CREATE TABLE "salaries"(                            --table with employee number and salary
	"emp_no" VARCHAR(10) NOT NULL,                  --10001 to 499999
	"salary" INT NOT NULL,                          --60117, 100715, etc.
	CONSTRAINT "pk_salaries" PRIMARY KEY("emp_no")  --PK ensures emp_no is unique and cannot be null  
);

--Add foreign key restraint - refer to another table for data integrity
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");



