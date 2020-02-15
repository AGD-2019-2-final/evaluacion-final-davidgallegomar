import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
      letra = line.split("   ")[0]
      fecha = line.split("   ")[1]
      valor = line.split("   ")[2]
      valor=int(valor)
      sys.stdout.write("{}\t{}\t{}\n".format(letra,fecha,valor))