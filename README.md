# SQL Basics For Bioinformatics

**Authors:** Caterina Giachino & Gabriele Amato.
**Contact:** caterina.giachino@unina.it | amatogab@gmail.com

---

# 🏗️ SQL, Database Infrastructure, and Data Access Models

SQL is a language designed to **manage databases**, but SQL alone is not enough to build a fully functional data system. Working with a real database requires two essential components:

---

## 1. 📖 **SQL Knowledge**

SQL provides the ability to:

* create tables and define relationships (schema design)
* insert, update, and delete data
* perform powerful queries on large datasets
* manage access control and user permissions
* optimize indexing and performance

In other words, **SQL is the logical tool** that allows you to operate on your data.

---

## 2. 🖥️ **Technical Infrastructure (Hardware + Software)**

A database also requires a **stable and available technical base**, such as:

* a physical or virtual server that is always running
* sufficient computing power
* adequate RAM and storage
* regular backups and monitoring
* strong security practices and controlled access
* a DBMS (Database Management System) such as MySQL, PostgreSQL, MariaDB, or SQL Server

This part represents a **financial investment**, especially for databases that must support high traffic or large amounts of data.

---

# 🔒 Private Databases vs 🌐 Public Databases

It is important to distinguish between **private** and **public** databases, as they differ in infrastructure, access, and purpose.

---

## 🔒 **Private Database**

* Hosted on a local machine or a private server.
* Only the creator (or a restricted group) can access it.
* Suitable for internal projects, sensitive data, and development.
* Not accessible from the internet.
* Access occurs through local clients (e.g., MySQL Workbench, R, Python, terminal).

Examples:

* A lab maintaining its own sequencing data
* A company storing genomic data under NDA
* A researcher running MySQL locally on their laptop

---

## 🌐 **Public Database**

To expose a database over the internet, you need:

* a **domain name** (purchased from an internet registrar)
* a **public server** that hosts the database or API
* authentication and security layers
* an interface between the users and the database

Importantly, users generally **do not access the database directly**.
Instead, they use:

* a web interface
* a graphical dashboard
* or, most commonly, an **API**

---

# 🔗 The Role of APIs

An **API (Application Programming Interface)** acts as a protective layer that:

* allows users to retrieve data without directly interacting with the database
* enforces security rules and authentication
* standardizes requests
* enables access from R, Python, web apps, and workflows

APIs are essential for public databases because they:

* protect the underlying database
* prevent heavy or unsafe queries
* enable scalable and controlled data distribution

---

# 🧬 Real Example: Accessing TCGA Data via R (TCGAbiolinks)

The TCGA project **does not expose its underlying SQL databases directly**.
Instead:

1. TCGA data is hosted on public GDC servers.
2. GDC provides **REST APIs** for accessing these datasets.
3. Tools such as **TCGAbiolinks** (R/Bioconductor) connect to these APIs.
4. RStudio becomes a client that sends API requests — *not* direct SQL queries.

This means:

* The infrastructure (servers, databases, security) is maintained by GDC/NIH.
* Users interact with high-level R functions that call the APIs behind the scenes.
* The experience is simplified, reproducible, and safe.

---

# 🧭 Conceptual Summary

| Layer               | What it provides                       | Who handles it               |
| ------------------- | -------------------------------------- | ---------------------------- |
| **SQL**             | Logical data operations                | Bioinformatician / Developer |
| **DBMS**            | Software managing tables & queries     | Server / Sysadmin            |
| **Server hardware** | Stability, uptime, computational power | Institution / Cloud provider |
| **API**             | Controlled public access               | Software engineering team    |
| **User**            | Access through R, Python, web          | Researcher                   |


