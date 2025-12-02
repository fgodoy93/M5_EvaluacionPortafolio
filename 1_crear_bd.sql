--1 - Creacion de la base de datos
--Eliminamos la base de datos si es que existe una con el mismo nombre.
DROP DATABASE IF EXISTS gestion_inventario;

-- Crear la base de datos
CREATE DATABASE gestion_inventario;

-- Conectarse a la base de datos
\c gestion_inventario;
