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

-- 6. Average salary per department
SELECT d.dept_name, ROUND(AVG(s.amount), 2) AS avg_salary
FROM departments d
JOIN employees e ON d.dept_id = e.dept_id
JOIN salaries s ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

-- 7. Rank employees by salary using window function
SELECT e.name, s.amount,
RANK() OVER (ORDER BY s.amount DESC) AS salary_rank
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id;

-- 8. CTE - employees earning above average salary
WITH avg_sal AS (
    SELECT AVG(amount) AS avg_amount FROM salaries
)
SELECT e.name, s.amount
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.amount > (SELECT avg_amount FROM avg_sal);

-- 9. View - employee full details
CREATE VIEW employee_details AS
SELECT e.emp_id, e.name, e.email, d.dept_name, s.amount, e.hire_date
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id;

-- 10. Index on email for faster lookups
CREATE INDEX idx_employee_email ON employees(email);

-- 11. Stored procedure - give salary raise to all employees in a department
CREATE OR REPLACE PROCEDURE give_raise(dept_name_input VARCHAR, raise_percent NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE salaries
    SET amount = amount + (amount * raise_percent / 100)
    WHERE emp_id IN (
        SELECT e.emp_id
        FROM employees e
        JOIN departments d ON e.dept_id = d.dept_id
        WHERE d.dept_name = dept_name_input
    );
END;
$$;