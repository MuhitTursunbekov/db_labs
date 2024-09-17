CREATE DATABASE lab2;
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100),
    region_id INTEGER,
    population INTEGER
);
INSERT INTO countries (country_name, region_id, population)
VALUES ('Kazakhstan', 1, 18700000);
INSERT INTO countries (country_name, country_id)
VALUES ('Uzbekistan', 2);
INSERT INTO countries (country_name, region_id, population)
VALUES ('Kyrgyzstan', NULL, 6500000);
INSERT INTO countries (country_name, region_id, population)
VALUES
('Russia', 1, 144000000),
('Ukraine', 2, 41000000),
('Belarus', 3, 9400000);
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
INSERT INTO countries DEFAULT VALUES;
INSERT INTO countries DEFAULT VALUES;
CREATE TABLE countries_new AS TABLE countries;
INSERT INTO countries_new
SELECT * FROM countries;
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;
UPDATE countries
SET population = population * 1.1
RETURNING country_name, population AS "New Population";
DELETE FROM countries
WHERE population < 100000;
DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries);
DELETE FROM countries
RETURNING *;
