Create database ShopDatabase
Use ShopDatabase
GO
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName NVARCHAR(255),
    Address NVARCHAR(255),
    PhoneNumber VARCHAR(255),
    OrderDate DATE
);
GO
CREATE TABLE OrderItems (
    ItemID INT PRIMARY KEY,
    OrderID INT,
    ItemName NVARCHAR(255),
    Description NVARCHAR(255),
    Unit NVARCHAR(255),
    Price DECIMAL(10, 2),
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
GO
CREATE TABLE Product(
	ProductID  INT PRIMARY KEY,
	NameProduct NVARCHAR(50),
	Unit NVARCHAR(10),
	Price DECIMAL(10, 2),
	Quantity INT,
	Item_Status NVARCHAR(20),
)
SELECT * FROM Product
Drop Table Product
GO
-- Thêm đơn hàng vào bảng Orders
INSERT INTO Orders (OrderID, CustomerName, Address, PhoneNumber, OrderDate)
VALUES (123, N'Nguyễn Văn An', N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội', '987654321', '2009-11-18');
GO
-- Thêm các mặt hàng vào bảng OrderItems
INSERT INTO OrderItems (ItemID, OrderID, ItemName, Description, Unit, Price, Quantity, TotalPrice)
VALUES (1, 123, N'Máy Tính T450', N'Máy nhập mới', N'Chiếc', 1000, 1, 1000),
       (2, 123, N'Điện Thoại Nokia5670', N'Điện thoại đang hot', N'Chiếc', 200, 2, 400),
       (3, 123, N'Máy In Samsung450', N'Máy in đang ế', N'Chiếc', 100, 1, 100);
GO

-- Thêm đơn hàng thứ hai vào bảng Orders
INSERT INTO Orders (OrderID, CustomerName, Address, PhoneNumber, OrderDate)
VALUES (124, N'Trần Thị B', N'222 Lê Duẩn, Hai Bà Trưng, Hà Nội', '123456789', '2009-11-19');
GO

-- Thêm các mặt hàng vào bảng OrderItems
INSERT INTO Product(ProductID, NameProduct, Unit, Quantity, Price, Item_Status)
VALUES (1, N'Máy Tính T460', N'Chiếc',2,110,N'Hết' ),
       (2, N'Điện Thoại Nokia5680', N'Chiếc', 2, 420,N'còn 3 '),
       (3, N'Máy In Samsung460', N'Chiếc',2, 110,N'còn hàng cũ');
GO

-- a) Liệt kê danh sách khách hàng đã mua hàng ở cửa hàng.
SELECT DISTINCT CustomerName FROM Orders;
GO
-- b) Liệt kê danh sách sản phẩm của của hàng.
SELECT DISTINCT ItemName FROM OrderItems;
GO
-- c) Liệt kê danh sách các đơn đặt hàng của cửa hàng.
SELECT * FROM Orders;
GO
-- a) Liệt kê danh sách khách hàng theo thứ thự alphabet.
SELECT DISTINCT CustomerName FROM Orders ORDER BY CustomerName;

-- b) Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
SELECT DISTINCT ItemName, Price FROM OrderItems ORDER BY Price DESC;

-- c) Liệt kê các sản phẩm mà khách hàng Nguyễn Văn An đã mua.
SELECT ItemName FROM OrderItems WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerName = 'Nguyễn Văn An');

GO
-- a) Số khách hàng đã mua ở cửa hàng.
SELECT COUNT(DISTINCT CustomerName) FROM Orders;

-- b) Số mặt hàng mà cửa hàng bán.
SELECT COUNT(DISTINCT ItemName) FROM OrderItems;

-- c) Tổng tiền của từng đơn hàng
SELECT OrderID, SUM(TotalPrice) FROM OrderItems GROUP BY OrderID;
