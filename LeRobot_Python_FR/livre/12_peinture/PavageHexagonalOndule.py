from LibRobot import *

# Pavage du plan en noir et blanc par un motif
# hexagonal ondulé
l = 15  # Côté de la grille

def tourDuMotif():
    lg(l); phtg(); vd(); vg()
    lgRT(l, 60); phtg(); vd(); vg()
    pqtg(); vd(); vg()
    lg(l); phtg(); vd(); vg()
    lgRT(l, 60); phtg(); vd(); vg()
    pqtg(); vd(); vg()

def interieurDuMotif():
    ec(2)  # Pour éviter les fuites
    lg(l); phtg(); vd()
    lgRT(l, 60); phtg(); vg(); vd()
    lg(l); phtd(); vg()
    lgRT(l, 60); p3htg(); vd()
    lg(l); phtg(); vg(); vd()
    lgRT(l, 60); phtd(); vg()
    pqtg(); vd()
    pqtg(); vg(); vd()
    pqtd(); vg()
    ec(1)

def peindreLinterieurDuMotif():
    lc(); p3htg(); av(); peindre(); pdt(); av()
    bc(); p3htg()

# Dessiner un motif en partant et en arrivant au coin
# inférieur gauche, le robot étant orienté à l'est
def motif():
    tourDuMotif(); interieurDuMotif()
    peindreLinterieurDuMotif()

def allerAuMotifSuivant():
    lc(); lgRT(l, 60); avf(4); lg(l); avf(4); bc()

def enHaut():
    lc(); lg(1); eh(); lg(l); pdt(); avf(4); pqtg()
    bc()

def aGauche():
    lc(); lg(1); ag(); av(); lg(l); avf(1); bc()

def ligne():
    for i in range(3):
        motif(); allerAuMotifSuivant()
    motif()

def decaler():
    lc(); lg(l); avf(2); lgRT(l, 60); avf(2); bc()

def descendre():
    lc(); pqtd(); lgRT(l, 60); avf(2); pqtg(); bc()

enHaut(); aGauche(); ligne()
aGauche(); decaler(); descendre(); ligne()
aGauche(); descendre(); ligne()
aGauche(); decaler(); descendre(); ligne()
aGauche(); descendre(); ligne()
aGauche(); decaler(); descendre(); ligne()
st()
