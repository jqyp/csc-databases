-- Условие
-- Найдите всех капитанов, не сделавших ни одного полёта.
--
-- Результат
-- commander_name TEXT

SELECT name AS commander_name
FROM Commander
LEFT JOIN Flight ON Commander.id = Flight.commander_id
WHERE Flight.id IS NULL;
