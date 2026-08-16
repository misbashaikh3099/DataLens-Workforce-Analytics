-- 1. Employees earning more than the overall average salary
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM DL_EMPLOYEES
);


-- 2. Employees earning the maximum salary
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE SALARY = (
    SELECT MAX(SALARY)
    FROM DL_EMPLOYEES
);


-- 3. Employees earning the minimum salary
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE SALARY = (
    SELECT MIN(SALARY)
    FROM DL_EMPLOYEES
);


-- 4. Employees earning more than their department average
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.LAST_NAME,
       E.DEPARTMENT_ID,
       E.SALARY
FROM DL_EMPLOYEES E
WHERE E.SALARY > (
    SELECT AVG(E2.SALARY)
    FROM DL_EMPLOYEES E2
    WHERE E2.DEPARTMENT_ID = E.DEPARTMENT_ID
);


-- 5. Employees working in the Information Technology department
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE DEPARTMENT_ID = (
    SELECT DEPARTMENT_ID
    FROM DL_DEPARTMENTS
    WHERE DEPARTMENT_NAME = 'Information Technology'
);


-- 6. Employees whose salary is greater than the salary of employee 1003
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE SALARY > (
    SELECT SALARY
    FROM DL_EMPLOYEES
    WHERE EMPLOYEE_ID = 1003
);


-- 7. Employees working in departments located in Pune
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       DEPARTMENT_ID
FROM DL_EMPLOYEES
WHERE DEPARTMENT_ID IN (
    SELECT D.DEPARTMENT_ID
    FROM DL_DEPARTMENTS D
    JOIN DL_LOCATIONS L
        ON D.LOCATION_ID = L.LOCATION_ID
    WHERE L.CITY = 'Pune'
);


-- 8. Employees who have a performance score above 80
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME
FROM DL_EMPLOYEES
WHERE EMPLOYEE_ID IN (
    SELECT EMPLOYEE_ID
    FROM DL_PERFORMANCE
    WHERE PERFORMANCE_SCORE > 80
);


-- 9. Employees who have salary history records
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME
FROM DL_EMPLOYEES E
WHERE EXISTS (
    SELECT 1
    FROM DL_SALARY_HISTORY S
    WHERE S.EMPLOYEE_ID = E.EMPLOYEE_ID
);


-- 10. Employees who do not have attendance records
SELECT E.EMPLOYEE_ID,
       E.FIRST_NAME,
       E.LAST_NAME
FROM DL_EMPLOYEES E
WHERE NOT EXISTS (
    SELECT 1
    FROM DL_ATTENDANCE A
    WHERE A.EMPLOYEE_ID = E.EMPLOYEE_ID
);


-- 11. Employees earning more than the average salary
-- using an inline view
SELECT EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM DL_EMPLOYEES
WHERE SALARY > (
    SELECT AVG_SALARY
    FROM (
        SELECT AVG(SALARY) AS AVG_SALARY
        FROM DL_EMPLOYEES
    )
);


-- 12. Departments having an employee earning more than 80000
SELECT D.DEPARTMENT_NAME
FROM DL_DEPARTMENTS D
WHERE D.DEPARTMENT_ID IN (
    SELECT E.DEPARTMENT_ID
    FROM DL_EMPLOYEES E
    WHERE E.SALARY > 80000
);
