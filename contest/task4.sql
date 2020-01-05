-- Условие
-- Для каждого капитана, выполнявшего полёты найти:
-- 1) Суммарное расстояние выполненных им полётов;
-- 2) дату, когда суммарное расстояние полётов капитана
-- стало равно или превысило половину его суммарного
-- расстояния по всем записям.
--
-- Результат
-- commander TEXT, total_distance NUMERIC, half_distance NUMERIC, half_distance_date DATE

SELECT DISTINCT commander,
                total_distance,
                total_distance / 2 AS half_distance,
                FIRST_VALUE(date) OVER (PARTITION BY id ORDER BY date) AS half_distance_date
FROM (
  SELECT * FROM (
    SELECT Commander.id,
           Commander.name AS commander,
           SUM(distance) OVER (PARTITION BY Commander.id) AS total_distance,
           SUM(distance) OVER (PARTITION BY Commander.id ORDER BY date) AS comulative_distance,
           date
    FROM Flight
    JOIN Commander ON Flight.commander_id = Commander.id
    JOIN Planet ON Flight.planet_id = Planet.id
  ) AS CommanderTotalAndComulativeDistance
) AS T WHERE comulative_distance > total_distance / 2;
