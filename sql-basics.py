# Python script to create and query a SQLite database for patient data

# If you haven't set up a Python environment yet, you can do it as follows:
# python3 -m venv .venv        # create a virtual environment
# source .venv/bin/activate    # activate the virtual environment (Linux/Mac)
# .venv\Scripts\activate       # activate on Windows
# Install required packages:
# pip install pandas ipykernel

# Note:
# - sqlite3 is included by default with Python standard library
# - pandas is not included by default, so install it if necessary

import sqlite3
import pandas as pd

# 1. Connect to (or create) a SQLite database file named 'bioinfo_db.sqlite'
con = sqlite3.connect("bioinfo_db.sqlite")

# 2. Read SQL commands from an external file containing table creation and data insertion
with open("basic-commands.sql", "r", encoding="utf-8") as f:
    sql_script = f.read()

# 3. Execute the SQL script to create tables and insert data
con.executescript(sql_script)

# 4. Query all data from the 'pazienti' (patients) table into a pandas DataFrame
df_pazienti = pd.read_sql_query("SELECT * FROM pazienti", con)
print(df_pazienti)

# 5. Calculate the average age of patients with 'Adenocarcinoma gastrico'
media = pd.read_sql_query("""
  SELECT AVG(eta) AS eta_media
  FROM pazienti
  WHERE malattia = 'Adenocarcinoma gastrico'
""", con)
print(media)

# 6. Close the database connection to free resources
con.close()