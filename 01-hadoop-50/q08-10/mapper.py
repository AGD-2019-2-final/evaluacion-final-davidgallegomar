import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    
    for line in sys.stdin:
        
        line.strip()
        letra=line.split("   ")[0]
        valor=line.split("   ")[2]
        valor=int(valor)
        sys.stdout.write("{}\t{}""\n".format(letra,valor))