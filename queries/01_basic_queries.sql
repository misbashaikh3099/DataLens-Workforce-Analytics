-- 1. Display all employees
SELECT *
FROM DL_EMPLOYEES;


-- 2. Display employee names and salaries
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES;


-- 3. Display employees earning more than 60000
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE SALARY > 60000;


-- 4. Display employees hired after 01-JAN-2023
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       HIRE_DATE
FROM DL_EMPLOYEES
WHERE HIRE_DATE > DATE '2023-01-01';


-- 5. Display employees whose salary is between 50000 and 80000
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE SALARY BETWEEN 50000 AND 80000;


-- 6. Display employees whose first name starts with A
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE FIRST_NAME LIKE 'A%';


-- 7. Display employees who are not receiving commission
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE COMMISSION_PCT IS NULL;


-- 8. Display the highest salary
SELECT MAX(SALARY) AS MAX_SALARY
FROM DL_EMPLOYEES;


-- 9. Display the lowest salary
SELECT MIN(SALARY) AS MIN_SALARY
FROM DL_EMPLOYEES;


-- 10. Display the average salary
SELECT ROUND(AVG(SALARY), 2) AS AVERAGE_SALARY
FROM DL_EMPLOYEES;


-- 11. Display the total salary paid to all employees
SELECT SUM(SALARY) AS TOTAL_SALARY
FROM DL_EMPLOYEES;


-- 12. Display the number of employees
SELECT COUNT(*) AS TOTAL_EMPLOYEES
FROM DL_EMPLOYEES;


-- 13. Display employees ordered by salary from highest to lowest
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
ORDER BY SALARY DESC;


-- 14. Display employees ordered by hire date
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       HIRE_DATE
FROM DL_EMPLOYEES
ORDER BY HIRE_DATE;


-- 15. Display employee details using the employee details view
SELECT *
FROM DL_EMPLOYEE_DETAILS;
