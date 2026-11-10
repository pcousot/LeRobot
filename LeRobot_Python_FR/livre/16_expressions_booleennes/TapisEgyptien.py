from LibRobot import *

# Dessiner un tapis égyptien

# Taille de grille
g = 4
# h est impair. C'est la longueur du côté horizontal
# du tapis en nombre de "barres".
h = 19
# l est impair, l >= 3 et (h - 2 * l) / 2 >= 4.
# C'est la longueur du côté horizontal de la bande
# extrémité du tapis en nombre de "barres".
l = 3
# Côté du plus grand losange du centre, en nombre de
# motifs en C
cote = (h - 2 * l) // 2 - 1
# Hauteur du bord crénelé extérieur
hauteur = cote * 6 + 5 + (7 * 2 + 2) + 2 * 3

# Carreaux de x sur y fois g
def carreaux(x, y):
    lgX(x * g); lgY(y * g)

# Motif aux quatre coins
def octogoneCentral():
    for i in range(4):
        carreaux(2, 1); av(); phtd()
        lg(g); av(); phtd()
    lc(); phtd(); avf(3); bc()
    for i in range(4):
        pqtd(); av()
    # Peindre
    avf(-1); cc(rouge); peindre(); cc(noir); av()
    pqtg()

def triangleOuvertGauche():
    lg(g); avf(3); p3htg(); av()
    lgX(2 * g); av(); pqtg(); av()
    p3htg(); avf(2)
    # Peindre
    avf(-1); pqtd(); cc(rouge); peindre(); cc(noir)
    pqtd(); av(); phtg()
    lg(g); av(); phtd()

def triangleOuvertGaucheMiroir():
    lg(g); avf(3); p3htd(); av()
    lgX(2 * g); av(); pqtd(); av()
    p3htd(); avf(2)
    # Peindre
    avf(-1); pqtg(); cc(rouge); peindre(); cc(noir)
    pqtg(); av(); phtd()
    lg(g); av(); phtg()

def quartGauche():
    triangleOuvertGauche(); av(); phtd()
    carreaux(3, 1); av(); p3htd()
    triangleOuvertGauche()

def quartGaucheMiroir():
    triangleOuvertGaucheMiroir(); av(); phtg()
    carreaux(3, 1); av(); p3htg()
    triangleOuvertGaucheMiroir()

def motifExtremite():
    for i in range(2):
        quartGauche()
        lc(); pdt(); avf(4); pqtd(); avf(3); bc()
        av(); pqtg()
        quartGaucheMiroir(); av()
        lc(); avf(4); pqtd(); avf(3); pqtg(); bc()
    lc(); avf(-4); pqtg(); avf(2); p3htd(); bc()
    octogoneCentral()

# Motif du centre
def carreau():
    phtd(); lc(); av(); phtg(); bc()
    for i in range(4):
        av(); pqtd()
    lc(); p3htg(); av(); phtd(); bc()

def extremite():
    for i in range(3):
        av(); pqtg(); av(); pqtd(); av(); pqtd()
        av(); pqtg(); av(); pqtd()
    carreau()

def motifEnC():
    av(); pqtg(); av(); pqtd(); av(); pqtd()
    av(); pqtg(); av(); pqtd(); avf(2); pqtd(); av()
    pqtd(); av(); pqtg(); av(); pqtg(); avf(2)
    pqtg(); av(); pqtd(); av(); pqtg(); avf(2)
    pqtg(); av(); pqtd()

def motifEnCInverse():
    pqtd(); av(); pqtg(); avf(2); pqtg(); av()
    pqtd(); av(); pqtg(); avf(2); pqtg()
    av(); pqtg(); av(); pqtd(); av(); pqtd()
    avf(2); pqtd(); av(); pqtg(); av(); pqtd()
    av(); pqtd(); av(); pqtg(); av()

