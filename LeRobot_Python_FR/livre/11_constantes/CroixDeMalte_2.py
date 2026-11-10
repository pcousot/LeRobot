from LibRobot import *

# Dessiner six croix de Malte de largeurs et de
# longueurs différentes
espacement = 10  # Pixels entre deux croix

def brancheVerticale(longueur, largeur):
    lgX(largeur); lgY(longueur)
    vg(); pdt(); av(); av(); pdt(); vg(); pqtg()

def brancheHorizontale(longueur, largeur):
    lgX(longueur); lgY(largeur)
    vg(); pdt(); av(); av(); pdt(); vg(); pqtg()

def croixDeMalte(largeur, longueur):
    # Partant du bord ouest de la croix, décaler le
    # robot à droite au centre de la croix
    lg(1); lc(); pqtd(); avf(longueur); pqtg(); bc()
    # Dessiner la croix de Malte à quatre branches
    for i in range(2):
        brancheVerticale(longueur, largeur)
        brancheHorizontale(longueur, largeur)
    # Décaler le robot à droite à l'est de la croix
    lg(1); lc(); pqtd(); avf(longueur + espacement)
    pqtg(); bc()

ag()
croixDeMalte(10, 15); croixDeMalte(15, 20)
croixDeMalte(20, 25); croixDeMalte(25, 30)
croixDeMalte(10, 35); croixDeMalte(35, 35)
st()
