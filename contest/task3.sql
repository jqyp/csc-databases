-- Условие
-- Планета называется забытой, если за всё время на ней побывал всего лишь один капитан.
-- Вывести для каждого капитана количество посещенных им забытых планет.
-- Капитанов с нулем таковых планет выводить не надо.
-- Планета, на которой никто никогда не был, забытой не считается.
--
-- Результат
-- commander_id INT, commander_name TEXT, lost_planets INT

SELECT commander_id,
       commander_name,
       COUNT(*) AS lost_planets
FROM (
    SELECT DISTINCT commander_id,
                    Commander.name AS commander_name,
                    planet_id
    FROM Commander
    JOIN Flight ON Commander.id = Flight.commander_id
    WHERE planet_id IN (
        SELECT planet_id
        FROM (
            SELECT planet_id,
                   COUNT(*) AS planet_visit_count
            FROM (
                SELECT planet_id,
                       commander_id
                FROM Flight
                WHERE commander_id IS NOT NULL AND planet_id IS NOT NULL
                GROUP BY planet_id, commander_id
            ) PlanetCommander GROUP BY planet_id
        ) PlanetVisitCount
        WHERE planet_visit_count = 1
    )
) LostPlanetId
GROUP BY commander_id, commander_name;
