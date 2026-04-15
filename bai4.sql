CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price BIGINT,
    stock INT,
    manufacturer VARCHAR(50)
);

INSERT INTO products (name, category, price, stock, manufacturer) VALUES
('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
('Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
('Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
('Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
('iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
('Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');

SELECT * FROM products

--1.Thêm sản phẩm “Chuột không dây Logitech M170”, loại Phụ kiện, giá 300000, tồn kho 20, hãng Logitech
INSERT INTO products (name, category, price, stock, manufacturer)
VALUES ('Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');

--2,Tăng giá tất cả sản phẩm của Apple thêm 10%
UPDATE products
SET price = price * 1.1
WHERE manufacturer = 'Apple';

--3.Xóa sản phẩm có stock = 0
DELETE FROM products
WHERE stock = 0;

-- 4.Hiển thị sản phẩm có price BETWEEN 1000000 AND 30000000
SELECT *
FROM products
WHERE price BETWEEN 10000000 AND 30000000;

--5.Hiển thị sản phẩm có stock IS NULL
SELECT *
FROM products
WHERE stock IS NULL;

--6.Liệt kê danh sách hãng sản xuất duy nhất
SELECT DISTINCT manufacturer
FROM products;

--7.Hiển thị toàn bộ sản phẩm, sắp xếp giảm dần theo giá, sau đó tăng dần theo tên
SELECT *
FROM products
ORDER BY price DESC, name ASC;

8--Tìm sản phẩm có tên chứa từ “laptop” (không phân biệt hoa thường)
SELECT *
FROM products
WHERE name ILIKE '%laptop%';

--9.Lấy về 2 sản phẩm đầu tiên sau khi sắp xếp theo giá giảm dần .
SELECT *
FROM products
ORDER BY price DESC
LIMIT 2;






