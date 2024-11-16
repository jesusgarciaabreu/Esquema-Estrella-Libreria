Diseñar y poblar un esquema estrella que permita analizar las ventas de una librería en línea. Se debe crear una tabla de hechos hechos_ventas_libros y varias tablas de dimensiones que permitan realizar análisis de ventas por varias perspectivas (tiempo, cliente, libro y tienda).

Requerimientos:
Tabla de Hechos hechos_ventas_libros:

Deberá almacenar la información de cada venta, como la cantidad de libros vendidos y el precio total de la venta.
Las columnas principales deben incluir: id_venta, id_tiempo, id_libro, id_cliente, id_tienda, cantidad y precio_total.
Tabla de Dimensión dim_tiempo:

Deberá almacenar la información relacionada con el tiempo de la venta, como el año, mes, día y trimestre.
Las columnas deben incluir: id_tiempo, año, mes, dia y trimestre.
Tabla de Dimensión dim_libro:

Deberá contener detalles de los libros, como el título, autor, género y precio unitario.
Las columnas deben incluir: id_libro, titulo, autor, genero y precio_unitario.
Tabla de Dimensión dim_cliente:

Deberá incluir información sobre los clientes, como su nombre, edad, género y ciudad.
Las columnas deben incluir: id_cliente, nombre_cliente, edad, genero y ciudad.
Tabla de Dimensión dim_tienda:

Deberá contener información sobre las tiendas, como el nombre, ciudad y país.
Las columnas deben incluir: id_tienda, nombre_tienda, ciudad y pais.
Instrucciones
Paso 1: Crear las Tablas
Usa comandos SQL para crear las tablas de acuerdo con las especificaciones anteriores. Asegúrate de establecer relaciones entre la tabla de hechos hechos_ventas_libros y las tablas de dimensiones mediante claves foráneas.

Paso 2: Insertar Datos
Inserta datos ficticios en cada tabla para simular ventas. Incluye al menos:

5 registros en dim_libro para representar diferentes libros.
5 registros en dim_cliente para representar diferentes clientes.
3 registros en dim_tienda para representar distintas tiendas.
3 registros en dim_tiempo para diferentes fechas.
10 registros en hechos_ventas_libros para representar ventas de libros.
Paso 3: Realizar Consultas de Análisis
Una vez creadas las tablas e insertados los datos, escribe y ejecuta las siguientes consultas en SQL:

Consulta 1: Total de ventas (precio_total) por género de libro y mes.
Consulta 2: Cantidad total de libros vendidos por tienda y autor.
Consulta 3: Ingresos totales por ciudad de cliente y trimestre.
Consulta 4: Total de ventas de cada cliente (precio_total acumulado) y número de libros comprados.
