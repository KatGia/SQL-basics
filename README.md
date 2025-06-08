# SQL Basics For Bioinformatics

**Authors:** Caterina Giachino & Gabriele Amato.
**Contact:** caterina.giachino@unina.it | amatogab@gmail.com

## Introduction To SQL:
Welcome! This repository is a starting point for anyone curious about how SQL can support bioinformatics research. Even if you've never written a line of SQL, don’t worry — we’ve got you covered!

---

### What Is A Relational Database?

A **relational database**:
* Organizes data into **tables** (rows = records or tuples, columns = fields or attributes).
* Connects tables through **primary keys** and **foreign keys**.
* Enables complex data management and queries.

**Example**: A gene expression study may store patients, samples, and expression data in separate—but connected—tables.

---

**What You Will Learn With SQL**
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
