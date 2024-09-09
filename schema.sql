-- Dropping Tables if They Already Exist
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS PlushieSuppliers;
DROP TABLE IF EXISTS Plushies;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Shippings;


-- Creating Tables
CREATE TABLE Customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(15)
);

CREATE TABLE Plushies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    type VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

CREATE TABLE Orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

CREATE TABLE OrderItems (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INT,
    plushie_id INT,
    quantity INT,
    price_each DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (plushie_id) REFERENCES Plushies(id)
);

CREATE TABLE Suppliers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    contact_info VARCHAR(255)
);

CREATE TABLE PlushieSuppliers (
    plushie_id INT,
    supplier_id INT,
    supply_date DATE,
    FOREIGN KEY (plushie_id) REFERENCES Plushies(id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id),
    PRIMARY KEY (plushie_id, supplier_id)
);

-- Inserting Customers
INSERT INTO Customers (name, email, phone) VALUES 
('Ash Ketchum', 'ash@pokemon.com', '1234567890'),
('Misty Waterflower', 'misty@pokemon.com', '2345678901'),
('Brock Harrison', 'brock@pokemon.com', '3456789012'),
('Jessie', 'jessie@teamrocket.com', '4567890123'),
('James', 'james@teamrocket.com', '5678901234');

-- Inserting Plushies
INSERT INTO Plushies (name, type, price, stock) VALUES 
('Pikachu', 'Electric', 19.99, 50),
('Charmander', 'Fire', 17.99, 40),
('Bulbasaur', 'Grass', 18.99, 30),
('Squirtle', 'Water', 16.99, 45),
('Jigglypuff', 'Fairy', 14.99, 35),
('Eevee', 'Normal', 22.99, 60),
('Gengar', 'Ghost', 23.99, 20),
('Snorlax', 'Normal', 25.99, 15),
('Mewtwo', 'Psychic', 29.99, 10),
('Psyduck', 'Water', 13.99, 50);

-- Inserting Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES 
(1, '2024-09-01', 59.97),
(2, '2024-09-02', 34.98),
(3, '2024-09-03', 52.97),
(4, '2024-09-04', 33.98),
(5, '2024-09-05', 49.97);

-- Inserting OrderItems
INSERT INTO OrderItems (order_id, plushie_id, quantity, price_each) VALUES 
(1, 1, 2, 19.99),
(1, 2, 1, 17.99),
(2, 3, 2, 18.99),
(3, 4, 3, 16.99),
(4, 5, 2, 14.99),
(5, 1, 1, 19.99),
(5, 3, 2, 18.99);

-- Inserting Suppliers
INSERT INTO Suppliers (name, contact_info) VALUES 
('Kanto Supplies', 'kanto@supplies.com'),
('Johto Traders', 'johto@traders.com'),
('Hoenn Goods', 'hoenn@goods.com');

-- Inserting PlushieSuppliers
INSERT INTO PlushieSuppliers (plushie_id, supplier_id, supply_date) VALUES 
(1, 1, '2024-08-15'),
(2, 2, '2024-08-16'),
(3, 3, '2024-08-17'),
(4, 1, '2024-08-18'),
(5, 2, '2024-08-19'),
(6, 3, '2024-08-20'),
(7, 1, '2024-08-21'),
(8, 2, '2024-08-22'),
(9, 3, '2024-08-23'),
(10, 1, '2024-08-24');
