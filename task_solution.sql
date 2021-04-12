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
CREATE TABLE position (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
pos_name VARCHAR(20),
pos_description VARCHAR(60),
pos_salary DECIMAL(10,2));

-- 10. Tworzy tabelę adres (ulica+numer domu/mieszkania, kod pocztowy, miejscowość)
CREATE TABLE address (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
street VARCHAR(20),
postal_code VARCHAR(6),
city VARCHAR(15));

-- 11. Tworzy tabelę pracownik (imię, nazwisko) + relacje do tabeli stanowisko i adres
CREATE TABLE employee (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(15),
last_name VARCHAR(15),
position_id BIGINT NOT NULL,
FOREIGN KEY (position_id) REFERENCES position (id),
address_id BIGINT NOT NULL,
FOREIGN KEY (address_id) REFERENCES address (id)); 

-- 12. Dodaje dane testowe (w taki sposób, aby powstały pomiędzy nimi sensowne powiązania)
INSERT INTO position (pos_name, pos_description, pos_salary) 
VALUES
("junior engineer", "engineer on learing mode", 4000),
("engineer", "product owner", 5000),
("principal engineer", "leader of product team", 12000);

INSERT INTO address (street, postal_code, city)
VALUES
("OKOPOWA 15/2", "00-902", "Warszawa"),
("Wiejska 4", "00-902", "Warszawa"),
("Tęczowa 88", "00-902", "Warszawa"),
("Cudaczna 12", "44-100", "Gliwice");

INSERT INTO employee (first_name, last_name, position_id, address_id)
VALUES
("Jan", "Kowalski", 1, 2),
("Adam", "Niezgódka", 1, 1),
("Helga", "Drobna", 2, 3),
("Iwan", "Łagodny", 3, 4);

-- 13. Pobiera pełne informacje o pracowniku (imię, nazwisko, adres, stanowisko)
SELECT e.first_name, e.last_name, a.postal_code, a.city, a.street, p.pos_name 
FROM employee AS e
JOIN address AS a ON e.address_id = a.id
JOIN position AS p ON e.position_id = p.id;

-- 14. Oblicza sumę wypłat dla wszystkich pracowników w firmie
SELECT SUM(pos_salary) as sum_of_salaries FROM position AS p
JOIN employee e ON p.id = e.position_id;

-- 15. Pobiera pracowników mieszkających w lokalizacji z kodem pocztowym 90210 (albo innym, który będzie miał sens dla Twoich danych testowych)
SELECT e.first_name, e.last_name FROM employee AS e
JOIN address AS a ON e.address_id = a.id
WHERE a.postal_code = '00-902';
