from LibRobot import *

# Mosaïque de l'Alhambra
tailleLigne = 7
nombreDeLignes = 6

# Au départ et à l'arrivée du dessin du motif, le
# robot est au pied du motif, orienté au nord
def motif():
    vd(); pqtg(); vg(); vg(); pqtg(); vd(); pdt()
    lc(); av(); peindre(); avf(-1); bc()

# Déplacer le robot du pied d'un motif au suivant,
# le robot étant orienté au nord
def motifSuivant():
    lc(); pqtd(); avf(2); pqtg(); bc()

# Ligne de pavés
def ligne():
    for i in range(tailleLigne - 1):
        motif(); motifSuivant()
    motif()

# Revenir au début de la ligne suivante
def aLaLigne():
    lc(); pqtd(); avf(-(2 * (tailleLigne - 1)))
    pqtg(); avf(-2); bc()

def pavage():
    for i in range(nombreDeLignes - 1):
        ligne(); aLaLigne()
    ligne()

lc(); ag(); eh(); pqtd(); av(); pqtd(); avf(2)
pdt(); bc()
pavage(); st()
