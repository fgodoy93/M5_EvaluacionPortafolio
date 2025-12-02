-- 5 - Transacciones SQL
BEGIN TRANSACTION;
INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('compra', CURRENT_TIMESTAMP, 2, 1, 1); 
UPDATE productos
SET cantidad_stock = cantidad_stock + 2
WHERE id_producto = 1;
--Si todo sale bien:
COMMIT; 
--Si tenemos algún error:
--ROLLBACK;