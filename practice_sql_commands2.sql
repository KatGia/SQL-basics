
-- Practice with SQL Commands

-- Creating Tables
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

-- Inserting Data
INSERT INTO pazienti (id_paziente, nome, eta, sesso, malattia) VALUES
(1, 'Anna Rossi', 67, 'F', 'Adenocarcinoma gastrico'),
(2, 'Luca Bianchi', 55, 'M', 'Psoriasi'),
(3, 'Maria Verdi', 72, 'F', 'Adenocarcinoma gastrico');

INSERT INTO campioni (id_campione, id_paziente, tipo_campione, data_raccolta) VALUES
(101, 1, 'RNA-seq', '2024-04-12'),
(102, 2, 'siero', '2024-03-10'),
(103, 3, 'RNA-seq', '2024-05-02');

-- Selecting all patients older than 60 years
SELECT * FROM pazienti
WHERE eta > 60;

-- Finding all samples of type 'RNA-seq'
SELECT * FROM campioni
WHERE tipo_campione = 'RNA-seq';

-- Using LIKE to find patients with last name ending in 'i'
SELECT * FROM pazienti
WHERE nome LIKE '%i';

-- JOIN between patients and samples to see who provided which sample
SELECT p.nome, c.tipo_campione, c.data_raccolta
FROM pazienti p
JOIN campioni c ON p.id_paziente = c.id_paziente;

-- Counting how many samples were collected for each type
SELECT tipo_campione, COUNT(*) AS numero_campioni
FROM campioni
GROUP BY tipo_campione;

-- Average age of patients for each disease
SELECT malattia, AVG(eta) AS eta_media
FROM pazienti
GROUP BY malattia;

-- Ordering patients by age in descending order
SELECT * FROM pazienti
ORDER BY eta DESC;

-- Using alias to make results more readable
SELECT nome AS "Nome Paziente", eta AS "Età"
FROM pazienti;

-- Finding patients without associated samples (LEFT JOIN + IS NULL)
SELECT p.nome
FROM pazienti p
LEFT JOIN campioni c ON p.id_paziente = c.id_paziente
WHERE c.id_campione IS NULL;
