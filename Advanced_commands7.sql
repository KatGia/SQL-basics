--- Practical example of data normalization


-- 1. Table NOT normalized (1NF violated).
CREATE TABLE pazienti_raw (
    id_paziente INT PRIMARY KEY,
    nome VARCHAR(100),
    malattia VARCHAR(100),
    medico VARCHAR(100),
    telefono_medico VARCHAR(20)
);

-- I enter the data that has not been normalized
INSERT INTO pazienti_raw VALUES
(1, 'Mario Rossi', 'Gastrite cronica', 'Dr. Bianchi', '1234567890'),
(2, 'Luca Verdi', 'Gastrite cronica', 'Dr. Bianchi', '1234567890'),
(3, 'Anna Neri', 'Ulcera gastrica', 'Dr. Rossi', '0987654321'),
(4, 'Paolo Bianchi', 'Gastrite cronica', 'Dr. Bianchi', '1234567890');



--- 2. Normalization - Creation of normalized tables.
CREATE TABLE medici (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome_medico VARCHAR(100),
    telefono_medico VARCHAR(20)
);

CREATE TABLE pazienti (
    id_paziente INT PRIMARY KEY,
    nome VARCHAR(100),
    malattia VARCHAR(100),
    medico_id INT,
    FOREIGN KEY (medico_id) REFERENCES medici(id_medico)
);


-- Normalized data entry
INSERT INTO medici (nome_medico, telefono_medico) VALUES
('Dr. Bianchi', '1234567890'),
('Dr. Rossi', '0987654321');

INSERT INTO pazienti (id_paziente, nome, malattia, medico_id) VALUES
(1, 'Mario Rossi', 'Gastrite cronica', 1),
(2, 'Luca Verdi', 'Gastrite cronica', 1),
(3, 'Anna Neri', 'Ulcera gastrica', 2),
(4, 'Paolo Bianchi', 'Gastrite cronica', 1);


--- 3. Sample query to see normalized data
SELECT p.nome, p.malattia, m.nome_medico, m.telefono_medico
FROM pazienti p
JOIN medici m ON p.medico_id = m.id_medico;

# End
