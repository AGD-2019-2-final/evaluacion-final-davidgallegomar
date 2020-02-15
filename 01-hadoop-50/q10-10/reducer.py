import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
curkey = None
text=""
vector=[]

for line in sys.stdin:
    
    key, valor = line.split("\t")
    valor=int(valor)

    if key == curkey:
        vector.append(valor)

    else:

        if curkey is not None:

            vector.sort()
            sys.stdout.write("{}       {}\n".format(curkey,str(vector)[1:-1].replace(" ",""))) 
            vector=[]
            
        curkey=key
        vector.append(valor)

vector.sort()
sys.stdout.write("{}       {}\n".format(curkey,str(vector)[1:-1].replace(" ",""))) 
