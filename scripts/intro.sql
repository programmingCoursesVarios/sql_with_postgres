/* 
Estructura general de una query 

* elementos básicos obligatorios para poder trabajar en una sql
SELECT  ¿qué quiero?
FROM    ¿DE dónde lo vamos a tomar?  ; 

* una clausula para restrigir el número de resultados
WHERE  condición (predicado) 

el SMBD es sensible a mayusculas/minusculas 

varchar(100) : cadenas de longitud variable
var          : cadenas de longitud fija
*/

-- Example 2
-- SELECT  recupera todas las columnas de una tabla
-- Obtener toda la información de los clientes del banco
-- ----------------------------------------------------------------------------------
-- SELECT idcliente, nombrecliente, direccion, estado, nacimiento 
-- FROM cliente;
-- ----------------------------------------------------------------------------------

-- Example 1
-- Obtener toda la información de los clientes que viven en CHIAPAS
-- si estado = 'chiapas' en postgres no tendría resultado
-- si estado = 'chiapas' en sql-server tendría resultado  No es sensible a mayusculas y minusculas
-- ----------------------------------------------------------------------------------
-- SELECT idcliente, nombrecliente, direccion, estado, nacimiento
-- FROM cliente
-- WHERE estado = 'CHIAPAS';
-- ----------------------------------------------------------------------------------


-- Example 3 
-- escribir una consulta que sea sensible a MAYUS/MINUS en cuanto a la información almacenada
-- Obtener toda la información de los clientes que viven en CHIAPAS
-- si estado = 'chiapas' en postgres no tendría resultado
-- si estado = 'chiapas' en sql-server tendría resultado  No es sensible a mayusculas y minusculas
-- lower me permite hacer la consulta con 'chiapas' pero los resultado no serán en minuscula
-- si quisieramos hacer una modificación a los datos tendría que usar UPDATE  lower 
-- ----------------------------------------------------------------------------------
-- SELECT idcliente, nombrecliente, direccion, estado, nacimiento
-- FROM cliente
-- WHERE lower(estado) = 'chiapas';
-- ----------------------------------------------------------------------------------

-- Example 4 
-- cual sería el orden de ejecución para las consultas
-- ----------------------------------------------------------------------------------
-- SELECT idcliente, nombrecliente, direccion, estado, nacimiento     -- 3 mostar los atriubtos(columnas)
--  FROM cliente               -- 1 lo primero que se ejecuta. Pregunta si la relación(tabla) existe  
-- WHERE lower(estado) = 'chiapas';  -- 2  seleccionar y quitar aquellas tuplas que no coincidan
-- ----------------------------------------------------------------------------------


-- Example 5 
-- siempre que requiramos toda la información (columnas - atributos) de la relacion
-- usar el comodin (*) (TODO)
-- ----------------------------------------------------------------------------------
-- SELECT * 
-- ROM cliente
-- HERE lower(estado) = 'chiapas';
-- ----------------------------------------------------------------------------------


-- Example 6
-- cambiar el orden de las columnas(atributos) de la relación(tabla)
-- ----------------------------------------------------------------------------------
SELECT direccion, nombrecliente, estado, nacimiento, idcliente
FROM cliente
WHERE lower(estado) = 'chiapas';
-- ----------------------------------------------------------------------------------

