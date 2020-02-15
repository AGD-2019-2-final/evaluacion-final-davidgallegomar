-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
-- fs: hace referencia alHDFS, -rm: elimina el directorio de salida si existe, -f: suprime mensaje de confirmación al eliminar directorio, -r: repite la operación en todos los subdirectorios


data = LOAD 'data.tsv' using PigStorage('\t') AS (letra:CHARARRAY,fecha:CHARARRAY,valor:INT);
grupo = GROUP data BY $0;
cuenta = FOREACH grupo GENERATE group, COUNT(data);
STORE cuenta INTO './output' using PigStorage('\t');

