-- Условие
-- Найдите корабль, на котором чаще всего летал капитан
-- Ийон Тихий. Если таковых несколько, найдите их все.
--
-- Результат
-- spacecraft_name TEXT

WITH
IJON_SPACECRAFT_COUNTER AS (
SELECT Spacecraft.name AS spacecraft_name,
       COUNT(*) AS spacecraft_count
  FROM Commander
  JOIN Flight ON Commander.id = Flight.commander_id
  JOIN Spacecraft ON Flight.spacecraft_id = Spacecraft.id
  WHERE Commander.name = 'Ийон Тихий'
  GROUP BY (spacecraft_id, Spacecraft.name))
SELECT spacecraft_name FROM IJON_SPACECRAFT_COUNTER
WHERE spacecraft_count = (SELECT MAX(spacecraft_count) FROM IJON_SPACECRAFT_COUNTER);
