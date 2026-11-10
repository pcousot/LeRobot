from LibRobot import *

# Dessiner un canardeau sortant de son oeuf
g = 6  # Taille de la grille

def tete():
    # Haut gauche du crâne
    lgX(3 * g); lgY(6 * g)
    vd()
    # Duvets
    pqtg(); lgX(2 * g)
    lgY(4 * g); vg(); pdt(); lc()
    av(); pqtd(); av(); bc(); pdt(); vd()
    lc(); pdt(); av(); pqtg(); av(); bc()
    lgX(g)
    lgY(6 * g); pdt(); vd()
    # Haut droit du crâne
    lc(); pdt(); av(); pqtg(); av(); bc(); pqtg()
    lgX(3 * g)
    lgY(6 * g); vd(); lg(g)
    # Contour des yeux
    lc(); phtd(); av(); p3htd(); bc()
    lgY(3 * g); vg(); vg()
    lg(g); av(); pdt(); av()
    lgY(3 * g); vg(); vg(); p3htg()
    # Oeil droit
    lgY(g); lc(); av(); bc(); ec(2); dp()
    # Oeil gauche
    lc(); phtd(); avf(2); bc(); dp(); ec(1)
    # Se placer pour dessiner les joues
    lc(); phtd(); av(); pqtg(); bc()

def joues():
    lg(5 * g); vd()
    lg(3 * g); vd()
    lg(5 * g); vd()
    lgX(4 * g); lgY(g)
    vg(); lg(5 * g); vd()
    lg(3 * g); vd()
    lg(5 * g); vd()
    lgX(2 * g)
    lgY(g); phtd(); vg(); vg()
    lg(g)
    # Se placer pour dessiner la bouche
    lc(); p3htd(); av(); bc()

def bouche():
    # Commissure droite des lèvres
    vd(); vg(); pdt(); vd(); pqtg()
    # Lèvres
    lg(2 * g); vg(); lgY(g)
    vd(); lg(2 * g); vg()
    # Commissure gauche des lèvres
    pqtd(); lg(g); vd(); pdt(); vg()
    vd()
    # Se placer pour dessiner le cou
    lc(); p3htg(); avf(2); pqtd(); bc()

def cou():
    # Côté gauche
    lgY(8 * g); av(); pdt(); av()
    # Côté droit
    lc(); pqtd(); lgX(2 * g); av()
    bc(); pqtd(); av(); lg(g)

def coquillePleine():
    # Bord supérieur droit
    phtg(); av(); pqtg(); lgY(2 * g)
    for i in range(3):
        av(); pqtd(); av(); pqtg()
    p3htd()
    # Fond
    lgX(8 * g); lgY(14 * g)
    vd(); vd()
    # Bord supérieur gauche
    phtd(); lgX(g)
    lgY(2 * g)
    for i in range(3):
        av(); pqtd(); av(); pqtg()
    # Milieu
    lg(2 * g); av(); pqtd(); av()
    lg(g)
    # Se placer pour dessiner la coquille vide
    lc(); phtg(); avf(10); pqtd(); avf(3); phtg(); bc()

def coquilleVide():
    # Bord supérieur gauche
    lgX(g); lgY(2 * g)
    for i in range(3):
        av(); pqtg(); av(); pqtd()
    # Milieu
    lg(2 * g); av(); pqtg(); av()
    # Bord supérieur droit
    pqtd(); lgX(g)
    lgY(2 * g)
    for i in range(3):
        av(); pqtg(); av(); pqtd()
    phtd()
    # Fond
    lgX(8 * g); lgY(11 * g)
    vd(); vd(); lg(g)

lg(g); lc(); avf(10); bc()
tete(); joues(); bouche(); cou(); coquillePleine()
coquilleVide(); st()
