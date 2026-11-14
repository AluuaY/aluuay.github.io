-- 1. Сотрудники с зарплатой больше 500 000 (WHERE)
SELECT name, position, salary FROM employees WHERE salary > 500000;
-- 2. Все сотрудники по дате приёма, от новых к старым (ORDER BY)
SELECT name, hired FROM employees ORDER BY hired DESC;
-- 3. Три сотрудника с самой высокой зарплатой (ORDER BY + LIMIT)
SELECT name, salary FROM employees ORDER BY salary DESC LIMIT 3;
-- 4. Сколько всего сотрудников (COUNT)
SELECT COUNT(*) FROM employees;
-- 5. Средняя зарплата (AVG)
SELECT AVG(salary) FROM employees;
-- 6. Сколько сотрудников на каждой должности (GROUP BY)
SELECT position, COUNT(*) FROM employees GROUP BY position;
-- 7. Имя сотрудника, его должность и название отдела (JOIN)
SELECT employees.name, employees.position, departments.name FROM employees JOIN departments ON employees.department_id = departments.id;
-- 8. Сколько сотрудников в каждом отделе (JOIN + GROUP BY)
SELECT departments.name, COUNT(*) FROM employees JOIN departments ON employees.department_id = departments.id GROUP BY departments.name;
