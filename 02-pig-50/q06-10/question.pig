-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' USING PigStorage('\t') AS (columna1:chararray,columna2:chararray,columna3:chararray);
limpiar = FOREACH data GENERATE REPLACE(columna3, '\\u005D' , '') AS reemplazo;
limpiar = FOREACH limpiar GENERATE REPLACE(reemplazo, '\\d', '') AS reemplazo;
limpiar = FOREACH limpiar GENERATE REPLACE(reemplazo, '#', '') AS reemplazo;
limpiar = FOREACH limpiar GENERATE REPLACE(reemplazo, '\\u005B', '') AS reemplazo;

tabla = FOREACH limpiar GENERATE FLATTEN(TOKENIZE(reemplazo)) AS reemplazo;
tabla = GROUP tabla BY $0;
tabla = FOREACH tabla GENERATE group, COUNT(tabla);

STORE tabla INTO './output' using PigStorage(',');