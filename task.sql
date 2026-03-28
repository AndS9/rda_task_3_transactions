-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
-- Start the transaction 
START TRANSACTION;
-- And some data should be created inside the transaction

INSERT INTO Orders(CustomerID, Date)
    VALUES (1, "2026-01-01");

INSERT INTO OrderItems(OrderID, ProductID, Count)
    VALUES (LAST_INSERT_ID(), 1, 1);

COMMIT;
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;