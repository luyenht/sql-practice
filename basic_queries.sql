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