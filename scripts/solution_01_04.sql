-- Example 1 (alternativa a)
-- Obtener la información de los clientes que viven en los estados CHIHUAHUA,
-- O CHIAPAS, o HIDALGO o JALISCO
/*
 * Operadores de comparación que pueden acompañar WHERE (predicado)
 * operadores de comparación: >, <, <=, >=, <>
 * operadores lógicos: and, or, not
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cliente
-- WHERE estado = 'CHIHUAHUA' OR
--      estado = 'CHIAPAS' OR
--      estado = 'HIDALGO' OR 
--      estado = 'JALISCO'
-- ----------------------------------------------------------------------------------


-- Example 1 (alternativa b)
-- Obtener la información de los clientes que viven en los estados CHIHUAHUA,
-- O CHIAPAS, o HIDALGO o JALISCO
/**
 * Mejorando la escritura de la condición con ---> IN (comparación)
 *
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cliente
-- WHERE estado IN ('CHIHUAHUA','CHIAPAS', 'HIDALGO', 'JALISCO');
-- ----------------------------------------------------------------------------------


-- Example 1 (alternativa c)
-- Obtener la información de los clientes que viven en los estados CHIHUAHUA,
-- O CHIAPAS, o HIDALGO o JALISCO
/**
 * Mejorando la escritura de la condición con ---> IN (comparación)
 * una consulta más robusta indentificar MAYUS/MINUS
 *
*/
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cliente
-- WHERE lower(estado) IN ('chihuahua', 'chiapa', 'hidalgo', 'jalisco');
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 2 (alternativa a)
-- Obtener todos los prestamos hechos en algunas de las siguientes sucursales
-- 1 (ACAMBARO) o 128 (BUENAVISTA) o 109 (CUATLA) o 41 (NAVOJOA) o 39 (TEPIC) o
-- 110 (ZAMORA) y cuyo importe sea mayor $40.000
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM prestamo
-- WHERE (
--    numsucursal = 1 OR
--    numsucursal = 128 OR
--    numsucursal = 109 OR
--    numsucursal = 41 OR
--    numsucursal = 39 OR
--    numsucursal = 110 ) AND
--    importe > 40000
-- ----------------------------------------------------------------------------------


-- Example 2 (alternativa b)
-- Obtener todos los prestamos hechos en algunas de las siguientes sucursales
-- 1 (ACAMBARO) o 128 (BUENAVISTA) o 109 (CUATLA) o 41 (NAVOJOA) o 39 (TEPIC) o
-- 110 (ZAMORA) y cuyo importe sea mayor $40.000
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM prestamo
-- WHERE numsucursal IN (1, 128, 109, 41, 39, 110) 
--      AND importe > 40000
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 3 (alternativa a)
-- Obtener la información de las cuentas cuyo saldo se encuentre entre $16000 y
-- $58000 y que se encuentren asignadas en alguna de las siguientes sucursales 
-- 62 (OCATLAN) o 171 (HUAMANTLA) o 173 (TLAXCALA) 
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta 
-- WHERE (saldo > 16000 AND saldo < 58000) AND
--      (
--        numsucursal = 62 OR
--        numsucursal = 171 OR
--        numsucursal = 173  )
-- ----------------------------------------------------------------------------------



-- Example 3 (alternativa b)
-- Obtener la información de las cuentas cuyo saldo se encuentre entre $16000 y
-- $58000 y que se encuentren asignadas en alguna de las siguientes sucursales 
-- 62 (OCATLAN) o 171 (HUAMANTLA) o 173 (TLAXCALA) 
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta 
-- WHERE (saldo > 16000 AND saldo < 58000) AND
--        numsucursal IN (62, 171, 173)
-- ----------------------------------------------------------------------------------


-- Example 3 (alternativa c)
-- Obtener la información de las cuentas cuyo saldo se encuentre entre $16000 y
-- $58000 y que se encuentren asignadas en alguna de las siguientes sucursales 
-- 62 (OCATLAN) o 171 (HUAMANTLA) o 173 (TLAXCALA) 
/**
 * podemos incluir los limites del rango usando el operador <= , >=
 */
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta 
-- WHERE (saldo >= 16000 AND saldo <= 58000) AND
--        numsucursal IN (62, 171, 173)
-- ----------------------------------------------------------------------------------


