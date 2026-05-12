-- Lấy toàn bộ customer
SELECT *
FROM Customers;

-- Lọc customer ở Hanoi
SELECT *
FROM Customers
WHERE City = 'Hanoi';

-- Lọc customer ở Ninh Bình
SELECT *
FROM Customers
WHERE City = 'Ninh Bình';


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


-- Lấy city
SELECT city
FROM Customers
ORDER BY city;

-- Lấy tên
SELECT name
FROM Customers
ORDER BY city;
-- Lấy tên, city
SELECT name, city
FROM Customers
ORDER BY city;


