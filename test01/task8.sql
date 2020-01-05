-- Условие
-- Найдите планету, на которой побывало больше всех
-- разных троллей (представителей расы Trolls). Если
-- таковых планет несколько, найдите их все.
--
-- Результат
-- planet_name TEXT, troll_count BIGINT

WITH
PLANET_TROLLS_COUNTER AS (
    SELECT planet_name,
           COUNT(troll_id) AS count
    FROM (
        SELECT Planet.name AS planet_name,
               Troll.id AS troll_id
        FROM Planet
        LEFT JOIN Flight ON Planet.id = Flight.planet_id
        LEFT JOIN Booking ON Flight.id = Booking.flight_id
        LEFT JOIN (SELECT id FROM Pax WHERE race = 'Trolls') Troll ON Booking.pax_id = Troll.id
        GROUP BY (Planet.name, Troll.id)) AS PlanetTroll
    GROUP BY planet_name)
SELECT * FROM PLANET_TROLLS_COUNTER
WHERE count = (SELECT MAX(count) FROM PLANET_TROLLS_COUNTER);
