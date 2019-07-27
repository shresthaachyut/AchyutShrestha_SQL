DROP TABLE Titles;
DROP TABLE Salaries;
DROP TABLE Dept_Emp;
DROP TABLE Dept_Manager;
DROP TABLE Department;
DROP TABLE Employees;

-- Create table for department. Grain is Department ID
CREATE TABLE Department (
dept_no varchar(4) PRIMARY KEY,
depart_name varchar(255) not null
);

-- Create table for employees. Grain is Employee ID
CREATE TABLE Employees (
emp_no INT PRIMARY KEY NOT NULL,
birth_date Date,
first_name VARCHAR(255),
last_name VARCHAR(255),
gender CHAR(1),
hire_date DATE
);

-- Create table for titles. 
CREATE TABLE Titles (
emp_no INT,
title VARCHAR(255),
from_date date,
to_date date,
FOREIGN KEY (emp_no) REFERENCES EMPLOYEES(emp_no)
);

-- Create table for Salaries
CREATE TABLE Salaries (
emp_no INT,
salary INT,
from_date date,
to_date date,
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Create table for Department Employees
CREATE TABLE Dept_Emp (
emp_no int,
dept_no varchar(4),
from_date date,
to_date date,
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES Department(dept_no)
);

-- Create table for Department Manager
CREATE TABLE Dept_Manager (
dept_no varchar(4),
emp_no int,
from_date date,
to_date date,
FOREIGN  KEY (dept_no) REFERENCES Department(dept_no),
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

select * from dept_manager;