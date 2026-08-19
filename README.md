# SQL Coursework & Homework Assignments

![SQL](https://img.shields.io/badge/Language-SQL-003B57?style=for-the-badge&logo=postgresql&logoColor=white)
![Database](https://img.shields.io/badge/Database-Relational_DB-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

A structured collection of SQL scripts, homework assignments, schema definitions, and practice queries covering relational database design, data manipulation (DML), data definition (DDL), complex joins, subqueries, aggregations, and data analysis tasks

---

## Repository Structure

The coursework is organized into progressive homework modules and dataset schemas[cite: 6]:

```text
SQL/
├── HW 1/                  # Homework 1: Core Fundamentals & Initial Schemas
│   ├── college.sql        # Database schema/seed for university entities
│   ├── olympics.sql       # Database schema/seed for Olympic Games data
│   ├── osman.sql          # Sample database schema / custom dataset
│   ├── HW1 A.sql          # Assignment 1 - Part A queries
│   ├── HW1 B.sql          # Assignment 1 - Part B queries
│   ├── HW1 C.sql          # Assignment 1 - Part C queries
│   └── HW1 D.sql          # Assignment 1 - Part D queries
│
├── HW 2/                  # Homework 2: Intermediate Data Manipulation & Joins
│   ├── HW2 A.sql          # Assignment 2 - Part A queries
│   ├── HW2 B.sql          # Assignment 2 - Part B queries
│   └── HW2 C.sql          # Assignment 2 - Part C queries
│
├── HW 3/                  # Homework 3: Advanced Aggregations & Subqueries
│   ├── HW3 A.sql          # Assignment 3 - Part A queries
│   └── HW3 B.sql          # Assignment 3 - Part B queries
│
├── HW 4/                  # Homework 4: Complex Data Analysis & Optimization
│   ├── HW4 A.sql          # Assignment 4 - Part A queries
│   ├── HW4 B.sql          # Assignment 4 - Part B queries
│   └── HW4 C.sql          # Assignment 4 - Part C queries
│
└── Practice.sql           # Miscellaneous practice queries & scratchpad workspace

```

---

## Topics & Key Concepts Covered

* **Data Definition Language (DDL):** `CREATE TABLE`, `ALTER TABLE`, primary/foreign key constraints, and schema design.


* **Data Manipulation Language (DML):** `INSERT`, `UPDATE`, `DELETE`, and basic data extraction using `SELECT`.


* **Data Aggregation & Grouping:** Multi-level aggregations using `GROUP BY`, `HAVING`, `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`.
* **Relational Joins:** Combining dataset entities using `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and self-joins across relational tables.


* **Advanced Querying:** Correlated and uncorrelated subqueries, CTEs (Common Table Expressions), conditional statements (`CASE WHEN`), and filtering logic.

---

## Sample Database Schemas

* **`college.sql`:** University relational dataset managing students, courses, enrollments, and academic performance metrics.


* **`olympics.sql`:** Historical Olympics dataset tracking athletes, countries, sporting events, and medal tallies.


* **`osman.sql`:** Custom relational dataset for targeted query exercises.



---

## Getting Started

### Prerequisites

An installed Relational Database Management System (RDBMS) such as:

* [suspicious link removed] / MySQL Workbench
* [PostgreSQL](https://www.postgresql.org/) / pgAdmin
* [SQLite](https://www.sqlite.org/) or VS Code SQL extension

### Execution Steps

1. **Clone the repository:**
```bash
git clone [https://github.com/your-username/SQL-Coursework.git](https://github.com/your-username/SQL-Coursework.git)
cd SQL-Coursework

```


2. **Load a database schema:**
Open your database CLI or IDE and run the setup file (e.g., loading the `college` database):


```bash
mysql -u root -p < "HW 1/college.sql"

```


3. **Execute assignment scripts:**
Run the corresponding assignment query script against the loaded schema:


```bash
mysql -u root -p college < "HW 1/HW1 A.sql"

```



---

## License

This repository is maintained for educational and reference purposes.

```

```
