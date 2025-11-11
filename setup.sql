CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- 部署表
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 社員表
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender ENUM('男', '女' ) NOT NULL,
    birth_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- サンプルデータ（部署）
INSERT INTO departments (department_id, department_name) VALUES 
    (001, '総務部'),
    (002, '経理部'),
    (003, '営業部');
  
-- サンプルデータ（社員）
INSERT INTO employees (employee_id, name, gender, birth_date, salary, department_id) VALUES 
    (0001, '佐藤一郎', '男', '1951-01-01', 450000, 002),
    (0002, '鈴木二郎', '男', '1962-02-02', 400000, 003),
    (0003, '高橋花子', '女', '1973-03-03', 350000, 001),
    (0004, '田中四郎', '男', '1984-04-04', 300000, 001),
    (0005, '渡辺良子', '女', '1995-05-05', 250000, 003);
