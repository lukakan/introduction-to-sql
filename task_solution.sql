-- Zdefiniuj następujące zapytania:
-- 1. Tworzy tabelę pracownik(imie, nazwisko, wyplata, data urodzenia, stanowisko). W tabeli mogą być dodatkowe kolumny, które uznasz za niezbędne.
-- CREATE DATABASE javaStart23p1 CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE javaStart23p1;
DROP TABLE IF EXISTS employee;

CREATE TABLE employee(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(15),
last_name VARCHAR(15),
salary DECIMAL(10,2),
birth_date DATE,
title VARCHAR(30)
);

-- 2. Wstawia do tabeli co najmniej 6 pracowników
INSERT INTO employee (first_name, last_name, salary, birth_date, title)
VALUES
('Adam', 'Kowalski', 2500.50, '1989-01-05', 'technican'),
('Peter', 'Parker', 2750.50, '1994-09-11', 'technican'),
('Bruce', 'Banner', 3500.50, '1978-10-05', 'senior-technican'),
('Aria', 'Stark', 6500.58, '1995-01-05', 'account'),
('John', 'Stark', 5300.45, '1985-03-05', 'head hunter'),
('Boromir', 'Gondor', 5400.20, '1985-03-05', 'head hunter'),
('John', 'Snow', 3500.47, '1985-03-05', 'PR junior specialist');

-- 3. Pobiera wszystkich pracowników i wyświetla ich w kolejności alfabetycznej po nazwisku
SELECT * FROM employee ORDER BY last_name;

-- 4. Pobiera pracowników na wybranym stanowisku
SELECT * FROM employee WHERE title = 'technican';

-- 5. Pobiera pracowników, którzy mają co najmniej 30 lat
SELECT * FROM employee WHERE EXTRACT(YEAR FROM NOW()) - EXTRACT(YEAR FROM birth_date) >= 30;

-- 6. Zwiększa wypłatę pracowników na wybranym stanowisku o 10%
UPDATE employee SET salary = salary*1.1 WHERE title='technican';

-- 7. Usuwa najmłodszego pracownika
SELECT MAX(birth_date) FROM employee;
DELETE FROM employee ORDER BY birth_date DESC LIMIT 1;

-- 8. Usuwa tabelę pracownik
DROP TABLE IF EXISTS employee;

-- 9. Tworzy tabelę stanowisko (nazwa stanowiska, opis, wypłata na danym stanowisku)
-- 10. Tworzy tabelę adres (ulica+numer domu/mieszkania, kod pocztowy, miejscowość)
-- 11. Tworzy tabelę pracownik (imię, nazwisko) + relacje do tabeli stanowisko i adres
-- 12. Dodaje dane testowe (w taki sposób, aby powstały pomiędzy nimi sensowne powiązania)
-- 13. Pobiera pełne informacje o pracowniku (imię, nazwisko, adres, stanowisko)
-- 14. Oblicza sumę wypłat dla wszystkich pracowników w firmie
-- 15. Pobiera pracowników mieszkających w lokalizacji z kodem pocztowym 90210 (albo innym, który będzie miał sens dla Twoich danych testowych)