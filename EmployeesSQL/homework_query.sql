--1. List the following details of each employee: employee number, 
--last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM salaries s
JOIN employees e 
ON s.emp_no = e.emp_no; 

--2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date >= '19860101' AND hire_date <= '19861231';

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, de.dept_name, d.emp_no, e.first_name, e.last_name, d.from_date, d.to_date
FROM dept_emp d 
JOIN departments de ON d.dept_no = de.dept_no
JOIN employees e ON e.emp_no = d.emp_no; 

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
CREATE VIEW dep_emp AS
SELECT de.dept_name, d.dept_no, d.emp_no, e.last_name, e.first_name 
FROM departments de 
JOIN dept_emp d ON de.dept_no = d.dept_no
JOIN employees e ON e.emp_no = d.emp_no; 

SELECT dept_name, emp_no, last_name, first_name FROM dep_emp; 

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; 

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW emp_sales AS
SELECT de.dept_name, d.dept_no, d.emp_no, e.last_name, e.first_name 
FROM departments de 
JOIN dept_emp d ON de.dept_no = d.dept_no
JOIN employees e ON e.emp_no = d.emp_no; 

SELECT * FROM emp_sales
WHERE dept_name = 'Sales'; 

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name FROM emp_sales
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees 
GROUP BY last_name
ORDER BY count DESC; 