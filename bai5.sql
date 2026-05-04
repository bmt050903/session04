CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50),
	department VARCHAR(50),
	position VARCHAR(50),
	salary INT,
	bonus INT,
	join_year INT
);

INSERT INTO employees(full_name, department,position,salary,bonus,join_year) VALUES
('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
('Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
('Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
('Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
('Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
('Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);

SELECT * FROM employees

--1.Chuẩn hóa dữ liệu:
--Xóa các bản ghi trùng nhau hoàn toàn về tên, phòng ban và vị trí
DELETE FROM employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM employees
    GROUP BY full_name, department, position
);

--2.Cập nhật lương thưởng:
--Tăng 10% lương cho những nhân viên làm trong phòng IT có mức lương dưới 18,000,000
--Với nhân viên có bonus IS NULL, đặt giá trị bonus = 500000

UPDATE employees
SET salary = salary * 1.1
WHERE department = 'IT' and SALARY < 18000000

UPDATE employees
SET bonus = 500000
WHERE bonus IS NULL

--3.Truy vấn:
--Hiển thị danh sách nhân viên thuộc phòng IT hoặc HR, gia nhập sau năm 2020, và có tổng thu nhập (salary + bonus) lớn hơn 15,000,000
--Chỉ lấy 3 nhân viên đầu tiên sau khi sắp xếp giảm dần theo tổng thu nhập

SELECT *, (salary + bonus) AS TONG_TN
FROM employees








WHERE department IN ('IT', 'HR')
	AND join_year > 2020
	AND (salary + bonus) > 15000000

SELECT *, (salary + bonus) AS TONG_TN
FROM employees
ORDER BY TONG_TN DESC
LIMIT 3

--4.Truy vấn theo mẫu tên:
--Tìm tất cả nhân viên có tên bắt đầu bằng “Nguyễn” hoặc kết thúc bằng “Hân”
SELECT * 
FROM employees
WHERE full_name LIKE 'Nguyễn%' OR full_name LIKE '%Hân'

--5.Truy vấn đặc biệt:
--Liệt kê các phòng ban duy nhất có ít nhất một nhân viên có bonus IS NOT NULL
SELECT *
FROM employees
WHERE bonus IS NOT NULL

--6.Khoảng thời gian làm việc:
--Hiển thị nhân viên gia nhập trong khoảng từ 2019 đến 2022 (BETWEEN)
SELECT *
FROM employees
WHERE join_year BETWEEN 2019 AND 2022
























