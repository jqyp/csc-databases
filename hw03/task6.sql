-- Условие
-- Найдите среди космических кораблей, выполнявших
-- полёты, такие, у которых среднее расстояние до планеты
-- назначения больше 500.
--
-- Результат
-- spacecraft_id INT, spacecraft_name TEXT, avg_distance NUMERIC

SELECT Spacecraft.id AS spacecraft_id,
       Spacecraft.name AS spacecraft_name,
       AVG(Planet.distance) AS avg_distance
FROM Spacecraft
JOIN Flight ON Spacecraft.id = Flight.spacecraft_id
JOIN Planet ON Flight.planet_id = Planet.id
GROUP BY Spacecraft.id
HAVING AVG(Planet.distance) > 500;
