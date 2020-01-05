-- Условие
-- Найдите все уникальные корабли, когда-либо летавшие
-- на планету Ra
--
-- Результат
-- id INT, name TEXT

SELECT DISTINCT Spacecraft.id,
                Spacecraft.name
FROM Flight
JOIN Planet ON Flight.planet_id = Planet.id
JOIN Spacecraft ON Flight.spacecraft_id = Spacecraft.id
WHERE Planet.name = 'Ra';
