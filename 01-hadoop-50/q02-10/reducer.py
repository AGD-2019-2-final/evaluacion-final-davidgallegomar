import sys
#
#  >>> Escriba el codigo del reducer a partir de este punto <<<
#
##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    curkey = None

    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == curkey:
 
            if val>maximo:
                maximo=val
        else:

            if curkey is not None:

                sys.stdout.write("{}\t{}\n".format(curkey, maximo))

            curkey = key
            maximo = val

    sys.stdout.write("{}\t{}\n".format(curkey, maximo))