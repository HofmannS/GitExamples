CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees(
    id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	position VARCHAR(50) NOT NULL,
	salary DECIMAL(10,2) CHECK(salary > 0),
	hire_date VARCHAR(10) NOT NULL 
);

ALTER TABLE employees
ADD COLUMN email VARCHAR(128) UNIQUE;

ALTER TABLE employees
DROP COLUMN hire_date;

ALTER TABLE employees
RENAME COLUMN position TO job_title;

ALTER TABLE employees
MODIFY salary INTEGER;

ALTER TABLE employees
ADD COLUMN department VARCHAR(128) NOT NULL AFTER job_title;

insert into employees(name, job_title, department, salary, email) VALUES ("Анна Иванова", "Менеджер", "Отдел продаж", 60000, "anna.ivanova@example.ru");
insert into employees(name, job_title, department, salary, email) VALUES ("Иван Смирнов", "Разработчик", "IT", 75000, "ivan.smirnov@example.com");
insert into employees(name, job_title, department, salary, email) VALUES ("Мария Петрова", "Бухгалтер", "Финансы", 50000, "maria.petrova@example.com");
insert into employees(name, job_title, department, salary, email) VALUES ("Петр Васильев", "Разработчик", "IT", 80000, "petr.vasiliev@example.ru");
insert into employees(name, job_title, department, salary, email) VALUES ("Екатерина Соколова", "HR-специалист", "HR", 55000, "ekaterina.sokolova@example.com");
insert into employees(name, job_title, department, salary, email) VALUES ("Алексей Кузнецов", "Менеджер по продажам", "Отдел продаж", 65000, "alexey.kuznetsov@example.ge");
insert into employees(name, job_title, department, salary, email) VALUES ("Ольга Морозова", "Аналитик", "Финансы", 70000, "olga.morozova@example.com");

SELECT * 
FROM employees
WHERE department = 'IT' OR department = "Финансы";

SELECT * 
FROM employees
WHERE name like '% С%';

SELECT * 
FROM employees
WHERE email like '%@example.com';

SELECT * 
FROM employees
WHERE salary between 60000 and 75000;

SELECT * 
FROM employees
WHERE job_title LIKE '%Менеджер%';

SELECT * 
FROM employees
WHERE department != "HR";

SELECT * 
FROM employees
WHERE salary >= 70000 and department = "Финансы";

SELECT * 
FROM employees
WHERE email like '%.ru' or email like '%.ge';

SELECT * 
FROM employees
WHERE name like '% %ов%' OR name like '% %ев%';

SELECT * 
FROM employees
WHERE salary < 55000 AND department != "IT";

SELECT * 
FROM employees
ORDER BY name;

SELECT * 
FROM employees
ORDER BY salary DESC;

SELECT * 
FROM employees
WHERE department = "IT" OR department = "Финансы"
ORDER BY salary DESC;

SELECT * 
FROM employees
WHERE salary > 60000
ORDER BY substring_index(name, ' ', -1) asc; // Это решение мне подсказали

SELECT DISTINCT department
FROM employees
WHERE name LIKE '%';


SELECT DISTINCT job_title
FROM employees;

DROP TABLE employees
