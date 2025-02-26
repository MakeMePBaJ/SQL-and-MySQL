

/*

first MySQL test
25_02 - 01

*/


-- SELECT werden alle spalten ausgelesen
-- * steht für alle spalten
-- nach FROM wird die Tabelle angegeben

SELECT * FROM mitarbeiter;


-- zeige AbtNr, Name, Vorname aller Mitarbeiter
SELECT AbtNr, Name, Vorname FROM mitarbeiter;

-- Sortierung

/*
ORDER BY sortiert die Ergebnisse nach der angegebenen Spalte
ASC = aufsteigend
DESC = absteigend
*/

SELECT AbtNr, Vorname, Name
FROM mitarbeiter
ORDER BY AbtNr ASC;  -- aufsteigend;


-- Übung
-- Sortiere die Mitarbeiter nach Name absteigend

SELECT MNr, PKWNr, Datum
FROM fahrbuchs
ORDER BY Datum DESC;

-- Zeilen (Datensätze) filtern
-- WHERE macht eine Bedingung
-- =, <, >, <=, >=, <>, !=, LIKE, IN, BETWEEN, AND, OR, NOT


-- Zeige alle Mitarbeiter, die keine Telefonnummer haben und kein Geburtsdatum angegeben haben
SELECT AbtNr, Vorname, Name 
FROM mitarbeiter
WHERE 
    Telefon IS NULL 
    OR 
    GebDat IS NULL
ORDER BY Name ASC;


-- Zeige alle Mitarbeiter, die ein Gehalt von mindestens 1000 haben
SELECT Gehalt, Vorname, Name, GebDat
FROM mitarbeiter
WHERE 
    Gehalt >= 1000 
    AND 
    Gehalt IS NOT NULL
ORDER BY GebDat DESC;


-- Zeige alle Mitarbeiter, die ein Gehalt zwischen 1600 und 2000 haben
SELECT Gehalt, Vorname, Name, GebDat
FROM mitarbeiter
WHERE 
    Gehalt >= 1600
    AND 
    Gehalt <= 2000
ORDER BY GebDat DESC;


-- Zeige alle Mitarbeiter, die in der Abteilung 1 arbeiten
SELECT MNr, AbtNr, vorname, name
FROM mitarbeiter
WHERE MNr = 1



-- Zeige Mitarbeiter der Abteilung 1 oder 2, die keine Telefonnummer haben
-- AND wird vor OR ausgeführt
SELECT MNr, AbtNr, vorname, name, Telefon
FROM mitarbeiter
WHERE (AbtNr = 1 OR AbtNr = 2) AND Telefon IS NULL;

-- Alternative mit IN
SELECT MNr, AbtNr, vorname, name, Telefon
FROM mitarbeiter
WHERE AbtNr IN (1, 2, 3) AND Telefon IS NULL;

-- Alternative mit <=
SELECT AbtNr, vorname, name, Telefon
FROM mitarbeiter
WHERE AbtNr < 3 AND Telefon IS NULL;




SELECT Telefon
FROM mitarbeiter
WHERE Telefon LIKE '030/%';

SELECT Name
FROM mitarbieter;