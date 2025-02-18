CREATE DATABASE InventoryDB;
USE InventoryDB;

CREATE TABLE Categories(Category_id INT PRIMARY KEY, CategoryName VARCHAR (50)); 

CREATE TABLE Product(Product_id INT PRIMARY KEY, Product_Name VARCHAR(55), Category_id INT, Unit_price DECIMAL(10,2), Units_instock INT, 
FOREIGN KEY (Category_id) REFERENCES Categories(Category_id));


CREATE TABLE Sales(SaleID INT PRIMARY KEY, Product_id INT, SaleDate DATE, QuantitySold INT, FOREIGN KEY (Product_id) REFERENCES Product(Product_id)); 

INSERT INTO Categories(Category_id, CategoryName) VALUES
(101, 'Electronics'),
(102, 'Mobile Devices'),
(103, 'Audio Accessories'),
(104, 'Televisions'),
(105, 'Cameras'),
(106, 'Appliances'),
(107, 'Home Cleaning'),
(108, 'Kitchen Appliances'),
(109, 'Personal Care'),
(110, 'Laundry Appliances'),
(111, 'Furniture'),
(112, 'Office Furniture'),
(113, 'Home Decor'),
(114, 'Wall Art'),
(115, 'Outdoor Living'),
(116, 'Sports Equipment');


INSERT INTO Product(Product_id, Product_Name, Category_id, Unit_price, Units_instock) VALUES
(1, 'Laptop', 101, 1200.00, 50),
(2, 'Smartphone', 102, 800.00, 100),
(3, 'Tablet', 102, 500.00, 75),
(4, 'Desktop Computer', 101, 1500.00, 30),
(5, 'Headphones', 103, 100.00, 200),
(6, 'Portable Speaker', 103, 150.00, 150),
(7, 'Television', 104, 2000.00, 40),
(8, 'Digital Camera', 105, 600.00, 80),
(9, 'Microwave Oven', 106, 300.00, 120),
(10, 'Refrigerator', 106, 1200.00, 60),
(11, 'Vacuum Cleaner', 107, 250.00, 100),
(12, 'Toaster', 108, 50.00, 150),
(13, 'Coffee Maker', 108, 100.00, 100),
(14, 'Blender', 108, 80.00, 120),
(15, 'Electric Kettle', 108, 40.00, 200),
(16, 'Iron', 109, 30.00, 180),
(17, 'Hair Dryer', 109, 25.00, 250),
(18, 'Washing Machine', 110, 800.00, 70),
(19, 'Dishwasher', 110, 700.00, 60),
(20, 'Sofa', 111, 600.00, 25),
(21, 'Bed', 111, 800.00, 20),
(22, 'Dining Table', 111, 400.00, 40),
(23, 'Office Chair', 112, 150.00, 80),
(24, 'Bookshelf', 112, 200.00, 60),
(25, 'Curtains', 113, 50.00, 300),
(26, 'Carpet', 113, 80.00, 150),
(27, 'Wall Clock', 114, 20.00, 500),
(28, 'Painting', 114, 300.00, 30),
(29, 'Outdoor Grill', 115, 150.00, 70),
(30, 'Garden Hose', 115, 30.00, 200),
(31, 'Patio Furniture Set', 115, 800.00, 15),
(32, 'Bicycle', 116, 400.00, 50),
(33, 'Treadmill', 116, 1000.00, 20),
(34, 'Dumbbell Set', 116, 150.00, 100),
(35, 'Yoga Mat', 116, 20.00, 150);

-- Update Product: SQL queries to update product information (e.g., update unit price or units in stock). 
	-- Update based on the Unit Price 
UPDATE Product 
SET Unit_price = Unit_price * 0.95 -- Unit_Price decrease of 5% for Electronics and Mobile Devices due to New Year Offers. 
WHERE Category_id = 102 OR Category_id = 101;

-- Update based on the Unit Stock after New Year
UPDATE Product
SET Units_instock = Units_instock - 5
WHERE Category_id = 101 OR Category_id = 102 AND Units_instock >= 5;

-- Update the Product Name (Desktop Computer) to Personal Computer 
SET SQL_SAFE_UPDATES = 0;
UPDATE Product 
SET Product_Name = "PC" 
WHERE Product_Name = "Desktop Computer"; 

-- Delete Product: SQL queries to delete a product (Thermometer) from the Products table.
DELETE FROM Product 
WHERE Product_Name = "Thermometer"; 

-- Record Sales: SQL queries to record product sales in the Sales table.
	-- Inserting sample sales data into the Sales table
INSERT INTO Sales(SaleID, Product_id, SaleDate, QuantitySold) VALUES
(1, 1, '2024-01-01', 3), -- Laptop sold on January 1, 2024, 3 units
(2, 5, '2024-01-02', 2), -- Headphones sold on January 2, 2024, 2 units
(3, 10, '2024-01-03', 1), -- Refrigerator sold on January 3, 2024, 1 unit
(4, 17, '2024-01-04', 4), -- Hair Dryer sold on January 4, 2024, 4 units
(5, 22, '2024-01-05', 2), -- Dining Table sold on January 5, 2024, 2 units
(6, 31, '2024-01-06', 1), -- Patio Furniture Set sold on January 6, 2024, 1 unit
(16, 5, '2024-01-16', 3), -- Headphones sold on January 16, 2024, 3 units
(17, 17, '2024-01-17', 2), -- Hair Dryer sold on January 17, 2024, 2 units
(18, 22, '2024-01-18', 1), -- Dining Table sold on January 18, 2024, 1 unit
(19, 31, '2024-01-19', 4), -- Patio Furniture Set sold on January 19, 2024, 4 units
(29, 5, '2024-01-29', 2), -- Headphones sold on January 29, 2024, 2 units
(30, 17, '2024-01-30', 3), -- Hair Dryer sold on January 30, 2024, 3 units
(31, 22, '2024-01-31', 1), -- Dining Table sold on January 31, 2024, 1 unit
(32, 31, '2024-02-01', 4), -- Patio Furniture Set sold on February 1, 2024, 4 units
(42, 5, '2024-02-11', 3), -- Headphones sold on February 11, 2024, 3 units
(43, 17, '2024-02-12', 2), -- Hair Dryer sold on February 12, 2024, 2 units
(44, 22, '2024-02-13', 1), -- Dining Table sold on February 13, 2024, 1 unit
(45, 31, '2024-02-14', 4); -- Patio Furniture Set sold on February 14, 2024, 4 units



-- Using Join Operation and CASE(WHEN, ELSE) to update the Units_instock in the Products table based on the QuantitySold in the Sales table. 
UPDATE Product 
LEFT JOIN Sales ON Product.Product_id = Sales.Product_id
SET Product.Units_instock = 
	CASE
		WHEN  Sales.QuantitySold IS NOT NULL THEN Product.Units_instock - Sales.QuantitySold
		ELSE Product.Units_instock
	END; 
    
SELECT * FROM Product

/* Remaning Work to Complete
Data Integrity: Implement data integrity constraints such as foreign key constraints between Products.CategoryID and Categories.CategoryID.
Data Validation: Include basic data validation checks (e.g., ensuring unit price is positive, quantity sold is non-negative).
Reports: Create SQL queries to generate basic reports such as total sales by product or category, current inventory status, etc.
Documentation: Provide documentation for your database schema, explaining the purpose of each table and its columns, along with sample queries for basic operations and reports.
Testing: Test your SQL queries thoroughly to ensure they perform as expected and handle edge cases gracefully (e.g., attempting to sell more units than available in stock).*/




