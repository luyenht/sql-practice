SELECT 
    c.CustomerName,
    o.OrderDate,
    o.Amount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;