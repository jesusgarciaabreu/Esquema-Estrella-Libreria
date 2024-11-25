CREATE DATABASE libreria;

/*Tabla de Hechos hechos_ventas_libros:
Deberá almacenar la información de cada venta, como la cantidad de libros vendidos y el precio total de la venta.
Las columnas principales deben incluir: id_venta, id_tiempo, id_libro, id_cliente, id_tienda, cantidad y precio_total.*/
CREATE TABLE hechos_ventas_libros(id_venta SERIAL PRIMARY KEY,
								 id_tiempo INT,
								 id_libro INT,
								 id_cliente INT,
								 id_tienda INT,
								 cantidad INT,
								 precio_total NUMERIC(10,2));
								 
/*Tabla de Dimensión dim_tiempo:
Deberá almacenar la información relacionada con el tiempo de la venta, como el año, mes, día y trimestre.
Las columnas deben incluir: id_tiempo, año, mes, dia y trimestre.*/
CREATE TABLE dim_tiempo(id_tiempo SERIAL PRIMARY KEY,
					   anio INT,
					   mes INT,
					   trimestre INT);

/*Tabla de Dimensión dim_libro:
Deberá contener detalles de los libros, como el título, autor, género y precio unitario.
Las columnas deben incluir: id_libro, titulo, autor, genero y precio_unitario.*/
CREATE TABLE dim_libro(id_libro SERIAL PRIMARY KEY,
					  titulo VARCHAR(100),
					  autor VARCHAR(100),
					  genero VARCHAR(100),
					  precio_unitario NUMERIC(10,2));

/*Tabla de Dimensión dim_cliente:
Deberá incluir información sobre los clientes, como su nombre, edad, género y ciudad.
Las columnas deben incluir: id_cliente, nombre_cliente, edad, genero y ciudad.*/
CREATE TABLE dim_cliente(id_cliente SERIAL PRIMARY KEY,
						nombre_cliente VARCHAR(100),
						edad INT,
						genero CHAR(1),
						ciudad VARCHAR(100));

/*Tabla de Dimensión dim_tienda:
Deberá contener información sobre las tiendas, como el nombre, ciudad y país.
Las columnas deben incluir: id_tienda, nombre_tienda, ciudad y pais.*/
CREATE TABLE dim_tienda(id_tienda SERIAL PRIMARY KEY,
					   nombre_tienda VARCHAR(100),
					   ciudad VARCHAR(100),
					   pais VARCHAR(100));

-- Llaves foráneas
ALTER TABLE hechos_ventas_libros
ADD CONSTRAINT fk_tiempo
FOREIGN KEY (id_tiempo)
REFERENCES dim_tiempo(id_tiempo);

ALTER TABLE hechos_ventas_libros
ADD CONSTRAINT fk_libro
FOREIGN KEY (id_libro)
REFERENCES dim_libro(id_libro);

ALTER TABLE hechos_ventas_libros
ADD CONSTRAINT fk_cliente
FOREIGN KEY (id_cliente)
REFERENCES dim_cliente(id_cliente);

ALTER TABLE hechos_ventas_libros
ADD CONSTRAINT fk_tienda
FOREIGN KEY (id_tienda)
REFERENCES dim_tienda(id_tienda);

-- Registros
INSERT INTO dim_tiempo (anio, mes, trimestre) VALUES
(2024, 1, 1),
(2024, 2, 1),
(2024, 3, 1),
(2024, 4, 2),
(2024, 5, 2),
(2024, 6, 2),
(2024, 7, 3),
(2024, 8, 3),
(2024, 9, 3),
(2024, 10, 4);

INSERT INTO dim_libro (titulo, autor, genero, precio_unitario) VALUES
('El Alquimista', 'Paulo Coelho', 'Ficción', 15.99),
('1984', 'George Orwell', 'Ciencia Ficción', 12.50),
('Cien Años de Soledad', 'Gabriel García Márquez', 'Literatura', 20.00),
('El Principito', 'Antoine de Saint-Exupéry', 'Fábula', 10.00),
('Matar a un Ruiseñor', 'Harper Lee', 'Drama', 18.75),
('Orgullo y Prejuicio', 'Jane Austen', 'Romance', 14.50),
('Los Juegos del Hambre', 'Suzanne Collins', 'Aventura', 16.99),
('Sapiens', 'Yuval Noah Harari', 'Historia', 22.00),
('Harry Potter y la Piedra Filosofal', 'J.K. Rowling', 'Fantasía', 25.00),
('El Hobbit', 'J.R.R. Tolkien', 'Fantasía', 19.50);

