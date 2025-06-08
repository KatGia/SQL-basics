-- ========================================
-- 1. STORED PROCEDURE: Update Patient's Disease
-- ========================================

DELIMITER //

CREATE PROCEDURE update_disease(
    IN patient_id INT,
    IN new_diagnosis TEXT
)
BEGIN
    UPDATE pazienti
    SET malattia = new_diagnosis
    WHERE id_paziente = patient_id;
END;
//

DELIMITER ;

-- Call example:
-- CALL update_disease(1, 'Chronic gastritis');



-- ========================================
-- 2. TRIGGER: Log Changes to 'pazienti' Table
-- ========================================

DELIMITER //

CREATE TRIGGER log_name_update
AFTER UPDATE ON pazienti
FOR EACH ROW
BEGIN
    IF OLD.nome != NEW.nome THEN
        INSERT INTO log_pazienti (id_paziente, field_changed)
        VALUES (OLD.id_paziente, 'nome');
    END IF;
END;
//

DELIMITER ;



-- ========================================
-- 3. EMBEDDED SQL: Example in Python (SQLite)
-- ========================================

-- (This part is not SQL)
-- Save as: embedded_example.py

-- 
-- import sqlite3
-- 
-- conn = sqlite3.connect('ospedale.db')
-- cursor = conn.cursor()
-- 
-- patient_id = 1
-- cursor.execute("SELECT nome FROM pazienti WHERE id_paziente = ?", (patient_id,))
-- name = cursor.fetchone()[0]
-- 
-- print(f"Patient name: {name}")



-- ========================================
-- 4. CURSOR EXAMPLE (in PL/pgSQL-style)
-- ========================================

-- Example for PostgreSQL (adjust for other dialects)

-- DO $$
-- DECLARE
--     rec RECORD;
-- BEGIN
--     FOR rec IN SELECT * FROM pazienti LOOP
--         RAISE NOTICE 'Patient: %', rec.nome;
--     END LOOP;
-- END $$;



-- ========================================
-- 5. DYNAMIC SQL: Search Patients by Diagnosis
-- ========================================

DELIMITER //

CREATE PROCEDURE search_patients_by_disease(IN diagnosis TEXT)
BEGIN
    SET @query = CONCAT('SELECT * FROM pazienti WHERE malattia = "', diagnosis, '"');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//

DELIMITER ;

-- Example:
-- CALL search_patients_by_disease('Gastric adenocarcinoma');



-- ========================================
-- 6. DATABASE CONNECTIVITY (ODBC / JDBC)
-- ========================================

-- Conceptual section, not executable SQL.

-- ODBC: used with Python (pyodbc), C/C++, Excel, etc.
-- JDBC: Java API for databases.

-- Java Example:
-- 
-- Connection conn = DriverManager.getConnection(
--     "jdbc:mysql://localhost:3306/ospedale", "user", "pass");
-- Statement stmt = conn.createStatement();
-- ResultSet rs = stmt.executeQuery("SELECT * FROM pazienti");



-- ========================================
-- PRACTICE IDEAS
-- ========================================

-- 1. Add trigger to prevent negative ages
-- 2. Use cursors to analyze patients with multiple samples
-- 3. Create stored procedures for aggregated disease reports
-- 4. Try building a simple Python or Java app using ODBC/JDBC

# End
