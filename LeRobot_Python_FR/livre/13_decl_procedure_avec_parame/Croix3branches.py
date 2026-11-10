from LibRobot import *

# Croix à trois branches transversales

# Dessiner une branche de longueur i
def branche(i):
    av(); pqtd(); avf(i); pqtg(); av(); pqtg(); avf(i)
    pqtd()

def moitieDeCroixDroite():
    for i in range(1, 4):
        branche(4 - i)

def moitieDeCroixGauche():
    for i in range(1, 4):
        branche(i)

moitieDeCroixDroite()
# Haut
av(); pqtg(); av(); pqtg()
moitieDeCroixGauche()
# Bas
avf(2); pqtg(); av(); pqtg(); av()
st()
