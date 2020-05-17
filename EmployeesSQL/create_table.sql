DROP TABLE departments CASCADE; 
DROP TABLE dept_emp CASCADE; 
DROP TABLE dept_manager CASCADE;
DROP TABLE employees CASCADE; 
DROP TABLE salaries CASCADE; 
DROP TABLE titles CASCADE; 
CREATE TABLE departments( 
	dept_no VARCHAR(20) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
); 

CREATE TABLE dept_emp( 
	emp_no INT NOT NULL,
	dept_no VARCHAR(20) NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
); 

CREATE TABLE dept_manager(
	dept_no VARCHAR(20) NOT NULL, 
	emp_no INT NOT NULL,
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE employees( 
	emp_no INT NOT NULL, 
	birth_date DATE NOT NULL, 
	first_name VARCHAR(20) NOT NULL, 
	last_name VARCHAR(20) NOT NULL, 
	gender VARCHAR(10) NOT NULL, 
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
); 

CREATE TABLE salaries( 
	emp_no INT NOT NULL, 
	salary INT NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no), 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles( 
	emp_no INT NOT NULL, 
	title VARCHAR(20) NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,  
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
); 
select * from departments; 
select * from dept_emp; 
select * from dept_manager; 
select * from employees; 
select * from salaries; 
select * from titles; 
