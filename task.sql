-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
-- Start the transaction 
START TRANSACTION; 
INSERT INTO Orders(CustomerID, Date)
    VALUES (1, "2026-01-01");

-- And some data should be created inside the transaction
INSERT INTO OrderItems(OrderID, ProductID, Count)
    VALUES ((SELECT ID FROM Orders ORDER BY id DESC LIMIT 1), 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
COMMIT; 