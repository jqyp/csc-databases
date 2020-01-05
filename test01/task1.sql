-- Условие
-- Найдите множество всех планет, на которые летали
-- корабли "Буран" и "Чайка" (хотя бы один из них).
--
-- Результат
-- planet_name TEXT

SELECT DISTINCT Planet.name AS planet_name
FROM Planet
JOIN Flight ON Planet.id = Flight.planet_id
JOIN Spacecraft ON Flight.spacecraft_id = Spacecraft.id
WHERE Spacecraft.name IN ('Буран', 'Чайка');
