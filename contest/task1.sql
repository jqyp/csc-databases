-- Условие
-- Найдити суммарное количество полётов, на которых
-- присутствовал хотя бы один пассажир-тролль.
--
-- Результат
-- result INT

SELECT COUNT(*) AS result
FROM (
  SELECT DISTINCT Booking.flight_id
  FROM Flight
  JOIN Booking ON Flight.id = Booking.flight_id
  JOIN Pax ON Booking.pax_id = Pax.id
  WHERE race = 'Trolls'
) AS FlightWithTrolls;
