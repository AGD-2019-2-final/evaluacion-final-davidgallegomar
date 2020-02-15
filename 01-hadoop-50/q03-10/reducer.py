import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
import sys

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    curkey = None
    total = 0

    for line in sys.stdin:

        key, val = line.split("\t")


        if curkey is not None:
            
            sys.stdout.write("{},{}\n".format(curkey.replace("\n",""), total))

        curkey = val
        total = key

    sys.stdout.write("{},{}\n".format(curkey.replace("\n",""), total))