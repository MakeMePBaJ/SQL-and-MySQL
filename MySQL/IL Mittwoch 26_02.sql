-- IL Mittwoch
-- 26.02.2025

-- Uebung 10

-- 1
-- Alle Baumarten als Liste.
SELECT baumart AS `Baumarten`
FROM giessungen
GROUP BY baumart
ORDER BY baumart ASC
;

-- 2
-- Alle Bezirke als Liste.
SELECT bezirk AS `bezirk`
FROM giessungen
GROUP BY bezirk
ORDER BY bezirk ASC
;

-- 3
-- Alle Strassennamen als Liste.
SELECT strassenname AS `Strassennamen`
FROM giessungen
WHERE 
    strassenname IS NOT NULL 
    AND 
    strassenname != ''
    AND
    strassenname != 'undefined'
ORDER BY strassenname ASC
;

-- 4
-- Die Anzahl der Giessungen pro Baum im Jahr 2020.
SELECT COUNT(zeitpunkt_der_bewaesserung) AS `Anzahl der Giessungen von 2020`, nr AS `Baumnummer`
FROM giessungen
WHERE zeitpunkt_der_bewaesserung LIKE '2020%'
GROUP BY nr
;

-- 5
-- Die Summe der Bewässerungsmenge des Baumes _2zk8qshnu pro Jahr.
SELECT 
	nr, 
	SUM(bewaesserungsmaenge_in_liter) AS `Summe der Bewässerungsmenge`, 
	YEAR(zeitpunkt_der_bewaesserung) AS `Jahr der Bewässerung`
FROM giessungen
WHERE nr = '_2zk8qshnu'
GROUP BY YEAR(zeitpunkt_der_bewaesserung)
ORDER BY `Jahr der Bewässerung` DESC
;

-- 6
-- Die 10 ältesten Bäume.
SELECT pflanzjahr, nr AS `10 ältesten Bäume`
FROM giessungen
GROUP BY `10 ältesten Bäume`
ORDER BY pflanzjahr ASC
LIMIT 10
;
