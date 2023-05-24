DROP DATABASE IF EXISTS employee_db;
CREATE DATABASE employee_db;

USE employee_db;
Drop TABLE IF EXISTS employee_names;

CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE role (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL,
  department_id INT,
  INDEX department_index (department_id),
  CONSTRAINT fk_role_department FOREIGN KEY (department_id) REFERENCES department(id) 
	ON DELETE CASCADE
);

CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT,
  manager_id INT ,
    CONSTRAINT fk_employee_role FOREIGN KEY (role_id) REFERENCES role(id) 
	ON DELETE CASCADE,
    CONSTRAINT fk_manager_employee FOREIGN KEY (manager_id) REFERENCES employee(id) 
);
