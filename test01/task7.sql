-- Условие
-- Для каждого капитана найдите суммарное количество
-- перевезенных им пассажиров во всех сделанных им
-- полетах. Каждый конкретный пассажир должен
-- учитываться столько раз, сколько он произвел полетов с
-- этим капитаном
--
-- Результат
-- commander_name TEXT, pax_count BIGINT

SELECT Commander.name AS commander_name,
       COUNT(Pax.id) AS pax_count
FROM Commander
LEFT JOIN Flight ON Commander.id = Flight.commander_id
LEFT JOIN Booking ON Flight.id = Booking.flight_id
LEFT JOIN Pax ON Booking.pax_id = Pax.id
GROUP BY Commander.id;
