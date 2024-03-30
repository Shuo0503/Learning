CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    major VARCHAR(20) DEFAULT 'undecided'
);

DESCRIBE student;

DROP TABLE student;

ALTER TABLE student ADD gpa DECIMAL(3, 2)

ALTER TABLE STUDENT DROP COLUMN gpa

SELECT * FROM student;

INSERT INTO student VALUES(1, 'Jack', 'Biology');
INSERT INTO student VALUES(2, 'Kate', 'Sociology');
INSERT INTO student VALUES(3, 'Claire', 'Chemistry');
INSERT INTO student VALUES(4, 'Jack', 'Biology');
INSERT INTO student VALUES(5, 'Mike', 'Biology');

UPDATE student
SET name = "Claire"
WHERE student_id = "3";

UPDATE student
SET name = 'JACK'
WHERE student_id = 4;

UPDATE student
SET major = 'Computer Science'
WHERE name = 'Mike';

UPDATE student
SET major = 'Bio'
WHERE major = 'Biology';

DELETE FROM student
WHERE student_id = 5;

DELETE FROM student
WHERE name = 'JACK' AND student_id = 4

DELETE FROM student

SELECT student.name, student.major
FROM student
ORDER BY student_id DESC;

SELECT *
FROM student
ORDER BY major, student_id;

SELECT *
FROM student
ORDER BY major, student_id
LIMIT 2;

SELECT *
FROM student
WHERE major = 'Biology' OR name = 'Kate';

-- <, >, <=, >=, <>, AND, OR

SELECT *
FROM student
WHERE name IN ('Claire', 'Kate', 'Mike');


-- COMPANY DATABASE
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);


CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY (branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE work_with (
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

--INSERT INFO
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

INSERT INTO employee VALUES(102, 'Michael', 'ScOTT', '1964-03-15', 'M', 75000, 100, NULL);
INSERT INTO branch VALUES(2, 'Scronton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

UPDATE employee
SET last_name = 'Scott'
WHERE emp_id = 102;

INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);
INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

INSERT INTO work_with VALUES(105, 400, 55000);
INSERT INTO work_with VALUES(102, 401, 267000);
INSERT INTO work_with VALUES(108, 402, 22500);
INSERT INTO work_with VALUES(107, 403, 5000);
INSERT INTO work_with VALUES(108, 403, 12000);
INSERT INTO work_with VALUES(105, 404, 33000);
INSERT INTO work_with VALUES(107, 405, 26000);
INSERT INTO work_with VALUES(102, 406, 15000);
INSERT INTO work_with VALUES(105, 406, 130000);


--QUERY
SELECT * 
FROM employee;

SELECT * 
FROM client;

SELECT *
FROM employee
ORDER BY salary DESC;

SELECT *
FROM employee
ORDER BY sex, first_name, last_name;

SELECT *
FROM employee
LIMIT 5;

SELECT first_name, last_name
FROM employee;

SELECT first_name AS forename, last_name AS surname
FROM employee;

SELECT DISTINCT sex
FROM employee;

SELECT DISTINCT branch_id
FROM employee;

-- FUNCTIONS
SELECT COUNT(emp_id)
FROM employee;

SELECT COUNT(super_id)
FROM employee;

SELECT COUNT(emp_id)
FROM employee
WHERE sex = 'F' AND birth_day > '1971-01-01';

SELECT AVG(salary)
FROM employee;

SELECT AVG(salary)
FROM employee
WHERE sex = 'M';

SELECT SUM(salary)
FROM employee;

SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

SELECT SUM(total_sales), client_id
FROM work_with
GROUP BY client_id;

--WILDCARD
SELECT *
FROM client
WHERE client_name LIKE '%LLC'

SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '%Label%'

SELECT *
FROM employee
WHERE birth_day LIKE '____-10%'

SELECT *
FROM client
WHERE client_name LIKE '%school%'

--UNION (same number of column, similar datatype)
SELECT first_name
FROM employee
UNION
SELECT branch_name
FROM branch;

SELECT client_name
FROM client
UNION
SELECT supplier_name
FROM branch_supplier;

SELECT client_name, branch_id
FROM client
UNION
SELECT supplier_name, branch_id
FROM branch_supplier;
--OR MAKE IT MORE CLEAR
SELECT client_name, client.branch_id
FROM client
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;

SELECT salary
FROM employee
UNION
SELECT total_sales
FROM work_with;

--JOIN
INSERT INTO branch VALUES(4, 'Baffalo', NULL, NULL);

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id

--left join, all rows from the left table are included, only the match rows from right table are included
--right join, all rows from right table are included

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id

--NESTED QUERY
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
    SELECT work_with.emp_id
    FROM work_with
    WHERE work_with.total_sales > 30000
);

SELECT client.client_name
FROM client
WHERE client.branch_id = (
    SELECT branch.branch_id
    FROM branch
    WHERE branch.mgr_id = 102
    LIMIT 1 
);

-- ON DELETE(SET NULL/ CASCADE)
-- if on delete set null, then when one element is deleted, 
-- the other elements using the deleted element as foreign key will set to NULL
-- if on delete cascade, the row that using deleted element as foreign key will get deleted
-- if only as foreign key, element can be set null, if as primary key, then can only cascade


--TRIGGER
--need to be set in MySQL command line client
--need to change delimiter to '$$' since need to use ';' in the setting
--before/ after insert/ delete/ update

DELIMITER $$
CREATE 
    TRIGGER my_trigger BEFORE INSERT ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUE('NEW.first_name');
    END$$
DELIMITER ;

DELIMITER $$
CREATE 
    TRIGGER my_trigger BEFORE INSERT ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUE('added male employee');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUE('added female employee');
        ELSE
            INSERT INTO trigger_test VALUE('added another employee');
        END IF;
    END$$
DELIMITER ;

DROP TRIGGER my_trigger; -- in MySQL terminal

--ER diagrams
--entity: an object we want to model and store info about (square with a name on it)
--attributes: specific information about entity(ovals with name connect to entity)
--primary key: uniquely identify an entry(underline)
--composite attribute: one attribute can be break up into sub-attributes
--multi-valued attribute: (two circles)
--derived attribute: (oval with dashed lines)
--relationship: defines relationship between two entities(diamond, verb)
--total participation: all members must participate(double line)
--relationship attribute: store on relationship
--relationship cardinality: number of instances can be associated with the relation(1:1, 1:N, N:M)
--weak entity: an entity cannot be uniquely indentified by its attributes alone(double line square)
--identifying relationship: serves to uniquely identify the weak entity(double line diamond)
--weak entity must habe total participation