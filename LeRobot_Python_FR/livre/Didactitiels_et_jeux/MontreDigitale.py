# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia et Thibault COUSOT         *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# *                                                     *
# *******************************************************
from LibRobot import *

couleurDuFond = blanc
couleurDesChiffres = noir

def cfr(c):
    # Dessiner le chiffre C, le robot partant en bas à gauche et terminant
    # dans la même position
    bc(); pn()
    if c == 0:
        avf(2); pqtd(); av(); pqtd(); avf(2); pqtd(); av(); pqtd()
    elif c == 1:
        lc(); pqtd(); av(); pqtg(); avf(2); pdt(); bc(); avf(2); lc(); pqtd(); av()
        pqtd()
    elif c == 2:
        lc(); avf(2); pqtd(); bc(); av(); pqtd(); av(); pqtd(); av(); pqtg(); av()
        pqtg(); av(); pdt(); av(); pqtd()
    elif c == 3:
        lc(); avf(2); pqtd(); bc(); av(); pqtd(); av(); pqtd(); av(); pdt(); av()
        pqtd(); av(); pqtd(); av(); pqtd()
    elif c == 4:
        lc(); avf(2); pdt(); bc(); av(); pqtg(); av(); pqtg(); av(); pdt(); avf(2)
        lc()
        pqtd(); av(); pqtd()
    elif c == 5:
        pqtd(); av(); pqtg(); av(); pqtg(); av(); pqtd(); av(); pqtd(); av(); lc()
        pqtd(); avf(2); pqtd(); av(); pqtd()
    elif c == 6:
        av(); pqtd(); av(); pqtd(); av(); pqtd(); av(); pqtd(); avf(2); pqtd(); av()
        lc(); pqtd(); avf(2); pqtd(); av(); pqtd()
    elif c == 7:
        lc(); avf(2); pqtd(); bc(); av(); pqtd(); avf(2); pqtd(); lc(); av(); pqtd()
    elif c == 8:
        av(); pqtd(); av(); pdt(); av(); pqtd(); av(); pqtd(); av(); pqtd(); avf(2)
        pqtd(); av(); pqtd()
    elif c == 9:
        lc(); av(); bc(); pqtd(); av(); pdt(); av(); pqtd(); av(); pqtd(); av()
        pqtd(); avf(2); pqtd(); av(); pqtd()
    else:
        pass

def esp():
    # Laisser un espace entre deux nombres
    lc(); pe(); avf(2)

def moins():
    # Dessiner un signe -
    pn(); lc(); av(); pqtd(); bc(); av(); lc(); pqtd(); av(); pqtd(); av()
    pqtd()

def nbr(n):
    # Dessiner le nombre N (en supposant -32767 <= N <= 32767)
    if 0 <= n and n <= 9:
        cfr(n)
    elif n < 0:
        moins(); esp(); nbr(-n)
    else:
        nbr(n // 10); esp(); nbr(n % 10)

def deuxPoints():
    lc(); dp(); pn(); av(); dp(); pdt(); av()

def ecrireDate(j, mo, a):
    # Ecrire le jour
    ce(); ag(); translater(0, 2); nbr(j)
    # Ecrire -
    ce(); ag(); translater(4, 2); moins()
    # Ecrire le mois
    ce(); ag(); translater(6, 2); nbr(mo)
    # Ecrire -
    ce(); ag(); translater(10, 2); moins()
    # Ecrire l'année
    ce(); ag(); translater(12, 2); nbr(a)

def ecrireSeconde(s):
    # Ecrire la seconde
    ce(); ag(); translater(10, -2); nbr(s)

def ecrireHeure(h, mi, s):
    # Ecrire l'heure
    ce(); ag(); translater(0, -2); nbr(h)
    # Ecrire :
    ce(); ag(); translater(4, -2); deuxPoints()
    # Ecrire la minute
    ce(); ag(); translater(5, -2); nbr(mi)
    # Ecrire :
    ce(); ag(); translater(9, -2); deuxPoints()
    # Ecrire la seconde
    ecrireSeconde(s)

def initialisation():
    cf(couleurDuFond); cc(couleurDesChiffres)
    cacherRobot()
    message("Arrêter la montre en tapant sur l'une des touches 'esc', '§' ou '#'.")
    lg(24); ec(6)

aJ = 0
aMo = 0
aA = 0
aH = 0
aMi = 0
aS = 0
j = 0
mo = 0
a = 0
h = 0
mi = 0
s = 0

aA, aMo, aJ = date(); aH, aMi, aS = heure()
initialisation(); ecrireDate(aA, aMo, aJ); ecrireHeure(aH, aMi, aS)
while True:
    while True:  # repeat ... until
        a, mo, j = date(); h, mi, s = heure()
        if s != aS:
            break
    if aMi == mi:
        cc(couleurDuFond); ecrireSeconde(aS)  # Effacer l'ancienne seconde
        cc(couleurDesChiffres); ecrireSeconde(s)  # Ecrire la nouvelle seconde
    # Toutes les minutes, effacer l'écran et réécrire toute la date
    else:
        initialisation(); ecrireDate(a, mo, j); ecrireHeure(h, mi, s)
    aA = a; aMo = mo; aJ = j; aH = h; aMi = mi; aS = s
st()
