--- version 1---

SELECT 
    CustomerID,
    SUM(Amount) AS TotalAmount
FROM Orders
GROUP BY CustomerID;

--- version 2 group by theo name---
SELECT 
    Name,
    SUM(Amount) AS TotalAmount
FROM Orders
GROUP BY Name;