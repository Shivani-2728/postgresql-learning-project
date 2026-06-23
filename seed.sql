\c empdb

INSERT INTO departments (dept_name) VALUES
('Engineering'),
('HR'),
('Finance'),
('Marketing');

INSERT INTO employees (name, email, dept_id, hire_date) VALUES
('Ayesha Khan', 'ayesha@company.com', 1, '2022-01-15'),
('Rohan Mehta', 'rohan@company.com', 2, '2021-06-10'),
('Priya Sharma', 'priya@company.com', 1, '2023-03-20'),
('Amit Verma', 'amit@company.com', 3, '2020-11-05'),
('Sneha Patil', 'sneha@company.com', 4, '2022-08-30');

INSERT INTO salaries (emp_id, amount, effective_date) VALUES
(1, 85000, '2022-01-15'),
(2, 60000, '2021-06-10'),
(3, 90000, '2023-03-20'),
(4, 75000, '2020-11-05'),
(5, 65000, '2022-08-30');