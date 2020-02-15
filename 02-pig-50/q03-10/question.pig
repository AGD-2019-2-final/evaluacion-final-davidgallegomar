-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:chararray,fecha:chararray,numero:int);
tabla = ORDER data BY $2;
tabla2 = FOREACH tabla GENERATE $2;
tabla3 = LIMIT tabla2 5;

STORE tabla3 INTO './output';

