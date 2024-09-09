--Find all plushies that cost more than $20. Using WHERE
SELECT * 
FROM Plushies
WHERE price > 20.00;


--List all orders with customer names and plushie names. USING JOIN
SELECT Orders.id AS OrderID, 
       Customers.name AS CustomerName, 
       Plushies.name AS PlushieName, 
       OrderItems.quantity, 
       OrderItems.price_each
FROM OrderItems
JOIN Orders ON OrderItems.order_id = Orders.id
JOIN Plushies ON OrderItems.plushie_id = Plushies.id
JOIN Customers ON Orders.customer_id = Customers.id;


--Find the total stock for each type of plushie.USING GROUP BY
SELECT type, 
       SUM(stock) AS TotalStock
FROM Plushies
GROUP BY type;
