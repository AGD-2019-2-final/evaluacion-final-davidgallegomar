-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--



data = LOAD 'data.tsv' USING PigStorage('\t') AS (columna1:chararray,columna2:chararray,columna3:chararray);
tabla1 = FOREACH data GENERATE FLATTEN(TOKENIZE(columna2)) AS separacion;
tabla2 = GROUP tabla1 BY separacion;
tabla3 = FOREACH tabla2 GENERATE group, COUNT(tabla1);
tabla4 = LIMIT tabla3 7;

STORE tabla4 INTO 'output';

