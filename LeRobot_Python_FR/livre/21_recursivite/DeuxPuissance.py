from LibRobot import *

# Calculer 2 à la puissance 16 et dessiner le
# résultat avec le robot
def deuxPuissance(n):
    if n == 0:
        return 1
    else:
        return 2 * deuxPuissance(n - 1)

# Dessiner le chiffre c, le robot partant en bas à
# gauche et terminant dans la même position
def chiffre(c):
    bc(); pn()
    if c == 0:
        av(); av(); pqtd(); av(); pqtd(); av(); av()
        pqtd(); av(); pqtd()
    elif c == 1:
        lc(); pqtd(); av(); pqtg(); av(); av()
        pdt(); bc(); av(); av(); lc(); pqtd()
        av(); pqtd()
    elif c == 2:
        lc(); av(); av(); pqtd(); bc(); av(); pqtd()
        av(); pqtd(); av(); pqtg()
        av(); pqtg(); av(); pdt(); av(); pqtd()
    elif c == 3:
        lc(); av(); av(); pqtd(); bc(); av(); pqtd()
        av(); pqtd(); av(); pdt(); av()
        pqtd(); av(); pqtd(); av(); pqtd()
    elif c == 4:
        lc(); av(); av(); pdt(); bc(); av(); pqtg()
        av(); pqtg(); av(); pdt(); av()
        av(); lc(); pqtd(); av(); pqtd()
    elif c == 5:
        pqtd(); av(); pqtg(); av(); pqtg(); av()
        pqtd(); av(); pqtd(); av(); lc()
        pqtd(); av(); av(); pqtd(); av(); pqtd()
    elif c == 6:
        av(); pqtd(); av(); pqtd(); av(); pqtd()
        av(); pqtd(); av(); av(); pqtd()
        av(); lc(); pqtd(); av(); av(); pqtd(); av()
        pqtd()
    elif c == 7:
        lc(); av(); av(); pqtd(); bc(); av(); pqtd()
        av(); av(); pqtd(); lc(); av()
        pqtd()
    elif c == 8:
        av(); pqtd(); av(); pdt(); av(); pqtd()
        av(); pqtd(); av(); pqtd(); av()
        av(); pqtd(); av(); pqtd()
    elif c == 9:
        lc(); av(); bc(); pqtd(); av(); pdt(); av()
        pqtd(); av(); pqtd(); av()
        pqtd(); av(); av(); pqtd(); av(); pqtd()
    else:
        pass

# Laisser un espace entre deux nombres
def esp():
    lc(); pe(); av(); av()

# Dessiner un signe -
def moins():
    pn(); lc(); av(); pqtd(); bc(); av(); lc()
    pqtd(); av(); pqtd(); av(); pqtd()

# Dessiner le nombre n
def nombre(n):
    if 0 <= n and n <= 9:
        chiffre(n)
    elif n < 0:
        moins(); esp(); nombre(-n)
    else:
        nombre(n // 10); esp()
        nombre(n % 10)

ag(); nombre(deuxPuissance(16)); st()
