import sys



curkey = None

for line in sys.stdin:
    
    key, valor = line.split("\t")
    valor=float(valor)

    if key == curkey:
       suma+=valor
       contador+=1
       promedio=suma/contador

    else:

        if curkey is not None:

            sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,promedio))


        curkey=key
        suma=valor
        contador=1
        promedio=suma/contador

sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,promedio))

