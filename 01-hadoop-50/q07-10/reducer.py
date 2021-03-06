import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
vector=[]
for line in sys.stdin:
    letra, fecha, valor = line.split("\t")
    valor = int(valor)

    vector.append((letra,fecha,valor))

vector.sort(key=lambda orden: (orden[0], orden[2]))

for line in vector:
    sys.stdout.write("{}   {}   {}\n".format(line[0],line[1].strip(),line[2]))