-- 6 - Consultas Complejas

-- Total de ventas de un producto durante el mes anterior
SELECT p.id_producto, p.nombre,
COUNT(t.id_transaccion) AS numero_ventas,
    SUM(t.cantidad) AS unidades_vendidas,
    SUM(t.cantidad * t.precio_unitario) AS valor_total
FROM productos p
LEFT JOIN transacciones t ON p.id_producto = t.id_producto
WHERE t.tipo = 'venta'
    AND t.fecha >= CURRENT_DATE - INTERVAL '1 month'
    AND t.fecha < CURRENT_DATE
GROUP BY p.id_producto, p.nombre
ORDER BY valor_total DESC;

-- Productos con sus proveedores y transacciones
SELECT p.nombre AS producto, p.precio, p.cantidad_stock, prov.nombre AS proveedor, prov.telefono, t.tipo, t.fecha,
t.cantidad AS cantidad_transaccion, (t.cantidad * t.precio_unitario) AS total_transaccion
FROM productos p
INNER JOIN proveedores prov ON p.id_proveedor = prov.id_proveedor
LEFT JOIN transacciones t ON p.id_producto = t.id_producto
ORDER BY p.nombre, t.fecha DESC;

-- Subconsulta: Productos NO vendidos en los últimos 30 días

SELECT id_producto, nombre, cantidad_stock, precio
FROM productos
WHERE id_producto NOT IN (
    SELECT DISTINCT id_producto
    FROM transacciones
    WHERE tipo = 'venta'
        AND fecha >= CURRENT_DATE - INTERVAL '30 days'
)
ORDER BY cantidad_stock DESC;


INSERT INTO transacciones (tipo, fecha, cantidad, id_producto, id_proveedor)
VALUES ('compra', CURRENT_TIMESTAMP, 2, 1, 1);

UPDATE productos SET cantidad_stock = cantidad_stock + 2
WHERE id_producto = 1;

DELETE FROM productos WHERE id_producto = 1;

--CONSULTA QUE TRAE TODOS LAS TRANSACCIONES DE UN PROVEEDOR:
SELECT t.id_transaccion, t.tipo, t.fecha, t.cantidad, t.precio_unitario, p.nombre AS producto, prov.nombre AS proveedor
FROM transacciones t 
INNER JOIN productos p 
    ON t.id_producto = p.id_producto
INNER JOIN proveedores prov
    ON p.id_proveedor = prov.id_proveedor
WHERE prov.id_proveedor = 1   
ORDER BY t.fecha DESC;