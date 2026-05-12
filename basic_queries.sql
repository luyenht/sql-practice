-- Lấy toàn bộ customer
SELECT *
FROM Customers;

-- Lọc customer ở Hanoi
SELECT *
FROM Customers
WHERE City = 'Hanoi';

-- Sắp xếp theo tên
SELECT *
FROM Customers
ORDER BY CustomerName;

-- Sắp xếp theo city
SELECT *
FROM Customers
ORDER BY city;

-- Lấy top 3
SELECT top (3) *
FROM Customers
ORDER BY city;
