/*

Il Dienstag 25.02.2025
Übungsblatt 09

*/

SELECT nr, zeitpunkt_der_bewaesserung
FROM giessungen
ORDER BY zeitpunkt_der_bewaesserung ASC;

SELECT nr, bezirk
FROM giessungen
WHERE bezirk = 'Pankow';

SELECT nr, gattung, zeitpunkt_der_bewaesserung
FROM giessungen
WHERE gattung = 'Linde';

SELECT nr, strassenname, zeitpunkt_der_bewaesserung
FROM giessungen
WHERE strassenname = 'Apostel-Paulus-Straße'
ORDER BY zeitpunkt_der_bewaesserung DESC;

SELECT nr, strassenname, zeitpunkt_der_bewaesserung
FROM giessungen
WHERE strassenname = '';

SELECT nr, pflanzjahr, zeitpunkt_der_bewaesserung
FROM giessungen
ORDER BY pflanzjahr >= 1925;

SELECT nr, bewaesserungsmaenge_in_liter
FROM giessungen
WHERE bewaesserungsmaenge_in_liter >= '50'
ORDER BY bewaesserungsmaenge_in_liter DESC;

SELECT nr, longitude, latitude, zeitpunkt_der_bewaesserung
FROM giessungen
ORDER BY nr DESC;

SELECT nr, baumart, bezirk, strassenname, zeitpunkt_der_bewaesserung
FROM giessungen 
WHERE baumart = 'Ahornblättrige Platane' AND bezirk = 'Mitte';