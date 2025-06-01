-- Practice with SQL Commands (Extended)

--- Definition command to create tables:
CREATE TABLE pazienti (
    id_paziente INTEGER PRIMARY KEY,
    nome TEXT,
    eta INTEGER,
    sesso TEXT,
    malattia TEXT
);

CREATE TABLE campioni (
    id_campione INTEGER PRIMARY KEY,
    id_paziente INTEGER,
    tipo_campione TEXT,
    data_raccolta DATE,
    FOREIGN KEY (id_paziente) REFERENCES pazienti(id_paziente)
);



--- Data Manipulation (DML):
INSERT INTO pazienti (id_paziente, nome, eta, sesso, malattia) VALUES
(1, 'Anna Rossi', 67, 'F', 'Adenocarcinoma gastrico'),
(2, 'Luca Bianchi', 55, 'M', 'Psoriasi'),
(3, 'Maria Verdi', 72, 'F', 'Adenocarcinoma gastrico');

INSERT INTO campioni (id_campione, id_paziente, tipo_campione, data_raccolta) VALUES
(101, 1, 'RNA-seq', '2024-04-12'),
(102, 2, 'siero', '2024-03-10'),
(103, 3, 'RNA-seq', '2024-05-02');

-- UPDATE: change a patient's name.
UPDATE pazienti
SET nome = 'Anna R. Rossi'
WHERE id_paziente = 1;

-- DELETE: remove a patient.
DELETE FROM pazienti
WHERE id_paziente = 2;



--- Query Command: selecting all patients older than 60 years (condition).
SELECT * FROM pazienti
WHERE eta > 60;

-- Using LIKE to find patients with last name ending in 'i'.
SELECT * FROM pazienti
WHERE nome LIKE '%i';

-- Patients with unknown disease (IS NULL).
SELECT * FROM pazienti
WHERE malattia IS NULL;

-- ORDER BY: patients by age descending.
SELECT * FROM pazienti
ORDER BY eta DESC;

-- Aliases: rename columns in output.
SELECT nome AS "Nome Paziente", eta AS "Età"
FROM pazienti;

-- DISTINCT: find all unique diseases.
SELECT DISTINCT malattia
FROM pazienti;



--- Queries on Specific Tables: finding all samples of type 'RNA-seq'.
SELECT * FROM campioni
WHERE tipo_campione = 'RNA-seq';



--- JOIN tables: join between patients and samples.
-- INNER JOIN:
SELECT p.nome, c.tipo_campione, c.data_raccolta
FROM pazienti p
JOIN campioni c ON p.id_paziente = c.id_paziente;

-- LEFT JOIN: patients without samples.
SELECT p.nome
FROM pazienti p
LEFT JOIN campioni c ON p.id_paziente = c.id_paziente
WHERE c.id_campione IS NULL;

-- Note: NATURAL JOIN (requires same column name – example if both tables had id_paziente). It's better to use explicit JOINs in practice.



--- Aggregate Operators.
-- COUNT: counting by sample type.
SELECT tipo_campione, COUNT(*) AS numero_campioni
FROM campioni
GROUP BY tipo_campione;

-- Counting with 'HAVING': only sample types with more than 1 sample.
SELECT tipo_campione, COUNT(*) AS numero_campioni
FROM campioni
GROUP BY tipo_campione
HAVING COUNT(*) > 1;

-- AVG: average age per disease.
SELECT malattia, AVG(eta) AS eta_media
FROM pazienti
GROUP BY malattia;

# End
