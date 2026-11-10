from LibRobot import *

# Motif du pavage hexagonal ondulé dessiné sur un
# hexagone de triangles équilatéraux
l = 50  # Côté d'un triangle

# Dessiner une rangée de n triangles équilatéraux
def rangeeDeTrianglesEquilateraux(n):
    lgRT(l, 60)
    for i in range(n):
        phtg(); av(); pqtd(); av(); phtg()
    pdt(); avf(2 * n); pdt()

def hexagoneDeTrianglesEquilateraux():
    for i in range(2):
        rangeeDeTrianglesEquilateraux(4)
        phtg(); av(); phtd()
        rangeeDeTrianglesEquilateraux(3)
        phtg(); av(); phtd()
        lg(l); avf(2); phtd()
        lgRT(l, 60); avf(2); p3htd()
    phtd(); avf(2); phtg()

def tourDuMotif():
    lg(l); phtg(); vd(); vg()
    lgRT(l, 60); phtg(); vd(); vg()
    pqtg(); vd(); vg()
    lg(l); phtg(); vd(); vg()
    lgRT(l, 60); phtg(); vd(); vg()
    pqtg(); vd(); vg()

def interieurDuMotif():
    lg(l); phtg(); vd()
    lgRT(l, 60); phtg(); vg(); vd()
    lg(l); phtd(); vg()
    lgRT(l, 60); p3htg(); vd()
    lg(l); phtg(); vg(); vd()
    lgRT(l, 60); phtd(); vg()
    pqtg(); vd()
    pqtg(); vg(); vd()
    pqtd(); vg()

pqtd(); hexagoneDeTrianglesEquilateraux()
ec(2); tourDuMotif()
ec(4); interieurDuMotif()
st()
