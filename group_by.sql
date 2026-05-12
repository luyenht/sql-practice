SELECT 
    CustomerID,
    SUM(Amount) AS TotalAmount
FROM Orders
GROUP BY CustomerID;