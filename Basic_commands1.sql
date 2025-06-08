-- Creazione delle Table

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


-- Tabella pazienti e campioni 

INSERT INTO pazienti (id_paziente, nome, eta, sesso, malattia) VALUES
(1, 'Anna Rossi', 67, 'F', 'Adenocarcinoma gastrico'),
(2, 'Luca Bianchi', 55, 'M', 'Psoriasi'),
(3, 'Maria Verdi', 72, 'F', 'Adenocarcinoma gastrico');

INSERT INTO campioni (id_campione, id_paziente, tipo_campione, data_raccolta) VALUES
(101, 1, 'RNA-seq', '2024-04-12'),
(102, 2, 'siero', '2024-03-10'),
(103, 3, 'RNA-seq', '2024-05-02');

