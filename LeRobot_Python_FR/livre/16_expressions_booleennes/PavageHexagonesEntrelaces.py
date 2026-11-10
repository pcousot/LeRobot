from LibRobot import *

# Dessiner un pavage d'hexagones entrelacés
uniteTailleGrille = 2
nombreDeLignes = 8
nombreDeColonnes = 6

# Carreaux de 4 x 8 unités et orientation nord pour
# l'hexagone vertical, carreaux de 8 x 4 unités et
# orientation ouest pour l'hexagone horizontal.
def hexagone():
    for i in range(2):
        for j in range(3):
            phtd(); av()
        phtd()

# Carreaux de largeur x et de hauteur y unités
def carreaux(x, y):
    lgX(x * uniteTailleGrille)
    lgY(y * uniteTailleGrille)

def pavageHexagonesVerticaux():
    lg(uniteTailleGrille); ag(); eh()
    carreaux(4, 8)
    lc(); pdt(); av(); pdt(); bc()
    for l in range(1, nombreDeLignes + 1):
        for c in range(nombreDeColonnes - 1):
            hexagone()
            # Aller à l'hexagone suivant
            lc(); pqtd(); avf(4); pqtg(); bc()
        if l % 2 == 1:
            hexagone()
        # Aller à la ligne suivante
        lc(); lg(uniteTailleGrille); ag()
        carreaux(4, 8)
        if l % 2 == 1:
            pdt(); av(); pqtg(); avf(2); pqtg()
        else:
            pdt(); av(); pdt()
        bc()

def pavageHexagonesHorizontaux():
    lg(uniteTailleGrille); ag(); eh()
    lc(); p3htd()
    lg(14 * uniteTailleGrille)
    av(); p3htd(); bc()
    carreaux(8, 4)
    for l in range(1, nombreDeLignes + 1):
        for c in range(nombreDeColonnes - 2):
            hexagone()
            # Aller à l'hexagone suivant
            lc(); pdt(); avf(2); pdt(); bc()
        if l % 2 == 1:
            hexagone()
        # Aller à la ligne suivante
        lc(); lg(uniteTailleGrille); ag()
        pdt(); lgX(6 * uniteTailleGrille)
        av(); pdt()
        carreaux(8, 4)
        if l % 2 == 1:
            pqtg(); avf(2); pqtg(); avf(2); pdt()
        else:
            pqtg(); avf(2); pqtg(); av(); pdt()
        bc()

pavageHexagonesVerticaux()
pavageHexagonesHorizontaux()
st()
