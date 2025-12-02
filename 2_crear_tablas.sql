--2 - Creación de tablas productos, proveedores y transacciones
CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
)

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL CHECK (precio > 0),
    cantidad_stock INT NOT NULL DEFAULT 0 CHECK (cantidad_stock >= 0)
)

CREATE TABLE transacciones (
    id_transaccion SERIAL PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('compra', 'venta')), 
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    id_producto INT NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
)