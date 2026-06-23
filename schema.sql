CREATE DATABASE empdb;

\c empdb

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dept_id INT REFERENCES departments(dept_id),
    hire_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE salaries (
    sal_id SERIAL PRIMARY KEY,
    emp_id INT REFERENCES employees(emp_id),
    amount NUMERIC(10,2) NOT NULL,
    effective_date DATE DEFAULT CURRENT_DATE
);