# SQL-basics for Bioinformatics

**Authors:** Caterina Giachino & Gabriele Amato.
**Contact:** caterina.giachino@unina.it | amatogab@gmail.com

## Introduction to SQL:
Welcome! This repository is a starting point for anyone curious about how SQL can support bioinformatics research. Even if you've never written a line of SQL, don’t worry — we’ve got you covered!

**SQL (Structured Query Language)** is a powerful tool for data analysis, alongside **Python** and **R**. Each language has its unique strengths—while Python and R are widely used for data wrangling and statistical analysis, SQL excels at organizing and querying structured biological data.

---

## Why Use SQL?

### Key Features

* **Designed for Relational Databases**: SQL works with structured data organized in tables (logical model - relational tables).
* **Direct Queries**: Write commands to retrieve, filter, and summarize data efficiently.
* **Optimized Performance**: Handles large datasets with speed and precision.
* **Simple Syntax**: Easy to learn and use—even if you're not a programmer.

### What Is a Relational Database?

A **relational database**:
* Organizes data into **tables** (rows = records or tuples, columns = fields or attributes).
* Connects tables through **primary keys** and **foreign keys**.
* Enables complex data management and queries.

**Example**: A gene expression study may store patients, samples, and expression data in separate—but connected—tables.

---

**What You Will Learn with SQL**
By following these step-by-step instructions, you will:

- Install MySQL on macOS or Windows and verify if it's running;
- Access the MySQL shell via Terminal using the root user;
- Create and manage your own databases and tables;
- Insert, update, and delete data using SQL commands;
- Query your data using SELECT, JOINs, WHERE, GROUP BY, and HAVING clauses;
- Explore advanced SQL techniques, including:
  -> Aliases, Aggregate functions, and CASE WHEN logic.
  -> INNER / LEFT / FULL OUTER JOINs.
  -> Views, Constraints (CHECK), and scalar functions.
- Practice real-life examples using patients and samples datasets;
- Understand how SQL handles NULL values, conditions, and projection;
- Simulate advanced concepts like distributed selection, idempotent projections, and temporal queries.

---

**Final Objective:** 
Prepare a well-structured relational schema, ready to be physically implemented in a DBMS (ensuring efficiency, consistency and data integrity) and normalize information (eliminate redundancies, avoid anomalies and improve maintainability/consistency of data).

Ready to try it yourself? Explore our .sql scripts and start querying your own data!
