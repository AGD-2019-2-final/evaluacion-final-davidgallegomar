-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' USING PigStorage('\t') AS (columna1:chararray,columna2:chararray,columna3:chararray);
data = FOREACH data GENERATE columna1, TOKENIZE(columna2,',') as columna2, TOKENIZE(columna3,',') as columna3;
data = FOREACH data GENERATE columna1, COUNT(columna2), COUNT(columna3);
data = ORDER data BY $0,$1,$2 ASC;

STORE data INTO 'output' using PigStorage(',');