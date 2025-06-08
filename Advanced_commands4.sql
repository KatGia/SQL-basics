-- Advanced constraints: CHECK, assertions, and views

-- Exercise 1: Minimum age for patients
CREATE TABLE patients_check (
    patient_id INTEGER PRIMARY KEY,
    name TEXT,
    age INTEGER CHECK (age >= 18),
    gender TEXT,
    disease TEXT
);

-- Valid insertion
INSERT INTO patients_check VALUES (1, 'Giulia Neri', 34, 'F', 'Dermatitis');

-- Invalid insertion (age too low)
-- INSERT INTO patients_check VALUES (2, 'Marco Blu', 12, 'M', 'Asthma');  -- Will raise an error


-- Exercise 2: Allowed values for sample type
CREATE TABLE samples_check (
    sample_id INTEGER PRIMARY KEY,
    patient_id INTEGER,
    sample_type TEXT CHECK (sample_type IN ('RNA-seq', 'serum', 'biopsy')),
    collection_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients_check(patient_id)
);


-- Exercise 3: Maximum discount on drug prices
CREATE TABLE drugs (
    drug_id INTEGER PRIMARY KEY,
    name TEXT,
    price DECIMAL(10,2),
    discount DECIMAL(10,2),
    CHECK (discount <= price)
);

-- Valid discount
INSERT INTO drugs VALUES (1, 'DrugA', 50.00, 10.00);

-- Invalid discount (discount > price)
-- INSERT INTO drugs VALUES (2, 'DrugB', 40.00, 50.00);  -- Will raise an error


-- Exercise 4: View of patients with “Gastric Adenocarcinoma” only
CREATE VIEW view_adenocarcinoma AS
SELECT * FROM patients_check
WHERE disease = 'Gastric Adenocarcinoma'
WITH CHECK OPTION;

-- Valid insertion through view
INSERT INTO view_adenocarcinoma VALUES (2, 'Marta Rosa', 66, 'F', 'Gastric Adenocarcinoma');

-- Invalid insertion (disease does not match the view condition)
-- INSERT INTO view_adenocarcinoma VALUES (3, 'Luca Verdi', 70, 'M', 'Melanoma');  -- Will raise an error


-- Scalar functions: temporal, string, type conversion, conditional

-- Exercise 5: Temporal functions
SELECT 
    CURRENT_DATE AS "Today", 
    CURRENT_TIME AS "Time", 
    CURRENT_TIMESTAMP AS "DateTime";


-- Exercise 6: String functions (patient names)
SELECT name, 
       LOWER(name) AS "lowercase", 
       UPPER(name) AS "UPPERCASE",
       SUBSTRING(name, 1, 3) AS "initials", 
       CHAR_LENGTH(name) AS "length"
FROM patients_check;


-- Exercise 7: Type conversions
SELECT 
    CAST('75' AS UNSIGNED) + 5 AS `75_plus_5`,
    CONCAT(CAST(2025 AS CHAR), '-ID') AS `Year_Code`;


-- Exercise 8: Conditional functions with missing data
SELECT name,
       COALESCE(disease, 'Not Diagnosed') AS "Diagnosis",
       NULLIF(age, 0) AS "Valid Age",
       CASE 
           WHEN age >= 70 THEN 'Senior'
           WHEN age >= 60 THEN 'Adult'
           ELSE 'Young'
       END AS "Age Group"
FROM patients_check;

# End
