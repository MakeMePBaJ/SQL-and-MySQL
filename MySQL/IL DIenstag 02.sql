/*

IL DIENSTAG
Uebung 01

*/

-- 1
SELECT nr, zeitpunkt_der_bewaesserung
FROM giessungen
ORDER BY zeitpunkt_der_bewaesserung ASC;

-- 2
SELECT nr, bezirk
FROM giessungen
WHERE bezirk = 'Pankow';

-- 3
SELECT nr, gattung
FROM giessungen
WHERE gattung = 'Linde';

-- 4
SELECT nr, zeitpunkt_der_bewaesserung
FROM giessungen
WHERE strassenname = 'Apostel-Paulus-Straße'
ORDER BY zeitpunkt_der_bewaesserung DESC;

-- 5
SELECT nr, strassenname
FROM giessungen
WHERE
    strassenname = 'undefined' 
    OR 
    strassenname IS NULL
    OR
    strassenname = ''
    ;

-- 6
SELECT nr, pflanzjahr
FROM giessungen
WHERE pflanzjahr >= 1925;

-- 7
SELECT nr, bewaesserungsmaenge
FROM giessungen
WHERE bewaesserungsmaenge >= 50
ORDER BY bewaesserungsmaenge DESC;

-- 8
SELECT nr, baumart, geographische_laenge, latitude, longitude
FROM giessungen
ORDER BY zeitpunkt_der_bewaesserung DESC;

-- 9
SELECT nr, baumart
FROM giessungen
WHERE baumart = 'Ahornblättrige Platane' AND bezirk = 'Mitte'
ORDER BY strassenname ASC;information_schema