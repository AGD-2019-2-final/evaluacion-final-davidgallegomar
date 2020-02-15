import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#


for line1 in sys.stdin:
    c1, c2 = line1.split("\t")

    for line2 in c2.split(","):
        
        c1=int(c1)
        sys.stdout.write("{}\t{}\n".format(line2.strip(),c1))