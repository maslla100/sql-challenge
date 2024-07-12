CREATE TABLE
    departments (
        dept_no CHAR(4) PRIMARY KEY,
        dept_name VARCHAR(40) NOT NULL
    );

CREATE TABLE
    employees (
        emp_no INT PRIMARY KEY,
        emp_title_id CHAR(5),
        birth_date DATE,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        sex CHAR(1),
        hire_date DATE
    );

CREATE TABLE
    dept_emp (
        emp_no INT,
        dept_no CHAR(4),
        PRIMARY KEY (emp_no, dept_no),
        FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
        FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
    );

CREATE TABLE
    dept_manager (
        dept_no CHAR(4),
        emp_no INT,
        PRIMARY KEY (dept_no, emp_no),
        FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
        FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
    );

CREATE TABLE
    salaries (
        emp_no INT,
        salary INT,
        PRIMARY KEY (emp_no, salary),
        FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
    );

CREATE TABLE
    titles (title_id CHAR(5) PRIMARY KEY, title VARCHAR(50));