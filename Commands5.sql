-- Transaction Example - Safe Inserts for Patients and Samples

START TRANSACTION;

-- Insert a new patient
INSERT INTO pazienti_check (id_paziente, nome, eta, sesso, malattia)
VALUES (10, 'Anna Verdi', 45, 'F', 'Gastric adenocarcinoma');

-- Insert a related sample
INSERT INTO campioni_check (id_campione, id_paziente, tipo_campione, data_raccolta)
VALUES (100, 10, 'RNA-seq', CURDATE());

-- If all operations succeed, commit the transaction
COMMIT;

-- If an error occurs (e.g., invalid sample type), use:
-- ROLLBACK;


--- ACID Properties with Examples
-- 1. ATOMICITY: All or nothing
START TRANSACTION;
-- Insert a patient
INSERT INTO pazienti_check VALUES (20, 'Luca Nero', 38, 'M', 'Melanoma');
-- Invalid sample type (violates CHECK constraint)
INSERT INTO campioni_check VALUES (200, 20, 'urina', CURDATE());
-- Rollback the entire transaction
ROLLBACK;
---

-- 2.CONSISTENCY: Respect constraints (e.g., foreign key)
START TRANSACTION;
-- Insert a sample for a non-existing patient (id_paziente = 999)
INSERT INTO campioni_check (id_campione, id_paziente, tipo_campione, data_raccolta)
VALUES (300, 999, 'siero', CURDATE());
-- If foreign key constraint fails, rollback
ROLLBACK;
---


-- 3.ISOLATION: Prevent interference between concurrent transactions
-- Transaction by User A
START TRANSACTION;
-- Lock the row for id_farmaco = 1
SELECT prezzo FROM farmaci WHERE id_farmaco = 1 FOR UPDATE;
-- Simultaneously, User B cannot read/modify this row
-- User A updates the price
UPDATE farmaci SET prezzo = 60.00 WHERE id_farmaco = 1;
COMMIT;
---


-- 4.DURABILITY: Changes remain after commit even if server crashes
START TRANSACTION;
-- Insert a new drug
INSERT INTO farmaci (id_farmaco, nome, prezzo, sconto)
VALUES (5, 'FarmacoX', 100.00, 10.00);
-- Make the insert permanent
COMMIT;
---


-- Quick Reference: Transaction Commands
-- Start a transaction block
START TRANSACTION;
-- Commit all changes
COMMIT;
-- Undo all changes made during the transaction
ROLLBACK;
---

# End
