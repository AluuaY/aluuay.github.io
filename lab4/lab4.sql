-- Лабораторная работа 4. База отдела кадров вымышленной юрфирмы.
-- Рецепт: можно запускать сколько угодно раз, каждый раз база собирается заново.

-- Сначала удаляем employees (она ссылается на departments), потом departments.
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Таблица отделов
CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    floor INTEGER
) STRICT;

-- Таблица сотрудников, department_id ссылается на id отдела
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT NOT NULL,
    salary INTEGER,
    hired TEXT,
    department_id INTEGER REFERENCES departments(id)
) STRICT;

-- Отделы (получат id 1, 2, 3, 4 по порядку)
INSERT INTO departments (name, floor) VALUES
    ('Корпоративная практика', 3),
    ('Судебная практика', 4),
    ('Налоговая практика', 5),
    ('Отдел кадров', 2);

-- Сотрудники (все вымышленные, получат id 1..10 по порядку)
INSERT INTO employees (name, position, salary, hired, department_id) VALUES
    ('Айгерим Нурланова', 'Старший юрист', 850000, '2019-03-11', 1),
    ('Даниял Ахметов', 'Юрист', 520000, '2022-09-01', 1),
    ('Мария Ким', 'Помощник юриста', 320000, '2024-02-12', 1),
    ('Ерлан Жумабаев', 'Партнёр', 1500000, '2015-06-15', 2),
    ('Камила Оспанова', 'Юрист', 560000, '2021-11-22', 2),
    ('Тимур Беков', 'Помощник юриста', 300000, '2025-01-20', 2),
    ('Алина Сергеева', 'Налоговый консультант', 700000, '2020-04-06', 3),
    ('Арман Касымов', 'Юрист', 500000, '2023-07-03', 3),
    ('Дана Ибраева', 'HR-менеджер', 450000, '2021-02-01', 4),
    ('Руслан Петров', 'Стажёр', 150000, '2025-09-01', 4);

-- Повышение: Марии Ким (id 3) прибавляем 50 000 к зарплате
UPDATE employees SET salary = salary + 50000 WHERE id = 3;

-- Увольнение: стажёр Руслан Петров (id 10) ушёл из фирмы
DELETE FROM employees WHERE id = 10;
