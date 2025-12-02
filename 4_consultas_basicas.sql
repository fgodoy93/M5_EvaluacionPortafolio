-- 4 - Consultas Básicas

--Recupera todos los productos disponibles en el inventario.
SELECT id_producto, nombre, descripcion, precio, cantidad_inventario 
FROM productos
WHERE cantidad_inventario > 0;

-- Recupera todos los proveedores que suministran productos específicos.
SELECT DISTINCT p.nombre, p.email 
FROM proveedores p
JOIN transacciones t ON p.id_proveedor = t.id_proveedor
WHERE t.id_producto = 1 AND t.tipo = 'compra';

--Consulta las transacciones realizadas en una fecha específica.
SELECT t.id_transaccion, t.tipo_transaccion, t.fecha_transaccion, p.nombre AS producto, t.cantidad
FROM transacciones t
INNER JOIN productos p ON t.id_producto = p.id_producto
WHERE DATE(t.fecha_transaccion) = '2024-11-10';

-- Actualizar inventario después de una venta
UPDATE productos
SET cantidad_stock = cantidad_stock - 5
WHERE id_producto = 1 AND cantidad_stock >= 5;

-- Actualizar inventario después de una compra
UPDATE productos
SET cantidad_stock = cantidad_stock + 5
WHERE id_producto = 2;

-- Actualizar precio de un producto
UPDATE productos
SET precio = 199990
WHERE id_producto = 1;

-- Elimina un producto de la base de datos si ya no está disponible.
DELETE FROM productos WHERE cantidad_stock = 0;

--Numero total de productos vendidos:
SELECT SUM(cantidad) as total_unidades_vendidas
FROM transacciones
WHERE tipo = 'venta';

--Valor total de las compras:
SELECT SUM(t.cantidad * p.precio) AS valor_total_compras
FROM transacciones t
INNER JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'compra';
