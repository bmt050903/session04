CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50),
    join_date DATE
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--1,INSERT dữ liệu
---Thêm 10 khách hàng với đầy đủ thông tin
---Thêm 15 sản phẩm thuộc ít nhất 3 danh mục khác nhau
---Thêm 8 đơn hàng với các trạng thái khác nhau
INSERT INTO customers (full_name, email, phone, city, join_date) VALUES
('Nguyen Van A', 'a@gmail.com', '0901', 'HCM', '2023-01-01'),
('Tran Thi B', 'b@gmail.com', NULL, 'HN', '2023-02-01'),
('Le Van C', 'c@gmail.com', '0903', 'DN', '2023-03-01'),
('Pham Thi D', 'd@gmail.com', NULL, 'HCM', '2023-04-01'),
('Hoang Van E', 'e@gmail.com', '0905', 'HN', '2023-05-01'),
('Vo Thi F', 'f@gmail.com', '0906', 'DN', '2023-06-01'),
('Dang Van G', 'g@gmail.com', NULL, 'HCM', '2023-07-01'),
('Bui Thi H', 'h@gmail.com', '0908', 'HN', '2023-08-01'),
('Do Van I', 'i@gmail.com', NULL, 'DN', '2023-09-01'),
('Nguyen Thi K', 'k@gmail.com', '0910', 'HCM', '2023-10-01');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop Dell', 'Electronics', 20000000, 5),
('iPhone 13', 'Electronics', 18000000, 3),
('Samsung TV', 'Electronics', 12000000, 0),
('Mouse Logitech', 'Electronics', 500000, 10),
('Keyboard', 'Electronics', 700000, 0),

('Áo thun', 'Clothing', 200000, 20),
('Quần jean', 'Clothing', 500000, 15),
('Áo khoác', 'Clothing', 800000, 5),
('Giày sneaker', 'Clothing', 1200000, 0),
('Mũ', 'Clothing', 150000, 8),

('Bàn', 'Furniture', 2000000, 2),
('Ghế', 'Furniture', 1000000, 0),
('Tủ', 'Furniture', 3000000, 1),
('Giường', 'Furniture', 5000000, 0),
('Kệ sách', 'Furniture', 1500000, 4);

INSERT INTO orders (customer_id, order_date, total_amount, status = '') VALUES
(1, '2023-11-01', 20000000, 'PENDING'),
(2, '2023-11-02', 500000, 'CONFIRMED'),
(3, '2023-11-03', 1200000, 'SHIPPED'),
(1, '2023-11-04', 700000, 'PENDING'),
(5, '2023-11-05', 3000000, 'CONFIRMED'),
(6, '2023-11-06', 150000, 'CANCELLED'),
(7, '2023-11-07', 800000, 'PENDING'),
(8, '2023-11-08', 2000000, 'CONFIRMED');

SELECT * FROM customers
SELECT * FROM products
SELECT * FROM orders

--2,UPDATE dữ liệu
---Cập nhật giá sản phẩm thuộc category 'Electronics' tăng 10%
UPDATE products
SET price = price * 1.1
WHERE category = 'Electronics';

---Cập nhật số điện thoại cho kháchhàng có email cụ thể
UPDATE customers
SET phone = 0123456789
WHERE email = 'a@gmail.com'

---Cập nhật trạng thái đơn hàng từ 'PENDING' sang 'CONFIRMED'
UPDATE orders
SET status = 'CONFIRMED'
WHERE status ='PENDING'

--3.DELETE dữ liệu
---Xóa các sản phẩm có số lượng tồn kho = 0
DELETE FROM products
WHERE stock_quantity = 0

---Xóa khách hàng không có đơn hàng nào
DELETE FROM customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id FROM orders
);

--Phần 2: Truy vấn dữ liệu
--1.Tìm khách hàng theo tên (sử dụng ILIKE)
SELECT *
FROM customers
WHERE full_name ILIKE '%nguyen%'

--2.Lọc sản phẩm theo khoảng giá (sử dụng BETWEEN)
SELECT * 
FROM products
WHERE price BETWEEN 500000 AND 700000

--3.Tìm khách hàng chưa có số điện thoại (IS NULL)
SELECT * 
FROM customers

WHERE phone IS NULL

--4.Top 5 sản phẩm có giá cao nhất (ORDER BY + LIMIT)
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5

--5.Phân trang danh sách đơn hàng (LIMIT + OFFSET)
SELECT *
FROM orders
LIMIT 5
OFFSET 5

--6.Đếm số khách hàng theo thành phố (DISTINCT + COUNT)
SELECT city, COUNT(DISTINCT customer_id) AS total_customers
FROM customers
GROUP BY city

--7.Tìm đơn hàng trong khoảng thời gian (BETWEEN với DATE)
SELECT *
FROM orders
WHERE order_date BETWEEN '2023-11-02' AND '2023-11-05'


--8.Sản phẩm chưa được bán (NOT EXISTS)
SELECT *
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id IS NOT NULL
);










