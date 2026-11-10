from LibRobot import *

# Dessiner un rapporteur gradué en degrés
longueur = 16

eb(); pe(); lc()
for i in range(181):
    if i == 0 or i == 90 or i == 180:
        bc(); avf(longueur - 7); lc(); avf(2)
        ecrire(entierEnChaine(i)); av(); bc(); avf(4)
        lc()
    elif i % 10 == 5:
        avf(longueur - 2); bc(); avf(2); lc()
    elif i % 10 == 0:
        avf(longueur - 5); ecrire(entierEnChaine(i))
        avf(2); bc(); avf(3); lc()
    else:
        avf(longueur - 1); bc(); av(); lc()
    pdt(); avf(longueur); pdt(); rt(1)
st()