# n = côté en nombre de motifs en C
def losange(n):
    for j in range(2):
        av()
        for i in range(n):
            motifEnC()
        extremite()
        for i in range(n):
            motifEnCInverse()

def centre():
    lgX(g + 1)
    for i in range(cote // 2 + 1):
        losange(cote - 2 * i)
        if i % 3 == 0:
            cc(rouge)
        elif i % 3 == 2:
            cc(blanc)
        pqtd(); peindre(); cc(noir); pqtg()
        lc(); pqtd(); avf(6); pqtg(); bc()
    if (cote // 2 + 1) % 3 == 0:
        cc(rouge)
    elif (cote // 2 + 1) % 3 == 2:
        cc(blanc)
    lc(); pqtg(); avf(6); peindre(); cc(noir); pqtd()
    bc()
    lgX(g)

# Bord du tapis
def cran():
    pqtg(); av(); pqtd(); av(); pqtd(); av(); pqtg()

def grandeBarre():
    avf(3); cran(); avf(3)

def petiteBarre():
    avf(2); cran(); avf(2)

def descente():
    pqtd(); avf(2); pqtg()

def montee():
    pqtg(); avf(2); pqtd()

def coteExterieur():
    for i in range(h // 2):
        grandeBarre(); descente(); petiteBarre(); montee()
    grandeBarre()

# n = nombre de barres
def coteInterieur(n):
    for i in range(n // 2):
        petiteBarre(); montee(); grandeBarre(); descente()
    petiteBarre()

def rectangleExterieur():
    for i in range(2):
        avf(hauteur + 10)
        pqtd(); avf(h // 2 * 12 + 7 + 10); pqtd()

def rectangleCranteExterieur():
    pn()
    avf(hauteur)
    pqtd(); coteExterieur(); pqtd()
    avf(hauteur)
    pqtd(); coteExterieur(); pqtd()

def rectangleCranteInterieurExtremite():
    pe()
    coteInterieur(l); pqtg()
    avf(hauteur - 2)
    pqtg(); coteInterieur(l); pqtg()
    avf(hauteur - 2)
    pqtg()

def rectangleCranteInterieurCentral():
    pe()
    lc(); montee(); av(); bc()
    avf(2); cran(); avf(3); descente()
    coteInterieur(h - 2 * l - 2)
    montee(); avf(3); cran(); avf(2); pqtg()
    avf(hauteur - 6)
    pqtg(); avf(2); cran(); avf(3); descente()
    coteInterieur(h - 2 * l - 2)
    montee(); avf(3); cran(); avf(2); pqtg()
    avf(hauteur - 6)
    pqtg()

def bord():
    rectangleExterieur()
    lc(); avf(5); pqtd(); avf(5); pqtg(); bc()
    rectangleCranteExterieur()
    cc(rouge); peindre(); cc(noir)
    lc(); av(); pqtd(); av(); bc()

# Intérieur du tapis
def rectangleExtremite():
    rectangleCranteInterieurExtremite()
    lc(); avf((l - 1) // 2 * 12 // 2 + 2); pqtg()
    avf(12 + 6); bc()
    motifExtremite(); lc()
    avf(7 + (hauteur - 2 - 2 * 21) + 3)
    pdt(); bc(); motifExtremite(); lc()
    avf(7 + (hauteur - 2 - 21)); pqtg()
    avf((l - 1) // 2 * 12 // 2 + 3)
    phtd(); peindre(); phtg(); bc()

def rectangleCentral():
    rectangleCranteInterieurCentral()
    lc(); avf((h - 2 * l) // 2 * 6 + 2); pqtg()
    avf(cote * 6 + 5 + 7); pqtd(); bc()
    centre()
    lc(); avf((h - 2 * l) // 2 * 6 + 2 + 2); pqtd()
    avf(cote * 6 + 5 + 7 - cote // 2 * 6 + 2); bc()

lg(g); ag(); eb()
bord()
rectangleExtremite()
rectangleCentral()
rectangleExtremite()
st()
