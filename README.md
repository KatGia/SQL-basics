# SQL Basics For Bioinformatics

**Authors:** Caterina Giachino & Gabriele Amato.
**Contact:** caterina.giachino@unina.it | amatogab@gmail.com

---

## Introduction: What is SQL and why use It?

**SQL (Structured Query Language)** is a powerful tool for data analysis, alongside **Python** and **R**. Each language has its unique strengths, and the best choice depends on your project's requirements and your personal skills.

---

## SQL in bioinformatics: a practical example

SQL databases in bioinformatics are used to manage:

- Genomic and proteomic sequences;
- Gene annotations;
- Protein interactions;
- Gene expression profiles.

They ensure structured access, efficient querying, and integration across diverse data types.


### Examples of SQL-based databases in bioinformatics:

- **Genomic Databases**: GenBank, NCBI, and Ensembl.  
- **Gene Expression Repositories**: ArrayExpress and GEO.  
- **Protein Sequence Databases**: UniProt, Swiss-Prot, and PDB.  

### Another example of using SQL in bioinformatics: panCancer atlas bigQuery tables
The PanCancer Atlas project by the Institute for Systems Biology (ISB-CGC) provides an excellent example of how SQL databases can be used to explore large-scale cancer genomics data without downloading massive datasets.

**Key points:**

- The PanCancer Atlas data are hosted as BigQuery tables on Google Cloud Platform.

- These tables faithfully reproduce the original PanCancer Atlas datasets, integrating multiple data types such as DNA mutation status and RNA expression levels.

- By using SQL queries on these tables, researchers can easily explore and combine complex multi-omics data.

- This approach allows efficient and flexible data analysis, eliminating the need to download and manage large raw files locally.


---

## Why Use SQL?

* **Designed for Relational Databases**: SQL works with structured data organized in tables.
* **Direct Queries**: Write commands to retrieve, filter, and summarize data efficiently.
* **Optimized Performance**: Handles large datasets with speed and precision.
* **Simple Syntax**: Easy to learn and use—even if you're not a programmer.

---

## What Can You Do with SQL?

* **Manipulate Data**: Modify and aggregate data as needed.
  *Example: Filter gene counts to create a subset matching patients in a survival study.*

* **Query Data**: Search for specific information, including complex nested queries.

* **Define Database Structure**: Create tables and set relationships that reflect your data model.

* **Control Access**: Manage permissions to protect and share your data securely.

Note: Set operations like `UNION`, `INTERSECT`, and `EXCEPT` (or `MINUS`) require that both queries return the same number of columns with compatible data types. Be careful when using them!


---

## Summary: when to use each language

| Language   | Best use case                                                                             |
| ---------- | ----------------------------------------------------------------------------------------- |
| **SQL**    | Querying and managing structured data in relational databases (e.g., biomedical datasets) |
| **Python and R** | Data analysis and visualization, automation, machine learning, statistical modeling |

---

## What's next?

Ready to try it yourself? You can start experimenting with SQL using:

- SQLite Online Editor;

- A local installation of SQLite or MySQL *(see Instructions_to_install_MySQL_on_macOS.txt)*;

- Integration with Python using sqlite3 and pandas;

- Integration with R using DBI or sqldf.

In the next sections, you'll find practical SQL examples to help you get started — including how to use SQL within **R** and **Python**.

---

## Example schema (simplified)
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


