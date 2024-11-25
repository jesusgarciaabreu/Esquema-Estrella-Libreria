--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dim_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_cliente (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(100),
    edad integer,
    genero character(1),
    ciudad character varying(100)
);


ALTER TABLE public.dim_cliente OWNER TO postgres;

--
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNER TO postgres;

--
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_cliente_id_cliente_seq OWNED BY public.dim_cliente.id_cliente;


--
-- Name: dim_libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_libro (
    id_libro integer NOT NULL,
    titulo character varying(100),
    autor character varying(100),
    genero character varying(100),
    precio_unitario numeric(10,2)
);


ALTER TABLE public.dim_libro OWNER TO postgres;

--
-- Name: dim_libro_id_libro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_libro_id_libro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_libro_id_libro_seq OWNER TO postgres;

--
-- Name: dim_libro_id_libro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_libro_id_libro_seq OWNED BY public.dim_libro.id_libro;


--
-- Name: dim_tiempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_tiempo (
    id_tiempo integer NOT NULL,
    anio integer,
    mes integer,
    trimestre integer
);


ALTER TABLE public.dim_tiempo OWNER TO postgres;

--
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_tiempo_id_tiempo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_tiempo_id_tiempo_seq OWNER TO postgres;

--
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_tiempo_id_tiempo_seq OWNED BY public.dim_tiempo.id_tiempo;


--
-- Name: dim_tienda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_tienda (
    id_tienda integer NOT NULL,
    nombre_tienda character varying(100),
    ciudad character varying(100),
    pais character varying(100)
);


ALTER TABLE public.dim_tienda OWNER TO postgres;

--
-- Name: dim_tienda_id_tienda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dim_tienda_id_tienda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dim_tienda_id_tienda_seq OWNER TO postgres;

--
-- Name: dim_tienda_id_tienda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dim_tienda_id_tienda_seq OWNED BY public.dim_tienda.id_tienda;


--
-- Name: hechos_ventas_libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hechos_ventas_libros (
    id_venta integer NOT NULL,
    id_tiempo integer,
    id_libro integer,
    id_cliente integer,
    id_tienda integer,
    cantidad integer,
    precio_total numeric(10,2)
);


ALTER TABLE public.hechos_ventas_libros OWNER TO postgres;

--
-- Name: hechos_ventas_libros_id_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hechos_ventas_libros_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hechos_ventas_libros_id_venta_seq OWNER TO postgres;

--
-- Name: hechos_ventas_libros_id_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hechos_ventas_libros_id_venta_seq OWNED BY public.hechos_ventas_libros.id_venta;


--
-- Name: dim_cliente id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.dim_cliente_id_cliente_seq'::regclass);


--
-- Name: dim_libro id_libro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_libro ALTER COLUMN id_libro SET DEFAULT nextval('public.dim_libro_id_libro_seq'::regclass);


--
-- Name: dim_tiempo id_tiempo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo ALTER COLUMN id_tiempo SET DEFAULT nextval('public.dim_tiempo_id_tiempo_seq'::regclass);


--
-- Name: dim_tienda id_tienda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tienda ALTER COLUMN id_tienda SET DEFAULT nextval('public.dim_tienda_id_tienda_seq'::regclass);


--
-- Name: hechos_ventas_libros id_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hechos_ventas_libros ALTER COLUMN id_venta SET DEFAULT nextval('public.hechos_ventas_libros_id_venta_seq'::regclass);


--
-- Data for Name: dim_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_cliente (id_cliente, nombre_cliente, edad, genero, ciudad) FROM stdin;
1	Ana L├│pez	30	F	Ciudad de M├®xico
2	Carlos G├│mez	25	M	Bogot├í
3	Mar├¡a P├®rez	40	F	Lima
4	Juan Fern├índez	35	M	Buenos Aires
5	Luc├¡a Mart├¡nez	28	F	Madrid
6	Pedro S├ínchez	32	M	Santiago
7	Isabel Ram├¡rez	22	F	Caracas
8	David Torres	45	M	Montevideo
9	Sof├¡a Castillo	26	F	Quito
10	Jorge Ruiz	50	M	Asunci├│n
\.


