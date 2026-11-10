from LibRobot import *

# Lire un entier n et écrire sa factorielle n!
nmin = 0
nmax = 20

# Lire au clavier la valeur de n, en recommençant
# tant que l'on n'a pas nmin <= n <= nmax
def lireN():
    write("n = ")
    n = lireEntier()
    if nmin <= n and n <= nmax:
        return n
    else:
        writeln("n doit être compris entre ", str(nmin), " et ",
                str(nmax), " ! Recommencer.")
        return lireN()

n = lireN()
# Calculer f = n!
f = 1
for i in range(1, n + 1):
    f = f * i
# Écrire f
writeln("n! = ", str(f))
readln()