INSERT INTO dim_cliente (nombre_cliente, edad, genero, ciudad) VALUES
('Ana López', 30, 'F', 'Ciudad de México'),
('Carlos Gómez', 25, 'M', 'Bogotá'),
('María Pérez', 40, 'F', 'Lima'),
('Juan Fernández', 35, 'M', 'Buenos Aires'),
('Lucía Martínez', 28, 'F', 'Madrid'),
('Pedro Sánchez', 32, 'M', 'Santiago'),
('Isabel Ramírez', 22, 'F', 'Caracas'),
('David Torres', 45, 'M', 'Montevideo'),
('Sofía Castillo', 26, 'F', 'Quito'),
('Jorge Ruiz', 50, 'M', 'Asunción');

INSERT INTO dim_tienda (nombre_tienda, ciudad, pais) VALUES
('Librería Central', 'Ciudad de México', 'México'),
('Lecturas Bogotanas', 'Bogotá', 'Colombia'),
('Libros y Café', 'Lima', 'Perú'),
('El Rincón Literario', 'Buenos Aires', 'Argentina'),
('La Casa del Libro', 'Madrid', 'España'),
('Página y Pluma', 'Santiago', 'Chile'),
('BiblioCaracas', 'Caracas', 'Venezuela'),
('Libros del Sur', 'Montevideo', 'Uruguay'),
('Esquina Literaria', 'Quito', 'Ecuador'),
('Paraguay Literario', 'Asunción', 'Paraguay');

INSERT INTO hechos_ventas_libros (id_tiempo, id_libro, id_cliente, id_tienda, cantidad, precio_total) VALUES
(1, 1, 1, 1, 2, 31.98),
(2, 2, 2, 2, 1, 12.50),
(3, 3, 3, 3, 3, 60.00),
(4, 4, 4, 4, 4, 40.00),
(5, 5, 5, 5, 2, 37.50),
(6, 6, 6, 6, 5, 72.50),
(7, 7, 7, 7, 1, 16.99),
(8, 8, 8, 8, 1, 22.00),
(9, 9, 9, 9, 1, 25.00),
(10, 10, 10, 10, 2, 39.00);

-- CONSULTAS
-- Consulta 1: Total de ventas (precio_total) por género de libro y mes.
SELECT 
    l.genero AS genero_libro,
    t.mes,
    SUM(h.precio_total) AS total_ventas
FROM 
    hechos_ventas_libros h
JOIN 
    dim_libro l ON h.id_libro = l.id_libro
JOIN 
    dim_tiempo t ON h.id_tiempo = t.id_tiempo
GROUP BY 
    l.genero, t.mes
ORDER BY 
    l.genero, t.mes;

-- Consulta 2: Cantidad total de libros vendidos por tienda y autor.
SELECT 
    ti.nombre_tienda,
    l.autor,
    SUM(h.cantidad) AS total_libros_vendidos
FROM 
    hechos_ventas_libros h
JOIN 
    dim_libro l ON h.id_libro = l.id_libro
JOIN 
    dim_tienda ti ON h.id_tienda = ti.id_tienda
GROUP BY 
    ti.nombre_tienda, l.autor
ORDER BY 
    ti.nombre_tienda, l.autor;

-- Consulta 3: Ingresos totales por ciudad de cliente y trimestre.
SELECT 
    c.ciudad AS ciudad_cliente,
    t.trimestre,
    SUM(h.precio_total) AS ingresos_totales
FROM 
    hechos_ventas_libros h
JOIN 
    dim_cliente c ON h.id_cliente = c.id_cliente
JOIN 
    dim_tiempo t ON h.id_tiempo = t.id_tiempo
GROUP BY 
    c.ciudad, t.trimestre
ORDER BY 
    c.ciudad, t.trimestre;

-- Consulta 4: Total de ventas de cada cliente (precio_total acumulado) y número de libros comprados.
SELECT 
    c.nombre_cliente,
    SUM(h.precio_total) AS total_ventas,
    SUM(h.cantidad) AS total_libros_comprados
FROM 
    hechos_ventas_libros h
JOIN 
    dim_cliente c ON h.id_cliente = c.id_cliente
GROUP BY 
    c.nombre_cliente
ORDER BY 
    total_ventas DESC;



