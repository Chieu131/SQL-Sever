CREATE DATABASE CongTySanPham;
Go
USE CongTySanPham;
Go
CREATE TABLE DanhSachHang (
    MaSoHang INT PRIMARY KEY,
    TenHang NVARCHAR(100),
    DiaChi NVARCHAR(255),
    DienThoai NVARCHAR(20)
);
Go
INSERT INTO DanhSachHang (MaSoHang, TenHang, DiaChi, DienThoai)
VALUES (123, N'Asus', N'USA', '983232');
Go
CREATE TABLE DanhSachSanPham (
    STT INT PRIMARY KEY,
    TenHang NVARCHAR(100),
    MoTaHang NVARCHAR(255),
    DonVi NVARCHAR(50),
    Gia DECIMAL(10, 2),
    SoLuongHienCo INT
);
CREATE TABLE Product (
	MaSoHang INT,
	STT INT,
	PRIMARY KEY (MaSoHang, STT),
	FOREIGN KEY (MaSoHang) REFERENCES DanhSachHang (MaSoHang),
	FOREIGN KEY (STT) REFERENCES DanhSachSanPham (STT)
);
INSERT INTO Product VALUES (156, 6);
INSERT INTO Product VALUES (231, 1), (125, 5);
INSERT INTO Product VALUES (126, 4);
INSERT INTO Product VALUES (130, 2);
INSERT INTO Product VALUES (151, 3);

Go
INSERT INTO DanhSachSanPham (STT, TenHang, MoTaHang, DonVi, Gia, SoLuongHienCo)
VALUES 
(1, N'Máy Tính T450', N'Máy nhập cũ', N'Chiếc', 1000, 10),
(2, N'Điện Thoại Nokia5670', N'Điện thoại đang hot', N'Chiếc', 200, 200),
(3, N'Máy In Samsung 450', N'Máy in dạng loại bình', N'Chiếc', 100, 10);

GO
-- a) Hiển thị tất cả các hàng từ bảng DanhSachHang
SELECT * FROM DanhSachHang;

-- b) Hiển thị tất cả sản phẩm từ bảng DanhSachSanPham
SELECT * FROM DanhSachSanPham;

-- a) Liệt kê danh sách hàng theo thứ tự ngược của tên
SELECT * FROM DanhSachHang ORDER BY TenHang DESC;

-- b) Liệt kê danh sách sản phẩm của hàng theo thứ tự giá giảm dần
SELECT * FROM DanhSachSanPham ORDER BY Gia DESC;

-- c) Hiển thị thông tin của hàng Asus
SELECT * FROM DanhSachHang WHERE TenHang = N'Asus';

-- d) Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
SELECT * FROM DanhSachSanPham WHERE SoLuongHienCo < 11;

-- e) Liệt kê danh sách sản phẩm của hàng Asus
SELECT DanhSachSanPham.* FROM DanhSachSanPham
JOIN DanhSachHang ON DanhSachSanPham.STT = DanhSachHang.MaSoHang
WHERE DanhSachHang.TenHang = N'Asus';

-- a) Số lượng sản phẩm mà cửa hàng có
SELECT COUNT(*) AS SoLuongSanPham FROM DanhSachSanPham;

-- b) Số mặt hàng mà cửa hàng bán
SELECT COUNT(DISTINCT TenHang) AS SoMatHang FROM DanhSachSanPham;

-- c) Tổng số loại sản phẩm mới mỗi hãng có trong cửa hàng
SELECT TenHang, COUNT(*) AS SoLuongSanPhamMoi FROM DanhSachSanPham
GROUP BY TenHang;

-- d) Tổng số lượng sản phẩm của toàn cửa hàng
SELECT SUM(SoLuongHienCo) AS TongSoLuongSanPham FROM DanhSachSanPham;