-- Example 3 (alternativa d)
-- Obtener la información de las cuentas cuyo saldo se encuentre entre $16000 y
-- $58000 y que se encuentren asignadas en alguna de las siguientes sucursales 
-- 62 (OCATLAN) o 171 (HUAMANTLA) o 173 (TLAXCALA) 
/**
 * BETWEEN
 * podemos incluir los limites del rango usando el operador <= , >=
 * tambien podemos utilizar el operador BETWEEN siempre que querramos incluir
 * los limites del rango
 */
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta 
-- WHERE (saldo BETWEEN 16000 AND 58000) AND
--      numsucursal IN (62, 171, 173)
-- ----------------------------------------------------------------------------------



-- Example 3 (alternativa e)
-- Obtener la información de las cuentas cuyo saldo se encuentre entre $16000 y
-- $58000 y que se encuentren asignadas en alguna de las siguientes sucursales 
-- 62 (OCATLAN) o 171 (HUAMANTLA) o 173 (TLAXCALA) 
/**
 * NOT BETWEEN
 * podemos incluir los limites del rango usando el operador <= , >=
 * tambien podemos utilizar el operador BETWEEN siempre que querramos incluir
 * los limites del rango
 * ahora podemos añadir el operador NOT BETWEEN para seleccionar todas las
 * tuplas excepto las que están en ese rango
 */
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta 
-- WHERE (saldo NOT BETWEEN 16000 AND 58000)
--       AND numsucursal IN (62, 171, 173)
-- ;
-- ----------------------------------------------------------------------------------



-- Example 3 (alternativa f)
-- Obtener la información de las cuentas cuyo saldo se encuentre entre $16000 y
-- $58000 y que se encuentren asignadas en alguna de las siguientes sucursales 
-- 62 (OCATLAN) o 171 (HUAMANTLA) o 173 (TLAXCALA) 
/**
 * NOT IN 
 * podemos incluir los limites del rango usando el operador <= , >=
 * tambien podemos utilizar el operador BETWEEN siempre que querramos incluir
 * los limites del rango
 * ahora podemos añadir el operador NOT BETWEEN para seleccionar todas las
 * tuplas excepto las que están en ese rango
 */
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta 
-- WHERE (saldo NOT BETWEEN 16000 AND 58000)
--      AND numsucursal NOT IN (62, 171, 173)
-- ;
-- ----------------------------------------------------------------------------------


-- ===============================================================================
-- ===============================================================================


-- Example 4 (alternativa a)
-- Obtener la información de las cuentas cuyo saldo mayor o igual a $100.000 y
-- que se hallan otorgado durante el primer trimestre (01/01/2013 al 31/03/2013)
-- o bien cuyo saldo sea mayor que $65.000 y menor que $85.000 y sean de
-- alguna de las siguientes sucursales: 55 (LORETO) o 164 (ZACATECAS) o 63
-- (FRESNILLO)
/**
 * Formato estandar para las fechas (YEAR/MONTH/DAY)
 * podemos hacer comparaciónes entre fechas usando operadores de comparación
 */
-- ----------------------------------------------------------------------------------
-- SELECT *
-- FROM cuenta
-- WHERE saldo >= 10000 AND
--      fecha >= '2013-01-01' AND fecha <= '2013-03-31'
-- ----------------------------------------------------------------------------------



-- Example 4 (alternativa b)
-- Obtener la información de las cuentas cuyo saldo mayor o igual a $100.000 y
-- que se hallan otorgado durante el primer trimestre (01/01/2013 al 31/03/2013)
-- o bien cuyo saldo sea mayor que $65.000 y menor que $85.000 y sean de
-- alguna de las siguientes sucursales: 55 (LORETO) o 164 (ZACATECAS) o 63
-- (FRESNILLO)
/**
 * Formato estandar para las fechas (YEAR/MONTH/DAY)
 * podemos hacer comparaciónes entre fechas usando operadores de comparación
 * BETWEEN
 *     Recordar que beetween solo sirve para rango que incluyen sus limites
 */
-- ----------------------------------------------------------------------------------
SELECT *
FROM cuenta
WHERE (saldo >= 10000) AND
      (fecha BETWEEN '2013-01-01' AND '2013-03-31') OR
      (saldo > 65000 AND saldo < 85000) AND
      numsucursal IN (55, 164, 63);
-- ----------------------------------------------------------------------------------

