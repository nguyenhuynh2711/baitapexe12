create database QuanLyTrungTamDienTuBKE

-- Bảng users
CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY, -- mã số user
    user_name VARCHAR(25) NOT NULL, -- tên user
    user_email VARCHAR(55) NOT NULL UNIQUE, -- email
    user_pass VARCHAR(255) NOT NULL, -- mật khẩu
    updated_at DATETIME DEFAULT GETDATE(), -- thời gian cập nhật
    created_at DATETIME DEFAULT GETDATE() -- thời gian tạo
);

-- Bảng products
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY, -- mã số sản phẩm
    product_name VARCHAR(255) NOT NULL, -- tên sản phẩm
    product_price DECIMAL(18,2) NOT NULL, -- giá sản phẩm
    product_description TEXT NOT NULL, -- mô tả sản phẩm
    updated_at DATETIME DEFAULT GETDATE(), -- thời gian cập nhật
    created_at DATETIME DEFAULT GETDATE() -- thời gian tạo
);

-- Bảng orders
CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY, -- mã số đơn hàng
    user_id INT NOT NULL, -- mã user
    updated_at DATETIME DEFAULT GETDATE(), -- thời gian cập nhật
    created_at DATETIME DEFAULT GETDATE(), -- thời gian tạo
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Bảng order_details
CREATE TABLE order_details (
    order_detail_id INT IDENTITY(1,1) PRIMARY KEY, -- mã số chi tiết
    order_id INT NOT NULL, -- mã số đơn hàng
    product_id INT NOT NULL, -- mã số sản phẩm
    updated_at DATETIME DEFAULT GETDATE(), -- thời gian cập nhật
    created_at DATETIME DEFAULT GETDATE(), -- thời gian tạo
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


------------------ thêm dữ liệu vào các bảng --------------------------------------------------

-- 🔹 Cho phép chèn giá trị vào cột IDENTITY
SET IDENTITY_INSERT users ON;

-- 🔹 Thêm dữ liệu vào bảng users
INSERT INTO users (user_id, user_name, user_email, user_pass, updated_at, created_at) VALUES
(1, 'Nguyen Van An', 'an@gmail.com', 'pass123', GETDATE(), GETDATE()),
(2, 'Tran Thi Bich', 'bich@yahoo.com', 'pass456', GETDATE(), GETDATE()),
(3, 'Pham Hong Chau', 'chau@gmail.com', 'pass789', GETDATE(), GETDATE()),
(4, 'Le Quoc Dung', 'dung@hotmail.com', 'pass101', GETDATE(), GETDATE()),
(5, 'Hoang Minh Duc', 'duc@gmail.com', 'pass202', GETDATE(), GETDATE()),
(6, 'Bui Thi Hoa', 'hoa@gmail.com', 'pass303', GETDATE(), GETDATE()),
(7, 'Dang Huu Khanh', 'khanh@yahoo.com', 'pass404', GETDATE(), GETDATE()),
(8, 'Vu Ngoc Lan', 'lan@gmail.com', 'pass505', GETDATE(), GETDATE()),
(9, 'Do Thanh Mai', 'mai@outlook.com', 'pass606', GETDATE(), GETDATE()),
(10, 'Ngo Phuong Thao', 'thao@gmail.com', 'pass707', GETDATE(), GETDATE());

-- 🔹 Tắt `IDENTITY_INSERT` sau khi chèn xong
SET IDENTITY_INSERT users OFF;

SET IDENTITY_INSERT products ON;
-- 🔹 Thêm dữ liệu vào bảng products (Không cần `IDENTITY_INSERT` nếu không có cột IDENTITY)
INSERT INTO products (product_id, product_name, product_price, product_description, updated_at, created_at) VALUES
(1, 'Laptop', 1200.00, 'Laptop hieu suat cao', GETDATE(), GETDATE()),
(2, 'Dien thoai', 800.00, 'Dien thoai thong minh moi nhat', GETDATE(), GETDATE()),
(3, 'May tinh bang', 500.00, 'May tinh bang man hinh 10 inch', GETDATE(), GETDATE()),
(4, 'Man hinh', 300.00, 'Man hinh Full HD 24 inch', GETDATE(), GETDATE()),
(5, 'Ban phim', 50.00, 'Ban phim co', GETDATE(), GETDATE()),
(6, 'Chuot', 40.00, 'Chuot khong day choi game', GETDATE(), GETDATE()),
(7, 'Tai nghe', 100.00, 'Tai nghe chong on', GETDATE(), GETDATE()),
(8, 'Dong ho thong minh', 200.00, 'Dong ho theo doi suc khoe', GETDATE(), GETDATE()),
(9, 'Loa Bluetooth', 150.00, 'Loa Bluetooth khong day', GETDATE(), GETDATE()),
(10, 'Webcam', 80.00, 'Webcam HD', GETDATE(), GETDATE());

SET IDENTITY_INSERT products OFF;


-- 🔹 Cho phép chèn giá trị vào cột IDENTITY cho bảng orders
SET IDENTITY_INSERT orders ON;

-- 🔹 Thêm dữ liệu vào bảng orders (Ghi rõ user_id)
INSERT INTO orders (order_id, user_id, updated_at, created_at) VALUES
(1, 1, GETDATE(), GETDATE()),
(2, 2, GETDATE(), GETDATE()),
(3, 3, GETDATE(), GETDATE()),
(4, 4, GETDATE(), GETDATE()),
(5, 5, GETDATE(), GETDATE()),
(6, 6, GETDATE(), GETDATE()),
(7, 7, GETDATE(), GETDATE()),
(8, 8, GETDATE(), GETDATE()),
(9, 9, GETDATE(), GETDATE()),
(10, 10, GETDATE(), GETDATE());

-- 🔹 Tắt `IDENTITY_INSERT` sau khi chèn xong
SET IDENTITY_INSERT orders OFF;

-- 🔹 Cho phép chèn giá trị vào cột IDENTITY cho bảng order_details
SET IDENTITY_INSERT order_details ON;

-- 🔹 Thêm dữ liệu vào bảng order_details (Ghi rõ order_id và product_id)
INSERT INTO order_details (order_detail_id, order_id, product_id, updated_at, created_at) VALUES
(1, 1, 1, GETDATE(), GETDATE()),
(2, 2, 2, GETDATE(), GETDATE()),
(3, 3, 3, GETDATE(), GETDATE()),
(4, 4, 4, GETDATE(), GETDATE()),
(5, 5, 5, GETDATE(), GETDATE()),
(6, 6, 6, GETDATE(), GETDATE()),
(7, 7, 7, GETDATE(), GETDATE()),
(8, 8, 8, GETDATE(), GETDATE()),
(9, 9, 9, GETDATE(), GETDATE()),
(10, 10, 10, GETDATE(), GETDATE());

-- 🔹 Tắt `IDENTITY_INSERT` sau khi chèn xong
SET IDENTITY_INSERT order_details OFF;


--- Thêm dữ liệu để truy vấn --------------------------------------
SET IDENTITY_INSERT users ON;

INSERT INTO users (user_id, user_name, user_email, user_pass, updated_at, created_at) VALUES
(11, 'Nguyen Tien Dung', 'dungtien@gmail.com', 'pass111', GETDATE(), GETDATE()),
(12, 'Tran Van Nam', 'namtran@gmail.com', 'pass222', GETDATE(), GETDATE()),
(13, 'Pham Thi Huong', 'huongpham@yahoo.com', 'pass333', GETDATE(), GETDATE()),
(14, 'Le Van Khoa', 'khoa.le@gmail.com', 'pass444', GETDATE(), GETDATE()),
(15, 'Hoang Quoc Bao', 'baohoang@gmail.com', 'pass555', GETDATE(), GETDATE()),
(16, 'Bui Huu Phuc', 'phucbui@yahoo.com', 'pass666', GETDATE(), GETDATE()),
(17, 'Dang Ngoc Son', 'sondang@gmail.com', 'pass777', GETDATE(), GETDATE()),
(18, 'Vu Minh Tuan', 'tuanvu@gmail.com', 'pass888', GETDATE(), GETDATE()),
(19, 'Do Thi Cam', 'camdo@gmail.com', 'pass999', GETDATE(), GETDATE()),
(20, 'Ngo Huu Phong', 'phongngo@gmail.com', 'pass1010', GETDATE(), GETDATE()),
(21, 'Nguyen Van Cuong', 'cuongnv@gmail.com', 'pass1111', GETDATE(), GETDATE()),
(22, 'Tran Thi Thao', 'thaotran@yahoo.com', 'pass1212', GETDATE(), GETDATE()),
(23, 'Pham Hong Nhung', 'nhungpham@gmail.com', 'pass1313', GETDATE(), GETDATE()),
(24, 'Le Anh Tuan', 'anhtuan.le@gmail.com', 'pass1414', GETDATE(), GETDATE()),
(25, 'Hoang Thanh Binh', 'binhhoang@gmail.com', 'pass1515', GETDATE(), GETDATE()),
(26, 'Bui Hoang Long', 'longbui@yahoo.com', 'pass1616', GETDATE(), GETDATE()),
(27, 'Dang Van Hung', 'hungdang@gmail.com', 'pass1717', GETDATE(), GETDATE()),
(28, 'Vu Huu Loc', 'locvu@gmail.com', 'pass1818', GETDATE(), GETDATE()),
(29, 'Do Minh Hieu', 'hieudo@gmail.com', 'pass1919', GETDATE(), GETDATE()),
(30, 'Ngo Bao Khanh', 'khanhngo@gmail.com', 'pass2020', GETDATE(), GETDATE());

SET IDENTITY_INSERT users OFF;

SET IDENTITY_INSERT products ON;

INSERT INTO products (product_id, product_name, product_price, product_description, updated_at, created_at) VALUES
(11, 'Camera', 250.00, 'Camera an ninh full HD', GETDATE(), GETDATE()),
(12, 'Micro', 60.00, 'Micro thu âm chuyên nghiệp', GETDATE(), GETDATE()),
(13, 'Bàn làm việc', 180.00, 'Bàn gỗ công nghiệp', GETDATE(), GETDATE()),
(14, 'Ghế gaming', 220.00, 'Ghế công thái học', GETDATE(), GETDATE()),
(15, 'Ổ cứng SSD', 120.00, 'Ổ cứng SSD 1TB', GETDATE(), GETDATE()),
(16, 'RAM 16GB', 80.00, 'RAM DDR4 16GB', GETDATE(), GETDATE()),
(17, 'Card đồ họa', 450.00, 'Card RTX 3060', GETDATE(), GETDATE()),
(18, 'Bộ nguồn 750W', 130.00, 'Nguồn công suất thực', GETDATE(), GETDATE()),
(19, 'USB 64GB', 20.00, 'USB Kingston 64GB', GETDATE(), GETDATE()),
(20, 'Router WiFi', 90.00, 'Router băng tần kép', GETDATE(), GETDATE()),
(21, 'Ổ cứng HDD 2TB', 140.00, 'Ổ cứng WD Blue 2TB', GETDATE(), GETDATE()),
(22, 'Máy in', 300.00, 'Máy in laser đa năng', GETDATE(), GETDATE()),
(23, 'Loa vi tính', 110.00, 'Loa 2.1 công suất lớn', GETDATE(), GETDATE()),
(24, 'Đồng hồ cơ', 250.00, 'Đồng hồ cơ cao cấp', GETDATE(), GETDATE()),
(25, 'Bộ sạc nhanh', 35.00, 'Sạc nhanh 65W', GETDATE(), GETDATE()),
(26, 'Pin dự phòng', 45.00, 'Pin 20,000mAh', GETDATE(), GETDATE()),
(27, 'Bộ nhớ RAM 8GB', 60.00, 'RAM DDR4 8GB', GETDATE(), GETDATE()),
(28, 'Túi chống sốc', 25.00, 'Túi đựng laptop 15.6 inch', GETDATE(), GETDATE()),
(29, 'Chuột gaming', 55.00, 'Chuột chơi game RGB', GETDATE(), GETDATE()),
(30, 'Máy lọc không khí', 220.00, 'Máy lọc khí thông minh', GETDATE(), GETDATE());

SET IDENTITY_INSERT products OFF;

SET IDENTITY_INSERT orders ON;

INSERT INTO orders (order_id, user_id, updated_at, created_at) VALUES
(11, 11, GETDATE(), GETDATE()),
(12, 12, GETDATE(), GETDATE()),
(13, 13, GETDATE(), GETDATE()),
(14, 14, GETDATE(), GETDATE()),
(15, 15, GETDATE(), GETDATE()),
(16, 16, GETDATE(), GETDATE()),
(17, 17, GETDATE(), GETDATE()),
(18, 18, GETDATE(), GETDATE()),
(19, 19, GETDATE(), GETDATE()),
(20, 20, GETDATE(), GETDATE()),
(21, 21, GETDATE(), GETDATE()),
(22, 22, GETDATE(), GETDATE()),
(23, 23, GETDATE(), GETDATE()),
(24, 24, GETDATE(), GETDATE()),
(25, 25, GETDATE(), GETDATE()),
(26, 26, GETDATE(), GETDATE()),
(27, 27, GETDATE(), GETDATE()),
(28, 28, GETDATE(), GETDATE()),
(29, 29, GETDATE(), GETDATE()),
(30, 30, GETDATE(), GETDATE());

SET IDENTITY_INSERT orders OFF;

SET IDENTITY_INSERT order_details ON;

INSERT INTO order_details (order_detail_id, order_id, product_id, updated_at, created_at) VALUES
(11, 11, 11, GETDATE(), GETDATE()),
(12, 12, 12, GETDATE(), GETDATE()),
(13, 13, 13, GETDATE(), GETDATE()),
(14, 14, 14, GETDATE(), GETDATE()),
(15, 15, 15, GETDATE(), GETDATE()),
(16, 16, 16, GETDATE(), GETDATE()),
(17, 17, 17, GETDATE(), GETDATE()),
(18, 18, 18, GETDATE(), GETDATE()),
(19, 19, 19, GETDATE(), GETDATE()),
(20, 20, 20, GETDATE(), GETDATE()),
(21, 21, 21, GETDATE(), GETDATE()),
(22, 22, 22, GETDATE(), GETDATE()),
(23, 23, 23, GETDATE(), GETDATE()),
(24, 24, 24, GETDATE(), GETDATE()),
(25, 25, 25, GETDATE(), GETDATE()),
(26, 26, 26, GETDATE(), GETDATE()),
(27, 27, 27, GETDATE(), GETDATE()),
(28, 28, 28, GETDATE(), GETDATE()),
(29, 29, 29, GETDATE(), GETDATE()),
(30, 30, 30, GETDATE(), GETDATE());

SET IDENTITY_INSERT order_details OFF;

---- Thêm dữ liệu cho câu truy vấn thứ 4 ------------------------------------------------------------------------------------------
-- 🔹 Chèn dữ liệu mới vào users
SET IDENTITY_INSERT users ON;

INSERT INTO users (user_id, user_name, user_email, user_pass, updated_at, created_at) 
VALUES (31, 'Mai Thanh Son', 'son.mai@gmail.com', 'pass3131', GETDATE(), GETDATE());

SET IDENTITY_INSERT users OFF;

SELECT * FROM products WHERE product_id = 22;
-- 🔹 Chèn dữ liệu mới vào orders
SET IDENTITY_INSERT orders ON;

INSERT INTO orders (order_id, user_id, updated_at, created_at) 
VALUES (32, 31, GETDATE(), GETDATE());

SET IDENTITY_INSERT orders OFF;


-- 🔹 Chèn dữ liệu mới vào order_details
SET IDENTITY_INSERT order_details ON;

INSERT INTO order_details (order_detail_id, order_id, product_id, updated_at, created_at) 
VALUES (38, 32, 22, GETDATE(), GETDATE());

SET IDENTITY_INSERT order_details OFF;


-- 🔹 Tắt kiểm tra khóa ngoại
ALTER TABLE order_details NOCHECK CONSTRAINT ALL;
ALTER TABLE orders NOCHECK CONSTRAINT ALL;
ALTER TABLE products NOCHECK CONSTRAINT ALL;
ALTER TABLE users NOCHECK CONSTRAINT ALL;

-- 🔹 Xóa dữ liệu theo đúng thứ tự
DELETE FROM order_details WHERE product_id = 21;  -- Xóa trước để tránh lỗi khóa ngoại
DELETE FROM order_details WHERE order_id IN (SELECT order_id FROM orders WHERE user_id = 31);
DELETE FROM orders WHERE user_id = 31;
DELETE FROM products WHERE product_id = 21;
DELETE FROM users WHERE user_id = 31;

-- 🔹 Bật lại kiểm tra khóa ngoại
ALTER TABLE order_details CHECK CONSTRAINT ALL;
ALTER TABLE orders CHECK CONSTRAINT ALL;
ALTER TABLE products CHECK CONSTRAINT ALL;
ALTER TABLE users CHECK CONSTRAINT ALL;

--- Thêm dữ liệu vào câu truy vấn thứ 9 ---------------------------------------------------------------------------------------

SET IDENTITY_INSERT users ON;

INSERT INTO users (user_id, user_name, user_email, user_pass, updated_at, created_at) 
VALUES 
(32, 'Hai An', 'hai.an@gmail.com', 'pass3232', GETDATE(), GETDATE()),
(33, 'Bao Linh', 'bao.linh@gmail.com', 'pass3333', GETDATE(), GETDATE());

SET IDENTITY_INSERT users OFF;


SET IDENTITY_INSERT orders ON;

INSERT INTO orders (order_id, user_id, updated_at, created_at) 
VALUES 
(33, 32, GETDATE(), GETDATE()), -- Hải An đặt hàng mới
(34, 33, GETDATE(), GETDATE()); -- Bảo Linh đặt hàng mới

SET IDENTITY_INSERT orders OFF;


SET IDENTITY_INSERT order_details ON;

INSERT INTO order_details (order_detail_id, order_id, product_id, updated_at, created_at) 
VALUES 
(40, 33, 3, GETDATE(), GETDATE()), -- Hải An mua máy tính bảng
(41, 34, 7, GETDATE(), GETDATE()); -- Bảo Linh mua tai nghe

SET IDENTITY_INSERT order_details OFF;

DELETE FROM order_details WHERE order_detail_id IN (40, 41);
DELETE FROM orders WHERE order_id IN (33, 34);
DELETE FROM users WHERE user_id IN (32, 33);



--- Để xóa tất cả các dữ liệu được thêm vào -----------------------------------------------------------------------------------
-- Tắt ràng buộc khóa ngoại
ALTER TABLE order_details NOCHECK CONSTRAINT ALL;
ALTER TABLE orders NOCHECK CONSTRAINT ALL;

-- Xóa dữ liệu theo thứ tự tránh lỗi khóa ngoại
DELETE FROM order_details;
DELETE FROM orders;
DELETE FROM products;
DELETE FROM users;

-- Reset IDENTITY về 1
DBCC CHECKIDENT ('users', RESEED, 0);
DBCC CHECKIDENT ('products', RESEED, 0);
DBCC CHECKIDENT ('orders', RESEED, 0);
DBCC CHECKIDENT ('order_details', RESEED, 0);

-- Bật lại ràng buộc khóa ngoại
ALTER TABLE order_details CHECK CONSTRAINT ALL;
ALTER TABLE orders CHECK CONSTRAINT ALL;


