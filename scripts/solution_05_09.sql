-- Example 5 (alternativa a)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador LIKE y el modificador '%'
 * la ocurrencia de 0 o más caracteres
 * tener en cuenta que el patron 'san%' en algunos SMBD son sensible a
 * MAYUS/MINUS
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal LIKE 'SAN%' 
-- ----------------------------------------------------------------------------------


-- Example 5 (alternativa b)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador LIKE y el modificador '%', combinado con lower() function
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos lower() function
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE lower(nombresucursal) LIKE 'san%' 
-- ----------------------------------------------------------------------------------


-- Example 5 (alternativa c)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador ILIKE y el modificador '%' 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ILIKE 'san%' 
-- ----------------------------------------------------------------------------------



-- Example 5 (alternativa d)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador '~' virgulilla, expresiones regulares
 * ( * ) la ocurrencia de 0 o más veces la ocurrencia del atomo (una letra a la
 * izquierda, en este caso 0 o más veces de 'N'
 * ( * ) es sensible a MAYUS / MINUS
 * nuestra consulta NO es la correcta 
 * 
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ~ 'SAN*';
-- ----------------------------------------------------------------------------------


-- Example 5 (alternativa e)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador '~' virgulilla, expresiones regulares
 * ( + ) la ocurrencia de 1 o más veces la ocurrencia del atomo (una letra a la
 * izquierda, en este caso 1 o más veces de 'N'
 * ( + ) es sensible a MAYUS / MINUS
 * nuestra consulta NO es la correcta 
 * 
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ~ 'SAN+';
-- ----------------------------------------------------------------------------------



-- Example 5 (alternativa f)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador '~' virgulilla, expresiones regulares
 * ( + ) la ocurrencia de 1 o más veces la ocurrencia del atomo (una letra a la
 * izquierda, en este caso 1 o más veces de 'N'
 * ( ~ ) es sensible a MAYUS / MINUS
 * ( ^ ) nos indica que el patron comienza así 'SAN'
 * 
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ~ '^SAN+';
-- ----------------------------------------------------------------------------------


-- Example 5 (alternativa g)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador '~*' virgulilla, expresiones regulares (es una combinación NO
 * sensible a mayusculas y minusculas)
 * ( + ) la ocurrencia de 1 o más veces la ocurrencia del atomo (una letra a la
 * izquierda, en este caso 1 o más veces de 'N'
 * ( ~ ) es sensible a MAYUS / MINUS
 * ( ^ ) nos indica que el patron comienza así 'SAN'
 * 
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ~* '^san+';
-- ----------------------------------------------------------------------------------




-- Example 5 (alternativa g)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador '~*' virgulilla, expresiones regulares (es una combinación NO
 * sensible a mayusculas y minusculas)
 * ( + ) la ocurrencia de 1 o más veces la ocurrencia del atomo (una letra a la
 * izquierda, en este caso 1 o más veces de 'N'
 * ( ~ ) es sensible a MAYUS / MINUS
 * ( ^ ) nos indica que el patron comienza así 'SAN'
 * ( .* ) el punto hacer referencia a un caracter, es decir "solo debe haber una
 * n antes del punto" y luego de eso seguirá cualquier cosa 0 o más
 * 
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ~* '^san.*';
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 5 (alternativa g)
-- Obtener todas las cuentas cuyo patrón sea 'c-00111' recordemos que el
-- patrón nombre de cuenta tiene 7 caracteres
/**
 * operador '~*' virgulilla, expresiones regulares (es una combinación NO
 * sensible a mayusculas y minusculas)
 * ( ~ ) es sensible a MAYUS / MINUS
 * ( 0{2} ) cuantificador repite 2 veces el cero --> '00'
 * tipos de cuantificadores
 *      {n} aparecer n veces
 *      {n, m} aparecer minimo n veces y maximo m veces
 *      {n, } va a parecer n o más veces
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta
-- WHERE numcta ~* 'c-0{2}1{3}'
-- ----------------------------------------------------------------------------------



-- Example 5 (alternativa g)
-- Obtener el patron con numero de cuentas cuyo patron consista en 
--  1. (zero) o más 
--  2. (one) uno o más  --> obligado el '1' tiene que aparecer al menos una vez
/**
 * operador '~*' virgulilla, expresiones regulares (es una combinación NO
 * sensible a mayusculas y minusculas)
 * ( ~ ) es sensible a MAYUS / MINUS
 * ( 0* ) (zero veces o más veces va a parecer el cero)
 * ( 1+ ) (one veces o muchas veces va a aparecer el cero)
 * Tener cuidado ya que de esta manera ellos pueden aparecer en cualquier lado
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta
-- WHERE numcta ~* '0*1+'
-- ----------------------------------------------------------------------------------




-- Example 5 (alternativa g)
-- Obtener el patron con numero de cuentas cuyo patron consista en 
--  1. (zero) o más 
--  2. (one) uno o más  --> obligado el '1' tiene que aparecer al menos una vez
--  3. el número tres debe aparecer al final
/**
 * operador '~*' virgulilla, expresiones regulares (es una combinación NO
 * sensible a mayusculas y minusculas)
 * ( ~ ) es sensible a MAYUS / MINUS
 * ( 0* ) (zero veces o más veces va a parecer el cero)
 * ( 1+ ) (one veces o muchas veces va a aparecer el cero)
 * Tener cuidado ya que de esta manera ellos pueden aparecer en cualquier lado
 * ( 3$ ) el tres siempre debe aparecer al final, último caracter
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta
-- WHERE numcta ~* '0*1+3$'
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 5 (alternativa c) "la base de datos tiene DISTRITO FEDERAL en lugar
-- de CDMX
-- Actualizar aquellas tuplas que el estado sea 'DISTRITO FEDERAL' por 'CDMX'
/**
 * UPDATE un atributo de una relación
 * importante la directiva WHERE para actualizar todas aquellas tuplas de
 * acuerdo al predicado
*/
-- ----------------------------------------------------------------------------------
-- UPDATE sucursal
-- SET estado = 'CDMX'
-- WHERE estado = 'DISTRITO FEDERAL';
-- ----------------------------------------------------------------------------------

-- ===============================================================================
-- ===============================================================================



-- Example 5 (alternativa c)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador ILIKE y el modificador '%' 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ILIKE 'san%'
--    AND estado <> 'CDMX';
-- ----------------------------------------------------------------------------------


-- Example 5 (alternativa c)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador ILIKE y el modificador '%', <> 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * ahora podemos en lugar de usar el operador <> NOT IN  
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ILIKE 'san%'
--    AND estado NOT IN ('CDMX');
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 6 (alternativa a)
-- Obtener toda la información de los clientes que tengan como apellido materno
-- MOYA y que no vivan en alguno de los siguientes estados GUERRERO, TUMAULIPAS
-- o SONORA
/**
 * operador ILIKE y el modificador '%', NOT IN 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * ahora podemos en lugar de usar el operador <> NOT IN  
 * considerar que esto funciona ya que la construccion de los nombres están
 * compuestos por 3 palabras separadas y dedujimos que el apellido materno es el
 * 3 palabra
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cliente
-- WHERE nombrecliente ILIKE '%moya' AND
--      estado NOT IN ('GUERRERO', 'TUMAULIPAS', 'SONARA');
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 7 (alternativa a)
-- Obtener la información de todos los clientes que tengan la cadena ALONSO en
-- cualquier posición y cuya dirección contenga el nombre de algún santo
/**
 * operador ILIKE y el modificador '%letra%', NOT IN 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * ahora podemos en lugar de usar el operador <> NOT IN  
*/

-- ===============================================================================
-- ===============================================================================


-- Example 5 (alternativa c) "la base de datos tiene DISTRITO FEDERAL en lugar
-- de CDMX
-- Actualizar aquellas tuplas que el estado sea 'DISTRITO FEDERAL' por 'CDMX'
/**
 * UPDATE un atributo de una relación
 * importante la directiva WHERE para actualizar todas aquellas tuplas de
 * acuerdo al predicado
*/
-- ----------------------------------------------------------------------------------
-- UPDATE sucursal
-- SET estado = 'CDMX'
-- WHERE estado = 'DISTRITO FEDERAL';
-- ----------------------------------------------------------------------------------

-- ===============================================================================
-- ===============================================================================



-- Example 5 (alternativa c)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador ILIKE y el modificador '%' 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ILIKE 'san%'
--    AND estado <> 'CDMX';
-- ----------------------------------------------------------------------------------


-- Example 5 (alternativa c)
-- Obtener toda la información de las sucursales que comiencen con la cadena SAN
-- y que no esten ubicadas en la CDMX.
/**
 * operador ILIKE y el modificador '%', <> 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * ahora podemos en lugar de usar el operador <> NOT IN  
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ILIKE 'san%'
--    AND estado NOT IN ('CDMX');
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 6 (alternativa a)
-- Obtener toda la información de los clientes que tengan como apellido materno
-- MOYA y que no vivan en alguno de los siguientes estados GUERRERO, TUMAULIPAS
-- o SONORA
/**
 * operador ILIKE y el modificador '%', NOT IN 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * ahora podemos en lugar de usar el operador <> NOT IN  
 * considerar que esto funciona ya que la construccion de los nombres están
 * compuestos por 3 palabras separadas y dedujimos que el apellido materno es el
 * 3 palabra
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cliente
-- WHERE nombrecliente ILIKE '%moya' AND
--      estado NOT IN ('GUERRERO', 'TUMAULIPAS', 'SONARA');
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 7 (alternativa a)
-- Obtener la información de todos los clientes que tengan la cadena ALONSO en
-- cualquier posición y cuya dirección contenga el nombre de algún santo
/**
 * operador ILIKE y el modificador '%letra%', NOT IN 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * ahora podemos en lugar de usar el operador <> NOT IN  
 * '%letra%' busca un patron de cadena en cualquier posición
 * '%san%' tener en cuenta que el patron 'SAN' no necesariamente está al inicio
 * si no utilizamos parentesis ( ) entonces obtendremos resultados inesperados
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cliente
-- WHERE nombrecliente ILIKE '%alonso%' AND
--      (direccion ILIKE '%san %' OR direccion ILIKE '%sant%');
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 8 (alternativa a)
-- Obtener la información del cliente, estado, fecha de nacimiento de aquellos
-- clientes que tengan como apellido paterno ALONSO y que contenga la dirección
-- MZNA o MANZANA
/**
 * operador ILIKE y el modificador '%letra%' 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * '% alonso %' si el patron está justo en la mitad usamos los espacion 
 * si no utilizamos parentesis ( ) entonces obtendremos resultados inesperados
*/
-- ----------------------------------------------------------------------------------
-- SELECT nombrecliente, estado, nacimiento 
-- FROM cliente
-- WHERE nombrecliente ILIKE '% ALONSO %' AND
--      (direccion ILIKE '%MZNA%' OR direccion ILIKE '%MANZANA%');
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 9 (alternativa a)
-- Obtener la información de los clientes que tienen un apellido materno de
-- longitud 6
/**
 * operador ILIKE y el modificador '%letra%' 
 * ( % ) la ocurrencia de 0 o más caracteres
 * ( _ ) la ocurrencia de 1 solo caracter
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * en este caso solo (% cualquier string que empiece)
 * en este caso solo ( ______ exite un espacio más 6 veces ( _ ), es decir, 6
 * caracteres
 * suponemos que el apellido materno es la tercera palabra del nombre
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cliente
-- WHERE nombrecliente ILIKE '% ______';
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 9 (alternativa a)
-- Obtener la información de los clientes que tienen un apellido materno de
-- longitud 6 y cuya primera letra es C
/**
 * operador ILIKE y el modificador '%letra%' 
 * ( % ) la ocurrencia de 0 o más caracteres
 * ( _ ) la ocurrencia de 1 solo caracter
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * en este caso solo (% cualquier string que empiece)
 * en este caso solo ( ______ exite un espacio más 6 veces ( _ ), es decir, 6
 * caracteres
 * suponemos que el apellido materno es la tercera palabra del nombre
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cliente
-- WHERE nombrecliente ILIKE '% c_____';
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 9 (alternativa a)
-- Obtener la información de las sucursales cuyo nombre termine con alguna de
-- las siguientes letras N, O, S, o Z y que estén ubicadas en estado cuya
-- primera letra sea A-D, H, L, O-T
/**
 * operador ILIKE y el modificador '%letra%' 
 * la ocurrencia de 0 o más caracteres
 * para que nuestra consulta sea mas robusta, si no sabemos si la información
 * está almacenada en MAYUS/MINUS entonces usamos ILIKE es sensible a M/M
 * '%n%' si termina la cadena con la letra 'n' 
 */
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM sucursal
-- WHERE nombresucursal ILIKE '%n' OR
--      nombresucursal ILIKE '%o' OR
--      nombresucursal ILIKE '%s' OR
--      nombresucursal ILIKE '%z' 
-- ----------------------------------------------------------------------------------



-- Example 9 (alternativa b)
-- Obtener la información de las sucursales cuyo nombre termine con alguna de
-- las siguientes letras N, O, S, o Z y que estén ubicadas en estado cuya
-- primera letra sea A-D, H, L, O-T
/**
 * uso de expresiones regulares para solución
 * usamos el operador [a |b ] expresar or con mutiples valores
 * usamos el operador [ a,b ] expresar or con mutiples valores
 * usamos el operador [ ab ] expresar or con mutiples valores
 * [ ab ] dentro de los cohorchetes expresa un solo caracter IMPORTANTE
 * [ a-f ] es un rango de valores a a la f pero recordar que solo toma un valor
 * ( z$ ) termina en z
*/
-- ----------------------------------------------------------------------------------
SELECT *
FROM sucursal
WHERE nombresucursal ~* '[n | o | s | z]$' AND
      estado ~* '^[a-d, h, l, o-t]';
-- ----------------------------------------------------------------------------------
