
# Install required packages (run once)
install.packages("RSQLite")
install.packages("DBI")

# Load libraries
library(DBI)
library(RSQLite)

# Create a new SQLite database (or connect if it already exists)
con <- dbConnect(SQLite(), "bioinfo_db.sqlite")

# Read the SQL script from a file
# Make sure the file "comandi_base.sql" ends with an empty line to avoid parsing issues
sql_script <- readLines("comandi_base.sql")
sql_query <- paste(sql_script, collapse = "\n")

#️ Execute SQL commands to create tables
dbExecute(con, sql_query)

# Insert example data into the 'pazienti' (patients) table
dbExecute(con, "
INSERT INTO pazienti (id_paziente, nome, eta, sesso, malattia) VALUES
(1, 'Anna Rossi', 67, 'F', 'Adenocarcinoma gastrico'),
(2, 'Luca Bianchi', 55, 'M', 'Psoriasi'),
(3, 'Maria Verdi', 72, 'F', 'Adenocarcinoma gastrico');
")

# Insert example data into the 'campioni' (samples) table
dbExecute(con, "
INSERT INTO campioni (id_campione, id_paziente, tipo_campione, data_raccolta) VALUES
(101, 1, 'RNA-seq', '2024-04-12'),
(102, 2, 'siero', '2024-03-10'),
(103, 3, 'RNA-seq', '2024-05-02');
")

# Retrieve data from the 'pazienti' table
df_pazienti <- dbGetQuery(con, "SELECT * FROM pazienti")
print(df_pazienti)

# Example query: calculate the average age of patients with gastric adenocarcinoma
media <- dbGetQuery(con, "
  SELECT AVG(eta) AS eta_media
  FROM pazienti
  WHERE malattia = 'Adenocarcinoma gastrico'
")
print(media)

# Close the connection when you're done
dbDisconnect(con)
