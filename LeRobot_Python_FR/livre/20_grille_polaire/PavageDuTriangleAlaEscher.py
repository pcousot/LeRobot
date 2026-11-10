from LibRobot import *

# Pavage à la Escher du triangle
r = 5  # Taille d'une branche de l'étoile

def hexagone():
    for i in range(6):
        av(); rt(60)

def etoile():
    for i in range(6):
        av(); rt(60); av(); rt(240)

def triangleOndule():
    ec(2); phtd(); vd(); vg(); lgRT(valLgX(), 60)
    p3htg(); vd(); vg(); pqtg()
    vd(); vg()
    ec(1)

def motif():
    # Triangle
    lg(r * 5); triangleOndule()
    # Hexagone
    lc(); pqtg(); lg(r * 5); av(); phtg(); lg(r)
    av()
    bc(); lgRT(r * 2, 54)
    bc(); hexagone(); lc(); pdt(); lg(r); av()
    p3htg()
    lg(r * 5)
    av(); pqtg(); bc()
    # Étoile
    lc(); lgRT(r * 5, 60); avf(2); lg(r); pdt(); av()
    lgRT(r, 60); phtg(); bc()
    etoile(); lc(); phtd(); lg(r); pdt(); av()
    lgRT(r * 5, 60); avf(-2)
    bc()

def motifSansEtoile():
    # Triangle
    lg(r * 5); triangleOndule()
    # Hexagone
    lc(); pqtg(); lg(r * 5); av(); phtg(); lg(r)
    av()
    bc(); lgRT(r * 2, 54)
    bc(); hexagone(); lc(); pdt(); lg(r); av()
    p3htg()
    lg(r * 5)
    av(); pqtg(); bc()

for j in range(1, 4):
    for i in range(j - 1):
        motif()
    motifSansEtoile()
    lc(); lg(r * 5); pqtg(); avf(j * 2 + 1)
    pqtg()
    lgRT(r * 5, 60)
    avf(2); pdt(); bc()
st()