--
-- Data for Name: dim_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_libro (id_libro, titulo, autor, genero, precio_unitario) FROM stdin;
1	El Alquimista	Paulo Coelho	Ficci├│n	15.99
2	1984	George Orwell	Ciencia Ficci├│n	12.50
3	Cien A├▒os de Soledad	Gabriel Garc├¡a M├írquez	Literatura	20.00
4	El Principito	Antoine de Saint-Exup├®ry	F├íbula	10.00
5	Matar a un Ruise├▒or	Harper Lee	Drama	18.75
6	Orgullo y Prejuicio	Jane Austen	Romance	14.50
7	Los Juegos del Hambre	Suzanne Collins	Aventura	16.99
8	Sapiens	Yuval Noah Harari	Historia	22.00
9	Harry Potter y la Piedra Filosofal	J.K. Rowling	Fantas├¡a	25.00
10	El Hobbit	J.R.R. Tolkien	Fantas├¡a	19.50
\.


--
-- Data for Name: dim_tiempo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_tiempo (id_tiempo, anio, mes, trimestre) FROM stdin;
1	2024	1	1
2	2024	2	1
3	2024	3	1
4	2024	4	2
5	2024	5	2
6	2024	6	2
7	2024	7	3
8	2024	8	3
9	2024	9	3
10	2024	10	4
\.


--
-- Data for Name: dim_tienda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_tienda (id_tienda, nombre_tienda, ciudad, pais) FROM stdin;
1	Librer├¡a Central	Ciudad de M├®xico	M├®xico
2	Lecturas Bogotanas	Bogot├í	Colombia
3	Libros y Caf├®	Lima	Per├║
4	El Rinc├│n Literario	Buenos Aires	Argentina
5	La Casa del Libro	Madrid	Espa├▒a
6	P├ígina y Pluma	Santiago	Chile
7	BiblioCaracas	Caracas	Venezuela
8	Libros del Sur	Montevideo	Uruguay
9	Esquina Literaria	Quito	Ecuador
10	Paraguay Literario	Asunci├│n	Paraguay
\.


--
-- Data for Name: hechos_ventas_libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hechos_ventas_libros (id_venta, id_tiempo, id_libro, id_cliente, id_tienda, cantidad, precio_total) FROM stdin;
1	1	1	1	1	2	31.98
2	2	2	2	2	1	12.50
3	3	3	3	3	3	60.00
4	4	4	4	4	4	40.00
5	5	5	5	5	2	37.50
6	6	6	6	6	5	72.50
7	7	7	7	7	1	16.99
8	8	8	8	8	1	22.00
9	9	9	9	9	1	25.00
10	10	10	10	10	2	39.00
\.


--
-- Name: dim_cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_cliente_id_cliente_seq', 10, true);


--
-- Name: dim_libro_id_libro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_libro_id_libro_seq', 10, true);


--
-- Name: dim_tiempo_id_tiempo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_tiempo_id_tiempo_seq', 10, true);


--
-- Name: dim_tienda_id_tienda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dim_tienda_id_tienda_seq', 10, true);


--
-- Name: hechos_ventas_libros_id_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hechos_ventas_libros_id_venta_seq', 10, true);


--
-- Name: dim_cliente dim_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_cliente
    ADD CONSTRAINT dim_cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: dim_libro dim_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_libro
    ADD CONSTRAINT dim_libro_pkey PRIMARY KEY (id_libro);


--
-- Name: dim_tiempo dim_tiempo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo
    ADD CONSTRAINT dim_tiempo_pkey PRIMARY KEY (id_tiempo);


--
-- Name: dim_tienda dim_tienda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tienda
    ADD CONSTRAINT dim_tienda_pkey PRIMARY KEY (id_tienda);


--
-- Name: hechos_ventas_libros hechos_ventas_libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hechos_ventas_libros
    ADD CONSTRAINT hechos_ventas_libros_pkey PRIMARY KEY (id_venta);


--
-- Name: hechos_ventas_libros fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hechos_ventas_libros
    ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES public.dim_cliente(id_cliente);


--
-- Name: hechos_ventas_libros fk_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hechos_ventas_libros
    ADD CONSTRAINT fk_libro FOREIGN KEY (id_libro) REFERENCES public.dim_libro(id_libro);


--
-- Name: hechos_ventas_libros fk_tiempo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hechos_ventas_libros
    ADD CONSTRAINT fk_tiempo FOREIGN KEY (id_tiempo) REFERENCES public.dim_tiempo(id_tiempo);


--
-- Name: hechos_ventas_libros fk_tienda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hechos_ventas_libros
    ADD CONSTRAINT fk_tienda FOREIGN KEY (id_tienda) REFERENCES public.dim_tienda(id_tienda);


--
-- PostgreSQL database dump complete
--

