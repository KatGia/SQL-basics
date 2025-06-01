# SQL-basics for Bioinformatics

**Author**: Caterina Giachino  
**Contact**: caterina.giachino@unina.it

## Introduction: What Is SQL and Why Use It?

**SQL (Structured Query Language)** is a powerful tool for data analysis, alongside **Python** and **R**. Each language has its unique strengths, and the best choice depends on your project's requirements and your personal skills.

## SQL in Bioinformatics: A Practical Example

SQL databases in bioinformatics are used to manage:

- Genomic and proteomic sequences;
- Gene annotations;
- Protein interactions;
- Gene expression profiles.

They ensure structured access, efficient querying, and integration across diverse data types.


### Examples of SQL-based Databases in Bioinformatics:

- **Genomic Databases**: GenBank, NCBI, and Ensembl.
- **Gene Expression Repositories**: ArrayExpress and GEO.  
- **Protein Sequence Databases**: UniProt, Swiss-Prot, and PDB.  

---

## Why Use SQL?

### Key Features

* **Designed for Relational Databases**: SQL works with structured data organized in tables.
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

## What Can You Do with SQL?

With SQL, you can:

* **Manipulate Data**: Modify and aggregate data as needed.
  *Example: Filter gene counts to create a subset matching patients in a survival study.*

* **Query Data**: Search for specific information, including complex nested queries.

* **Define Database Structure**: Create tables and set relationships that reflect your data model.

* **Control Access**: Manage permissions to protect and share your data securely.

Note: Some operators apply only if the relationships have the same pattern (same attributes and domains), such as for union, difference, and intersection. Keep attention!

---

## Summary: When to Use Each Language

| Language   | Best Use Case                                                                             |
| ---------- | ----------------------------------------------------------------------------------------- |
| **SQL**    | Querying and managing structured data in relational databases (e.g., biomedical datasets) |
| **Python and R** | Data analysis and visualization, automation, machine learning, statistical modeling |

---

## What's Next?


Ready to try it yourself? You can start experimenting with SQL using:

- SQLite Online Editor;

- A local SQLite or MySQL installation;

- Integration with Python using sqlite3 and pandas;

- Integration with R using DBI or sqldf.

In the next sections, you'll find practical SQL examples to help you get started — including how to use SQL within **R** and **Python**.

---

## Example Schema (Simplified)
Note: This schema is simplified. Real-world bioinformatics databases often include ontologies (e.g., GO terms), sample metadata, experimental protocols, and controlled vocabularies.

```sql
CREATE TABLE Sequenze (
  sequence_id INT PRIMARY KEY AUTO_INCREMENT,
  sequence_name VARCHAR(255),
  sequence_type ENUM('DNA', 'RNA', 'PROTEIN'),
  sequence_data TEXT
);

CREATE TABLE Geni (
  gene_id INT PRIMARY KEY AUTO_INCREMENT,
  gene_name VARCHAR(255),
  chromosome VARCHAR(10),
  start_position INT,
  end_position INT,
  description TEXT,
  sequence_id INT,
  FOREIGN KEY (sequence_id) REFERENCES Sequenze(sequence_id)
);


