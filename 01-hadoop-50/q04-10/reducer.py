import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0

    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == curkey:

            total += 1
        else:

            if curkey is not None:

                sys.stdout.write("{},{}\n".format(curkey, total))

            curkey = key
            total = 1

    sys.stdout.write("{},{}\n".format(curkey, total))
