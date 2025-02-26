/*

MySQL lesson - 26_02_2025
create statistics with grouping and functions

functions
Aggregat- (Gruppierungsfunktionen) Funktionen


: SAMPLE CODE :

Zusammenfassung der Mitarbeiterstatistik: 
Anzahl der Mitarbeiter, Durchschnittsgehalt, Maximalgehalt, Minimalgehalt 
und Gesamtgehalt pro Abteilung

*/

-- : MOST COMPACT CODE :

SELECT AbtNr AS 'Abteilungsnummer', COUNT(*) AS 'Anzahl Mitarbeiter', CONCAT(ROUND(AVG(Gehalt), 0), ' €') AS 'Durchschnittsgehalt', MAX(Gehalt) AS 'Maximalgehalt', MIN(Gehalt) AS 'Minimalgehalt', SUM(Gehalt) AS 'Gesamtgehalt' 
FROM mitarbeiter 
GROUP BY AbtNr 
HAVING 'Minimalgehalt' > 500
ORDER BY AbtNr ASC, Durchschnittsgehalt DESC
;


-- : MOST READABLE CODE :

SELECT
    AbtNr AS 'Abteilungsnummer', 
    COUNT(*) AS 'Anzahl Mitarbeiter', 
    CONCAT(ROUND(AVG(Gehalt), 0), ' €') AS 'Durchschnittsgehalt', 
    MAX(Gehalt) AS 'Maximalgehalt', 
    MIN(Gehalt) AS 'Minimalgehalt', 
    SUM(Gehalt) AS 'Gesamtgehalt' 
FROM mitarbeiter 
GROUP BY AbtNr 
HAVING 'Minimalgehalt' > 500
ORDER BY AbtNr ASC, Durchschnittsgehalt DESC
;


-- : EXPLANATION - CODE WITH COMMENTS :s

SELECT -- Gesamt Statistik pro Abteilung

    AbtNr AS 'Abteilungsnummer', 
    -- SELECT AbtNr AS 'Abteilungsnummer'
    -- Wählt die Abteilungsnummer aus und benennt die Spalte in 'Abteilungsnummer' um
    
    COUNT(*) AS 'Anzahl Mitarbeiter', 
    -- COUNT(*) AS 'Anzahl Mitarbeiter'
    -- Zählt die Anzahl der Mitarbeiter in jeder Abteilung 
    -- und benennt die Spalte in 'Anzahl Mitarbeiter' um
    
    CONCAT(ROUND(AVG(Gehalt), 0), ' €') AS 'Durchschnittsgehalt', 
    -- CONCAT(ROUND(AVG(Gehalt), 0), ' €') AS 'Durchschnittsgehalt'
    -- Berechnet das Durchschnittsgehalt in jeder Abteilung, 
    -- rundet es auf 0 Nachkommastellen, fügt das '€'-Symbol hinzu 
    -- und benennt die Spalte in 'Durchschnittsgehalt' um
    
    MAX(Gehalt) AS 'Maximalgehalt', 
    -- MAX(Gehalt) AS 'Maximalgehalt'
    -- Findet das höchste Gehalt in jeder Abteilung 
    -- und benennt die Spalte in 'Maximalgehalt' um
    
    MIN(Gehalt) AS 'Minimalgehalt', 
    -- MIN(Gehalt) AS 'Minimalgehalt'
    -- Findet das niedrigste Gehalt in jeder Abteilung 
    -- und benennt die Spalte in 'Minimalgehalt' um
    
    SUM(Gehalt) AS 'Gesamtgehalt' 
    -- SUM(Gehalt) AS 'Gesamtgehalt'
    -- Berechnet die Gesamtsumme der Gehälter in jeder Abteilung 
    -- und benennt die Spalte in 'Gesamtgehalt' um

FROM mitarbeiter 
-- FROM mitarbeiter
-- Gibt die Tabelle an, aus der die Daten abgerufen werden sollen

GROUP BY AbtNr 
-- GROUP BY AbtNr
-- Gruppiert die Ergebnisse nach Abteilungsnummer, 
-- sodass die Aggregat-Funktionen für jede Abteilung separat berechnet werden

HAVING 'Minimalgehalt' > 500
-- HAVING 'Minimalgehalt' > 500
-- Filtert die Ergebnisse nach einem Mindestgehalt von 500 €

ORDER BY AbtNr ASC, Durchschnittsgehalt DESC
-- ORDER BY AbtNr ASC, Durchschnittsgehalt DESC
-- Sortiert die Ergebnisse nach Abteilungsnummer in aufsteigender Reihenfolge
-- und nach Durchschnittsgehalt in absteigender Reihenfolge
;



-- ----------------------------------------------

-- : SAMPLE CODE\SMALLER EXAMPLES :

-- zähle alle Mitarbeiter (Datensätze)
SELECT COUNT(Mnr) AS 'Anzahl Mitarbeiter' -- AS 'Name' gibt der Spalte einen Namen
FROM mitarbeiter
; -- ; beendet den Befehl

-- zähle alle Mitarbeiter mit Gehalt >= 1000
SELECT COUNT(*) AS 'Mitarbeiter Gehalt >= 1000€'
-- * bedeutet alle Spalten
FROM mitarbeiter
WHERE Gehalt >= 1000
;

-- zeigt die Spalte mit dem Primär-Schlüssel an
SELECT COLUMN_NAME AS 'Primär-Schlüssel'
FROM information_schema.KEY_COLUMN_USAGE -- Tabelle mit den Schlüsseln
WHERE 
    TABLE_NAME = 'mitarbeiter'
    AND 
    CONSTRAINT_NAME = 'PRIMARY'
;

-- zähle alle Mitarbeiter ohne Telefonnummer
SELECT COUNT(*) AS 'Mitarbeiter ohne Telefonnummer'
FROM mitarbeiter
WHERE Telefon IS NULL
;

-- zeigt das Durchschnittsgehalt aller mitarbeiter an
SELECT AVG(Gehalt)
FROM mitarbeiter
;

-- zeigt das Durchschnittsgehalt aller mitarbeiter an, gerundet auf 2 Nachkommastellen
SELECT ROUND( AVG(Gehalt), 2) AS 'Durchschnittsgehalt'
FROM mitarbeiter
;

-- zeigt das Maximum des Gehalts an
SELECT MAX(Gehalt) AS 'Maximalgehalt'
FROM mitarbeiter
;

-- zeigt das Minimum des Gehalts an
SELECT MIN(Gehalt) AS 'Minimalgehalt'
FROM mitarbeiter
;

-- zeigt die Summe des Gehalts an
SELECT SUM(Gehalt) AS 'Gesamtgehalt'
FROM mitarbeiter
;

-- Anzahl der Mitarbeiter pro Abteilung
SELECT AbtNr AS 'Abteilungsnummer', COUNT(*) AS 'Anzahl Mitarbeiter pro Abteilung', ROUND(AVG (Gehalt), 0) AS 'Durchschnittsgehalt'
FROM mitarbeiter
GROUP BY AbtNr
;

-- Mitarbeiter mit Telefonnummer und Gehalt >= 1800s
SELECT 
    Telefon AS 'Easy Date', 
    CONCAT(ROUND(Gehalt), ' €') AS 'Bonzen Gehalt'
FROM mitarbeiter
WHERE 
    Gehalt >= 1800 
    AND 
    Telefon IS NOT NULL
;