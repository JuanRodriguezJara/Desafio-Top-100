
--! Creamos la base de datos.
CREATE DATABASE peliculas;

--! Cambiamos a la base de datos creada.
\c peliculas

--! Creamos la tabla "pelicula".
CREATE TABLE pelicula (
    id INT PRIMARY KEY,
    pelicula VARCHAR(100),
    anio_estreno INT,
    director VARCHAR(30)
);


--! Creamos la tabla "reparto"
CREATE TABLE reparto (
    id_tabla SERIAL PRIMARY KEY,
    id INT,
    actor_actriz VARCHAR(80)    
);


--! Importamos datos a la base de datos pelicula.
\copy pelicula(id, pelicula ,anio_estreno, director) FROM 'C:\Users\jnrod\Desktop\Curso Javascript Sence\Desafios\24 Desafio - Top 100\peliculas.csv' csv header;

--! Importamos datos a la base de datos reparto.
\copy reparto(id, actor_actriz) FROM 'C:\Users\jnrod\Desktop\Curso Javascript Sence\Desafios\24 Desafio - Top 100\reparto.csv' csv header;


--? ----------------------------------------------------------------------------------------------------------

SELECT * FROM pelicula;
SELECT * FROM reparto;

-- Busca Id pelicula Titanic.
SELECT id
FROM pelicula
WHERE pelicula ILIKE 'titanic';


-- Listar a todos los actores que aparecen en la película "Titanic".
SELECT actor_actriz FROM reparto WHERE id= '2';


-- Consultar en cuántas películas del top 100 participa Harrison Ford.
--*Cantidad de peliculas que participa Harrison Ford
SELECT COUNT(pelicula)
FROM pelicula AS p, reparto AS r
WHERE r.actor_actriz = 'Harrison Ford' AND r.id = p.id;

--* Muestra las peliculas que participa Harrison Ford
SELECT pelicula, COUNT(pelicula)
FROM pelicula AS p, reparto AS r
WHERE r.actor_actriz = 'Harrison Ford' AND r.id = p.id
GROUP BY pelicula;


-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT pelicula
FROM pelicula
WHERE anio_estreno between '1991' AND '1999'
ORDER BY pelicula;


-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT pelicula 
AS titulo, (LENGTH(pelicula))
AS longitud_titulo
FROM pelicula;


-- Consultar cual es la longitud más grande entre todos los títulos de las películas
SELECT MAX(LENGTH(pelicula)) AS longitud_mayor FROM pelicula;
