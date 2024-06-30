
create table COMPANY(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL DEFAULT '****'
);


create table DEPARTMENT(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    member_count INTEGER NOT NULL
);

CREATE TABLE EMPLOYEE(
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    salary DECIMAL(2,16) NOT NULL,
    birthdate DATE DEFAULT CURRENT_DATE,
    department_id INTEGER REFERENCES DEPARTMENT(id)
);

INSERT INTO COMPANY (name) VALUES ('MICROSOFT'),
                           ('BP'),
                           ('FACEBOOK'),
                           ('SOCAR'),
                           ('NETFLIX');

SELECT * FROM COMPANY;

INSERT INTO DEPARTMENT (NAME, MEMBER_COUNT) VALUES ('IT', 2000),
                                                   ('FINANCE',3000),
                                                   ('SECURITY',1500),
                                                   ('RISK', 1000);

SELECT * FROM DEPARTMENT;

ALTER TABLE EMPLOYEE ALTER COLUMN salary TYPE NUMERIC(16, 2);

INSERT INTO EMPLOYEE (full_name,salary,department_id) VALUES ('Murad Muradov', 10546.12, 1),
                                                             ('Vali Valizade', 12500, 4),
                                                             ('Elvin Ehmedov', 8700, 2),
                                                             ('Xanlar Babayev', 4700, 3),
                                                             ('Elbrus Hasanzade', 3700, 1),
                                                             ('Aygun Alkhasov', 2500, 2);

select * from EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE department_id = 1;

SELECT * FROM EMPLOYEE WHERE full_name LIKE '%ad_%';

SELECT * FROM EMPLOYEE WHERE department_id = 1 LIMIT 1;

SELECT DISTINCT department_id FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE department_id IN (1,2);
SELECT * FROM EMPLOYEE WHERE department_id BETWEEN 1 AND 3;

SELECT count(*), department_id FROM EMPLOYEE
                               GROUP BY department_id
                               order by department_id ASC;

CREATE SEQUENCE incId
increment 3
start 10;

select nextval('incId');

CREATE SEQUENCE onlyThree
INCREMENT -1
MINVALUE 1
MAXVALUE 3
CYCLE
START 3;

SELECT nextval('onlyThree');


SELECT d.id AS DEP_ID, name AS DEP_NAME, full_name, salary, birthdate FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E on D.id = E.department_id;

SELECT d.id AS DEP_ID, name AS DEP_NAME, full_name, salary, birthdate FROM DEPARTMENT D
RIGHT JOIN EMPLOYEE E on D.id = E.department_id;

SELECT E.id, E.salary, E.birthdate FROM EMPLOYEE E
INNER JOIN employee e2 on E.department_id = e2.department_id;

CREATE OR REPLACE VIEW dep_emp_join
    AS
SELECT D.id AS DEP_ID, name AS DEP_NAME, full_name, salary, birthdate FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E on D.id = E.department_id;

select * from dep_emp_join;

CREATE MATERIALIZED VIEW MAT_DEP_EMP_VIEW AS
    SELECT D.id AS DEP_ID, name AS DEP_NAME, full_name, salary, birthdate FROM DEPARTMENT D
LEFT JOIN EMPLOYEE E on D.id = E.department_id
WITH NO DATA ;


REFRESH MATERIALIZED VIEW MAT_DEP_EMP_VIEW;
SELECT * FROM MAT_DEP_EMP_VIEW;

select * from dep_emp_join;

DROP VIEW dep_emp_join;

INSERT INTO EMPLOYEE (FULL_NAME, SALARY, department_id) VALUES ('ALI ALIZADE', 1234, 4);

update employee set salary = 1200 where id = 4;
select * from employee where id = 4;
delete from employee where id = 4;

