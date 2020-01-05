-- Условие
-- Для каждого капитана найти:
-- 1) Количество выполненных им полетов;
-- 2) процентное соотношение количества выполненных им
-- полётов к общему количеству полётов,сделанных всеми
-- капитанами. Процентное соотношение — это число в
-- интервале [0, 1].
--
-- Результат
-- commander TEXT, flight_count INT, flight_pctg NUMERIC

SELECT commander,
       flight_count,
       (flight_count::DECIMAL / total_flight_count)::NUMERIC(3, 2) flight_pctg
FROM (
  SELECT DISTINCT Commander.name AS commander,
                  COUNT(Flight.id) OVER (PARTITION BY Commander.id) flight_count,
                  COUNT(*) OVER () AS total_flight_count
  FROM Commander
  LEFT JOIN Flight ON Commander.id = Flight.commander_id
) AS CommanderFlightCount;
