from LibRobot import *

# Dessiner une mosaïque de l'Alhambra
tailleDeGrille = 8  # doit être pair
nombreDeLignes = 4
nombreDeColonnes = 8

def demiMotif():
    phtd(); av(); phtd(); av(); pqtg(); av()
    lg(tailleDeGrille // 2)
    p3htd(); av(); pqtg(); av()
    lg(tailleDeGrille)
    p3htd(); av(); pqtg(); av(); phtd(); av()
    p3htd(); avf(2)
    lg(tailleDeGrille // 2)
    phtg(); av(); pqtd(); av()
    lg(tailleDeGrille); phtg(); avf(2)
    # Peindre
    avf(-1); phtg()
    if tsw() or tne():
        cc(jaune)
    else:
        cc(indigo)
    peindre()
    cc(noir); phtd(); av()
    # Remettre le robot dans l'orientation initiale
    pqtd()

def motif():
    demiMotif()
    lc(); pqtd(); avf(5); pqtd(); av(); bc()
    demiMotif()

def motifDouble():
    motif()
    # Motif suivant
    lc(); phtg(); avf(2); p3htd(); bc()
    motif()

lg(tailleDeGrille); eh(); ag()
translater(1, -3)
for j in range(1, nombreDeLignes + 1):
    for i in range(nombreDeColonnes // 2):
        motifDouble()
        # Motif double suivant
        lc(); phtd(); avf(2); p3htg(); bc()
    # Ligne suivante
    if j % 2 == 1:
        lc(); pdt(); avf(6); bc()
    else:
        lc(); avf(4); pdt(); bc()
st()
