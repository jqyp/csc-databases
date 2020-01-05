-- Условие
-- Назовем временем простоя корабля временной интервал
-- между двумя его соседними по времени полетами.
-- Найти корабль с максимальным временем простоя или все
-- такие корабли, если их несколько.
--
-- Результат
-- spacecraft_id INT, spacecraft_name TEXT, max_idle_days INT

SELECT spacecraft_id,
       spacecraft_name,
       max_idle_days
FROM (
    SELECT *,
           MAX(idle_days) OVER () AS max_idle_days
    FROM (
        SELECT spacecraft_id,
               name AS spacecraft_name,
               date - LAG(date) OVER (PARTITION BY spacecraft_id ORDER BY date) AS idle_days
        FROM Flight
        JOIN Spacecraft ON Flight.spacecraft_id = Spacecraft.id
    ) SpacecraftIdleDays
) SpacecraftIdleDaysWithMaxIdleDays
WHERE idle_days = max_idle_days;
