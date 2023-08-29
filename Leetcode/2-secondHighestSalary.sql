# Write your MySQL query statement below
SELECT IFNULL(
    (SELECT DISTINCT Salary
    FROM Employee
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 1),
    NULL
) AS 'SecondHighestSalary' # IF NOT NULL, RETURN FIRST ARGUMENT, ELSE SECOND

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee)