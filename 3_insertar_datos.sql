--3 -Inserta datos en las tablas productos, proveedores y transacciones.
-- Insertar Proveedores
INSERT INTO proveedores (nombre, direccion, telefono, email) VALUES
('Distribuidor Raquetas', 'Av. Colón 9123, Hualpén', '+56912345678', 'contacto@draquetas.cl'),
('Shop Tenis', 'Paicaví 456, Concepción', '+56987654321', 'ventas@shoptenis.cl'),
('Importadora de Ropa Deportiva', 'Av. Libertad 789, Talcahuano', '+56923456789', 'info@ropadeportiva.cl');

-- Insertar Productos
INSERT INTO productos (nombre, descripcion, precio, cantidad_inventario, id_proveedor) VALUES
('Raqueta Wilson Clash 100', 'Raqueta profesional de grafito, equilibrio control/potencia', 189990, 15, 1),
('Pala Padel Bullpadel', 'Pala forma diamante con núcleo de goma EVA', 145900, 8, 1),
('Overgrip Pack x3', 'Cinta de agarre antideslizante colores variados', 5990, 100, 1),
('Tubo Pelotas Penn x3', 'Pelotas de tenis alta presión para cancha dura', 6990, 200, 2),
('Zapatillas Court Zoom', 'Zapatillas con suela espiga para arcilla', 79990, 25, 2),
('Bolso Raquetero 6x', 'Bolso térmico con capacidad para 6 raquetas', 45000, 10, 2),
('Red de Tenis Oficial', 'Red de medidas oficiales con cable de acero', 120000, 4, 2),
('Polera Dry-Fit Azul', 'Camiseta respirable tecnología anti-sudor', 19990, 50, 3),
('Short Tenis Blanco', 'Pantalón corto con bolsillos profundos para pelotas', 22500, 40, 3),
('Calcetines Deportivos x3', 'Pack de calcetines acolchados media caña', 9990, 60, 3),
('Jockey Visera Curva', 'Gorra deportiva ligera y ajustable', 12990, 30, 3);

-- Insertar Transacciones de Compra
INSERT INTO Transacciones (tipo_transaccion, fecha_transaccion, cantidad, precio_unitario, id_producto, id_proveedor) VALUES
('compra', '2025-10-15 09:30:00', 50, 4500, 4, 2),
('compra', '2025-10-20 11:00:00', 20, 12000, 8, 3),
('compra', '2025-11-08 09:15:00', 50, 38000.00, 3, 2);

-- Insertar Transacciones de Venta
INSERT INTO Transacciones (tipo_transaccion, fecha_transaccion, cantidad, precio_unitario, id_producto, id_proveedor) VALUES
('venta', '2025-11-12 16:30:00', 1, 189990, 1, 2),
('venta', '2025-11-10 12:15:00', 2, 9990, 10, NULL),
('venta', '2023-11-10 12:15:00', 2, 5990, 3, NULL);