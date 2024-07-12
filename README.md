
# Analysis Project

## Overview

Welcome to the Pewlett Hackard Analysis Project. This project involves designing a database to hold historical employee data, importing the data from CSV files into a SQL database, and performing various analyses on the data. The project is divided into three main parts: data modeling, data engineering, and data analysis.

## Project Structure

The project repository contains the following files and directories:

- `schema.sql`: SQL script for creating the database schema.
- `queries.sql`: SQL script containing the queries for data analysis.
- `EmployeeSQL`: Directory containing the project files.
  - `departments.csv`: CSV file containing department data.
  - `dept_emp.csv`: CSV file containing department-employee relationships.
  - `dept_manager.csv`: CSV file containing department-manager relationships.
  - `employees.csv`: CSV file containing employee data.
  - `salaries.csv`: CSV file containing salary data.
  - `titles.csv`: CSV file containing title data.

## Data Modeling

The Entity Relationship Diagram (ERD) for this project is designed based on the CSV files provided. The relationships between the tables are as follows:

- `departments`: Contains department numbers and names.
- `employees`: Contains employee details including employee number, title ID, birth date, first name, last name, sex, and hire date.
- `dept_emp`: Links employees to departments.
- `dept_manager`: Links managers to departments.
- `salaries`: Contains salary information for each employee.
- `titles`: Contains title IDs and titles.

## Data Engineering

### Creating the Database Schema

The `schema.sql` file contains the SQL commands to create the tables in the database. Below is a brief description of the tables:

- **departments**
  ```sql
  CREATE TABLE departments (
      dept_no CHAR(4) PRIMARY KEY,
      dept_name VARCHAR(40) NOT NULL
  );
  ```

- **employees**
  ```sql
  CREATE TABLE employees (
      emp_no INT PRIMARY KEY,
      emp_title_id CHAR(5),
      birth_date DATE,
      first_name VARCHAR(50),
      last_name VARCHAR(50),
      sex CHAR(1),
      hire_date DATE
  );
  ```

- **dept_emp**
  ```sql
  CREATE TABLE dept_emp (
      emp_no INT,
      dept_no CHAR(4),
      PRIMARY KEY (emp_no, dept_no),
      FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
      FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
  );
  ```

- **dept_manager**
  ```sql
  CREATE TABLE dept_manager (
      dept_no CHAR(4),
      emp_no INT,
      PRIMARY KEY (dept_no, emp_no),
      FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
      FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
  );
  ```

- **salaries**
  ```sql
  CREATE TABLE salaries (
      emp_no INT,
      salary INT,
      PRIMARY KEY (emp_no, salary),
      FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
  );
  ```

- **titles**
  ```sql
  CREATE TABLE titles (
      title_id CHAR(5) PRIMARY KEY,
      title VARCHAR(50)
  );
  ```

### Importing Data

To import data from the CSV files into the SQL tables, use the following SQL commands (adjust the file paths as necessary):

```sql
LOAD DATA INFILE 'path_to_csv/departments.csv'
INTO TABLE departments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'path_to_csv/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'path_to_csv/dept_emp.csv'
INTO TABLE dept_emp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'path_to_csv/dept_manager.csv'
INTO TABLE dept_manager
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'path_to_csv/salaries.csv'
INTO TABLE salaries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'path_to_csv/titles.csv'
INTO TABLE titles
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

## Data Analysis

The `queries.sql` file contains the SQL queries to perform the required data analysis. The queries include:

1. List the employee number, last name, first name, sex, and salary of each employee.
2. List the first name, last name, and hire date for the employees who were hired in 1986.
3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
6. List each employee in the Sales department, including their employee number, last name, and first name.
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

## Instructions for Running the Scripts

1. Clone the repository to your local machine.
2. Navigate to the `EmployeeSQL` directory.
3. Create the database and tables using the `schema.sql` script.
4. Import the data from the CSV files into the respective tables.
5. Run the queries in the `queries.sql` file to perform the data analysis.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Contact

If you have any questions or feedback, please feel free to reach out @ Luis.Llamas@maslla.com

---

Thank you for using this repository. Happy coding!
