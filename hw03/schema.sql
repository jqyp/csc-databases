DROP TABLE IF EXISTS Flight;
DROP TABLE IF EXISTS Spacecraft;
DROP TABLE IF EXISTS Planet;
DROP TABLE IF EXISTS Government;

CREATE TABLE Government(id SERIAL PRIMARY KEY, value TEXT UNIQUE);

-- Планета, её название, расстояние до Земли, политический строй
CREATE TABLE Planet(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  distance NUMERIC(5,2),
  government_id INT REFERENCES Government,
  is_inhabited BOOLEAN);

-- Космический корабль, вместимость пассажиров и класс корабля
CREATE TABLE Spacecraft(
  id SERIAL PRIMARY KEY,
  capacity INT CHECK(capacity > 0),
  name TEXT UNIQUE,
  class INT CHECK(class BETWEEN 1 AND 3));

-- Полет на планету в означеную дату, выполняемый кораблем, пилотируемый капитаном
CREATE TABLE Flight(id INT PRIMARY KEY,
  spacecraft_id INT REFERENCES Spacecraft,
  planet_id INT REFERENCES Planet,
  date DATE
);

INSERT INTO Government(value)
SELECT unnest(ARRAY['Анархия', 'Коммунизм', 'Конфедерация', 'Олигархия', 'Демократия', 'Диктатура', 'Феодализм']);

CREATE FUNCTION GenGauss() RETURNS DOUBLE PRECISION AS $$
SELECT (random()+random()+random()+random()+random()) / 5::DOUBLE PRECISION;
$$ LANGUAGE SQL;


WITH PlanetNames AS (
  SELECT unnest(ARRAY[
    'Tibedied', 'Qube', 'Leleer', 'Biarge', 'Xequerin', 'Tiraor', 'Rabedira', 'Lave',
    'Zaatxe', 'Diusreza', 'Teaatis', 'Riinus', 'Esbiza', 'Ontimaxe', 'Cebetela', 'Ceedra',
    'Rizala', 'Atriso', 'Teanrebi', 'Azaqu', 'Retila', 'Sotiqu', 'Inleus', 'Onrira', 'Ceinzala',
    'Biisza', 'Legees', 'Quator', 'Arexe', 'Atrabiin', 'Usanat', 'Xeesle', 'Oreseren', 'Inera',
    'Inus', 'Isence', 'Reesdice', 'Terea', 'Orgetibe', 'Reorte', 'Ququor', 'Geinona',
    'Anarlaqu', 'Oresri', 'Esesla', 'Socelage', 'Riedquat', 'Gerege', 'Usle', 'Malama',
    'Aesbion', 'Alaza', 'Xeaqu', 'Raoror', 'Ororqu', 'Leesti', 'Geisgeza', 'Zainlabi',
    'Uscela', 'Isveve', 'Tioranin', 'Learorce', 'Esusti', 'Ususor', 'Maregeis', 'Aate',
    'Sori', 'Cemave', 'Arusqudi', 'Eredve', 'Regeatge', 'Edinso', 'Ra', 'Aronar',
    'Arraesso', 'Cevege', 'Orteve', 'Geerra', 'Soinuste', 'Erlage', 'Xeaan', 'Veis',
    'Ensoreus', 'Riveis', 'Bivea', 'Ermaso', 'Velete', 'Engema', 'Atrienxe', 'Beusrior',
    'Ontiat', 'Atarza', 'Arazaes', 'Xeeranre', 'Quzadi', 'Isti', 'Digebiti', 'Leoned',
    'Enzaer', 'Teraed'
  ]) AS name
)
INSERT INTO Planet(name, distance, government_id, is_inhabited)
SELECT name, (random() * 1000)::numeric(5,2), (0.5 + GenGauss() * (SELECT COUNT(*) FROM Government))::int, random()::INT::BOOLEAN
FROM PlanetNames;

UPDATE Planet SET distance=(SELECT MIN(distance) FROM Planet) WHERE distance=(SELECT MAX(distance) FROM Planet);


WITH Names AS (
  SELECT unnest(ARRAY[
      'Кедр', 'Орел', 'Сокол', 'Беркут', 'Ястреб', 'Чайка', 'Рубин', 'Алмаз', 'Аргон', 'Амур', 'Байкал', 'Антей', 'Буран'
  ]) AS name
)
INSERT INTO Spacecraft(name, capacity, class)
SELECT name, (3+random()*20)::INT, (0.5+random()*3)::INT
FROM Names;

-- ================================
-- Случайные полеты
WITH MaxValues AS (
  SELECT (SELECT MAX(id) FROM Spacecraft) AS spacecraft,
  (SELECT MAX(id) FROM Planet) AS planet
),
Flights AS (
  SELECT generate_series(1, 500) AS id
)
INSERT INTO Flight(id, spacecraft_id, planet_id, date)
SELECT id, (0.5 + random()*spacecraft)::INT,
    (0.5 + random()*planet)::INT,
    ('2084-01-01'::DATE + random()*365*5 * INTERVAL '1 day')::DATE
FROM MaxValues CROSS JOIN Flights;
