-- 1. All employees with their department name
SELECT e.name, e.email, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- 2. Employee salaries
SELECT e.name, s.amount
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
ORDER BY s.amount DESC;

-- 3. Highest paid employee
SELECT e.name, s.amount
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
ORDER BY s.amount DESC
LIMIT 1;

-- 4. Headcount per department
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 5. Employees hired after 2022
SELECT name, hire_date
FROM employees
WHERE hire_date > '2022-01-01';