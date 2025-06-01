-- PROJECTION: select only specific columns (name, gender)
SELECT nome, sesso
FROM pazienti;

-- SELECTION with complex condition: female patients over 65 years
SELECT *
FROM pazienti
WHERE sesso = 'F' AND eta > 65;

-- RENAME (aliases) for table and columns
SELECT p.nome AS "Patient", p.eta AS "Age", c.tipo_campione AS "Sample Type"
FROM pazienti AS p
JOIN campioni AS c ON p.id_paziente = c.id_paziente;

-- THETA JOIN: join with arbitrary condition (different column values)
-- Example: match when patient ID is less than sample ID
SELECT p.nome, c.tipo_campione
FROM pazienti p
JOIN campioni c ON p.id_paziente < c.id_campione;

-- FULL OUTER JOIN simulation (not natively supported in SQLite)
-- Simulated using UNION of LEFT and RIGHT JOINs with NULL checks
SELECT p.nome, c.tipo_campione
FROM pazienti p
LEFT JOIN campioni c ON p.id_paziente = c.id_paziente
UNION
SELECT p.nome, c.tipo_campione
FROM pazienti p
RIGHT JOIN campioni c ON p.id_paziente = c.id_paziente;

-- N-ARY JOIN: join with a third table (diagnoses)
CREATE TABLE diagnosi (
    id_diagnosi INTEGER PRIMARY KEY,
    id_paziente INTEGER,
    data_diagnosi DATE,
    FOREIGN KEY (id_paziente) REFERENCES pazienti(id_paziente)
);

INSERT INTO diagnosi (id_diagnosi, id_paziente, data_diagnosi) VALUES
(1001, 1, '2023-12-01'),
(1002, 3, '2024-01-20');

-- Join with three tables: patients + samples + diagnoses
SELECT p.nome, c.tipo_campione, d.data_diagnosi
FROM pazienti p
JOIN campioni c ON p.id_paziente = c.id_paziente
JOIN diagnosi d ON p.id_paziente = d.id_paziente;

-- Handling NULL: find patients with no diagnosis
SELECT p.nome
FROM pazienti p
LEFT JOIN diagnosi d ON p.id_paziente = d.id_paziente
WHERE d.data_diagnosi IS NULL;

-- SELECTION with NOT NULL: patients with a known disease
SELECT nome
FROM pazienti
WHERE malattia IS NOT NULL;

-- SELECTION atomization (logical equivalent)
SELECT *
FROM pazienti
WHERE eta > 60 AND sesso = 'F';

-- Distributed selection (useful for optimization)
SELECT *
FROM (
    SELECT *
    FROM pazienti
    WHERE eta > 60
) AS patients_over60
WHERE sesso = 'F';

-- Idempotent projection (didactic example)
SELECT nome
FROM (
    SELECT nome
    FROM (
        SELECT nome, eta
        FROM pazienti
    )
);

-- SELECT with ORDER BY and LIMIT: get the oldest patient
SELECT nome, eta
FROM pazienti
ORDER BY eta DESC
LIMIT 1;

-- COUNT DISTINCT: number of unique diseases
SELECT COUNT(DISTINCT malattia) AS num_diseases
FROM pazienti;

-- CASE WHEN: assign age group categories
SELECT nome,
       CASE
           WHEN eta >= 70 THEN 'Senior'
           WHEN eta >= 60 THEN 'Adult'
           ELSE 'Young'
       END AS age_group
FROM pazienti;

# End
