--Q1. List the employee ID, full name, and job title of all employees.

Select employee_id, full_name, job_titles
FROM employees;


--Q2. Count the number of employees in each job title. Show only job titles that have more
--than 3 employees.

SELECT job_titles, COUNT(employee_id)
FROM employees
GROUP BY job_titles
HAVING COUNT(employee_id) > 3;


--Q3. List the distinct locations (city and country) where the company has departments.

SELECT DISTINCT city, country
FROM employees;


--Q4. Find all employees who earn between $3000 and $7000 per month. Include the
--employee ID, full name, and salary, sorted by salary in descending order.

SELECT employee_id, full_name, salary
FROM employees
WHERE salary >= 3000 AND salary <= 7000
ORDER BY salary DESC;


--Q5. Find the highest salary in the company, along with the name of the employee who
--earns it.

SELECT full_name, salary
FROM (
    SELECT full_name, salary
    FROM employees
    ORDER BY salary DESC
)
WHERE ROWNUM <= 1;


-- Alternate method:

SELECT full_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


--Q6. Find the most recent (latest) hire date in the company. Just show the date.

SELECT hire_date
FROM employees
WHERE hire_date = (
    SELECT MAX(hire_date)
    FROM employees
);


--Q7. List all employees who were hired before January 1, 2005. Include the employee ID,
--full name, and hire date.

SELECT employee_id, full_name, hire_date
FROM employees
WHERE hire_date < '1-jan-2005';


-- Q8. Calculate the total salary paid in each department. Include the department name
--and the total.

SELECT department, SUM(salary)
FROM employees
GROUP BY department;


--Q9. List the names of all departments that currently have no employees.

SELECT d.department_name
FROM departments
LEFT JOIN employees e ON e.department_id = d.department_id
WHERE employee_id = NULL;


--Q10. Find all employees whose job title is 'Programmer' or 'Accountant'. Include the
--employee ID, full name, and job title.

SELECT e.employee_id, e.full_name, d.job_title
FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id
WHERE d.job_title = 'Programmer' OR d.job_title = 'Accountant';
