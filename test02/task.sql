-- Пицца, её название, вес в граммах, стоимость в рублях
CREATE TABLE Pizza (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    weight INT NOT NULL CHECK(weight > 0),
    cost INT NOT NULL CHECK(cost > 0)
);

-- Продукт
CREATE TABLE Product (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- Продукт, хранящийся на складе
CREATE TABLE WarehouseItem (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL UNIQUE REFERENCES Product,
    weight INT NOT NULL CHECK(weight >= 0)
);

-- Ингредиент для пиццы. Количество продукта указано в граммах
CREATE TABLE Ingredient (
    id SERIAL PRIMARY KEY,
    pizza_id INT NOT NULL REFERENCES Pizza,
    product_id INT NOT NULL REFERENCES Product,
    weight INT NOT NULL CHECK (weight > 0),
    UNIQUE (pizza_id, product_id)
);

-- Клиент, его номер телефона и размер накопительной скидки
CREATE TABLE Customer (
    id SERIAL PRIMARY KEY,
    phone TEXT NOT NULL UNIQUE,
    discount INT CHECK (discount >= 0)
);

-- Статус заказа
CREATE TYPE OrderStatus AS ENUM(
    'принят',
    'в обработке',
    'отгружен',
    'выполнен'
);

-- Заказ. Когда, кому, по какому адресу доставить и статус
CREATE TABLE "Order" (
    id SERIAL PRIMARY KEY,
    delivery_time TIMESTAMP NOT NULL,
    customer_id INT NOT NULL REFERENCES Customer,
    address TEXT NOT NULL,
    status OrderStatus NOT NULL
);

-- Позиция в заказе
CREATE TABLE OrderItem (
    id SERIAL PRIMARY KEY,
    pizza_id INT NOT NULL REFERENCES Pizza,
    order_id INT NOT NULL REFERENCES "Order",
    count INT NOT NULL CHECK (count > 0),
    UNIQUE (order_id, pizza_id)
);

-- Поставщик. У поставщика есть название организации и контактный телефон
CREATE TABLE Provider (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT NOT NULL UNIQUE
);

-- Какой товар поставляется какими поставщиками и по какой цене
CREATE TABLE Supply (
    id SERIAL PRIMARY KEY,
    provider_id INT NOT NULL REFERENCES Provider,
    product_id INT NOT NULL REFERENCES Product,
    cost INT NOT NULL CHECK (cost > 0),
    UNIQUE (provider_id, product_id)
);
