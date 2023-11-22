CREATE TABLE Departments(
		dept_num Varchar(50),
		dept_name Varchar(50)
);

ALTER TABLE Departments
ADD PRIMARY KEY (dept_num);

SELECT * FROM Departments


--------
CREATE TABLE Dept_Emplo
(
		emplo_num Varchar(255),
		dept_num Varchar(50)
);

SELECT * FROM Dept_Emplo
-------
CREATE TABLE Dept_Manager(
		dept_num Varchar(50),
		emplo_num Varchar(255)
);

SELECT * FROM Dept_Manager
------
CREATE TABLE Employees(
		emplo_num Varchar(255),
		emplo_title Varchar(50),
		birth_date Varchar(50),
		first_name Varchar(50),
		last_name Varchar(50),
		sex Varchar(5),
		hire_date Varchar(50)
);

ALTER TABLE Employees
ADD PRIMARY KEY (emplo_num);

SELECT * FROM Employees
------------
CREATE TABLE Salaries(
		emplo_num Varchar(255),
		salary Varchar(255)
);

SELECT * FROM Salaries
-------------------------
CREATE TABLE Titles(
		title_id Varchar(50),
		title Varchar(255)
);
SELECT * FROM Titles
-------------------------------------------------
--List the employee number, last name, first name, sex, and salary of each employee.

SELECT E.emplo_num, E.last_name, E.first_name, E.sex, S.salary
FROM Employees E
JOIN Salaries S ON E.emplo_num = S.emplo_num;
-------------------------------------------------
--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = 1986;
------------------------
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
    dm.dept_num AS "Dept Num",
    d.dept_name AS "Dept Name",
    e.emplo_num AS "Emp Num",
    e.last_name AS "Last Name",
    e.first_name AS "First Name"
FROM 
    Dept_Manager dm, Departments d, Employees e
WHERE 
    dm.dept_num = d.dept_num AND dm.emplo_num = e.emplo_num;
-------------------------------------------
----List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
    de.dept_num AS "Department Number",
    e.emplo_num AS "Employee Number",
    e.last_name AS "Last Name",
    e.first_name AS "First Name",
    d.dept_name AS "Department Name"
FROM 
    Dept_Emplo de
JOIN 
    Employees e ON de.emplo_num = e.emplo_num
JOIN 
    Departments d ON de.dept_num = d.dept_num;
---------------------------------------------------------------
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
---------------------------------------------------------
