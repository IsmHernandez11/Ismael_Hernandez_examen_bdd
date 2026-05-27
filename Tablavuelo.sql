CREATE TABLE vuelos (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    precio_boleto NUMERIC(10,2) NOT NULL CHECK (precio_boleto >= 0),
    asientos_disponibles INTEGER NOT NULL CHECK (asientos_disponibles >= 0)
);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('AA-101', 250.50, 20);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('LA-202', 300.00, 15);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('IB-303', 450.75, 3);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('AV-404', 520.00, 10);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('DL-505', 610.99, 0);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('UA-606', 275.30, 7);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('AF-707', 800.00, 2);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('KL-808', 720.50, 30);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('EM-909', 950.90, 1);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('QA-111', 1100.00, 5);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('CM-222', 330.00, 8);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('AM-333', 290.99, 12);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('SP-444', 199.99, 0);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('TA-555', 400.00, 18);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('BR-666', 640.40, 4);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('AR-777', 500.50, 6);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('CP-888', 380.80, 9);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('NZ-999', 760.70, 0);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('ET-121', 420.20, 14);

INSERT INTO vuelos(codigo, precio_boleto, asientos_disponibles)
VALUES ('JP-131', 870.00, 2);

SELECT *
FROM vuelos
WHERE asientos_disponibles < 5;

UPDATE vuelos
SET precio_boleto = precio_boleto * 1.15
WHERE id = 1;

DELETE FROM vuelos
WHERE asientos_disponibles = 0;