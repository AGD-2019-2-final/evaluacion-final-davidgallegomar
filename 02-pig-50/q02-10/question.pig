-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 
data = LOAD 'data.tsv' USING PigStorage('\t') AS (letra:CHARARRAY,fecha:CHARARRAY,valor:INT);
tabla = ORDER data BY $0,$2;

STORE tabla INTO 'output';

