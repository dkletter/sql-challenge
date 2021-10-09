--
-- Creating tables, inserting the data from CSV, then testing each table.
-- Be sure to create tables in the correct order to handle foreign keys.
--
CREATE TABLE titles (
	title_id CHAR(5) NOT NULL, 
	title VARCHAR(20), 
	PRIMARY KEY (title_id)
);

INSERT INTO titles(title_id,  title) VALUES
	('s0001',  'Staff'), 
	('s0002',  'Senior Staff'), 
	('e0001',  'Assistant Engineer'), 
	('e0002',  'Engineer'), 
	('e0003',  'Senior Engineer'), 
	('e0004',  'Technique Leader'), 
	('m0001',  'Manager');

--
-- Verify import
--
SELECT * FROM titles;

--
-- Continued...
--
CREATE TABLE employees (
	emp_no INT NOT NULL, 
	emp_title_id CHAR(5), 
	birth_date DATE, 
	first_name VARCHAR(20), 
	last_name VARCHAR(20), 
	sex CHAR(1), 
	hire_date DATE, 
	PRIMARY KEY (emp_no), 
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--
-- The employees CSV is way too long to write an INSERT so I used pgAdmin instead.
--
SELECT * FROM employees;

CREATE TABLE departments (
	dept_no CHAR(4) NOT NULL, 
	dept_name VARCHAR(20),
	PRIMARY KEY (dept_no)
);

INSERT INTO departments(dept_no,  dept_name) VALUES
	('d001',  'Marketing'), 
	('d002',  'Finance'), 
	('d003',  'Human Resources'), 
	('d004',  'Production'), 
	('d005',  'Development'), 
	('d006',  'Quality Management'), 
	('d007',  'Sales'), 
	('d008',  'Research'), 
	('d009',  'Customer Service');

SELECT * FROM departments;

CREATE TABLE dept_manager (
	dept_no CHAR(4), 
	emp_no INT, 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

INSERT INTO dept_manager(dept_no,  emp_no) VALUES
	('d001', '110022'),
	('d001', '110039'),
	('d002', '110085'),
	('d002', '110114'),
	('d003', '110183'),
	('d003', '110228'),
	('d004', '110303'),
	('d004', '110344'),
	('d004', '110386'),
	('d004', '110420'),
	('d005', '110511'),
	('d005', '110567'),
	('d006', '110725'),
	('d006', '110765'),
	('d006', '110800'),
	('d006', '110854'),
	('d007', '111035'),
	('d007', '111133'),
	('d008', '111400'),
	('d008', '111534'),
	('d009', '111692'),
	('d009', '111784'),
	('d009', '111877'),
	('d009', '111939');

SELECT * FROM dept_manager;

CREATE TABLE dept_emp (
	emp_no INT, 
	dept_no CHAR(4), 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no), 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--
-- Again, this CSV is way too long to write an INSERT so I used pgAdmin instead.
--
SELECT * FROM dept_emp;

CREATE TABLE salaries (
	emp_no INT, 
	salary DEC, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--
-- Again, this CSV is way too long to write an INSERT so I used pgAdmin instead.
--
SELECT * FROM salaries;