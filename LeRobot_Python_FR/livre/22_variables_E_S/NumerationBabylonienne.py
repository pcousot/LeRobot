from LibRobot import *

# Écrire un nombre en numération babylonienne
x = 6  # Taille de la grille

# Tête de clou
def teteDeClou():
    lc(); pqtd(); av(); pqtg(); bc()
    lgY(valLgY() * 2); vg(); avf(-2); vg()
    lc(); pqtg(); av(); pqtg(); bc()
    lg(x)

# Clou dont la pointe est de hauteur n
def un(n):
    lc(); pqtd(); av(); pqtg(); bc()
    avf(n); lc(); pqtg(); av(); pqtd(); teteDeClou()
    lc(); avf(-n); bc()

# Chevron
def dix():
    lc(); av(); pqtd(); bc()
    lgX(x * 2); vd(); p3htd(); lgX(x)
    lgY(x * 2); vd(); p3htd(); lgY(x)
    lgX(x * 2); vd()
    lc(); p3htg(); av(); p3htg(); bc(); lg(x)

# Laisser n blancs horizontalement partant d'une et
# revenant à une orientation nord du robot
def espacement(n):
    lc(); pqtd(); avf(n); pqtg(); bc()

def dizainesDesUnitesSexagesimales(chiffreDesDizaines):
    if chiffreDesDizaines == 1:
        dix()
    elif chiffreDesDizaines == 2:
        dix(); dix()
    elif chiffreDesDizaines == 3:
        dix(); dix(); dix()
    elif chiffreDesDizaines == 4:
        lc(); pqtd(); avf(2); pqtg(); bc()
        dix()
        lc(); avf(2); pqtg(); avf(4); pqtd(); bc()
        dix(); dix(); dix()
        lc(); avf(-2); bc()
    elif chiffreDesDizaines == 5:
        lc(); pqtd(); av(); pqtg(); bc()
        dix(); dix()
        lc(); avf(2); pqtg(); avf(5); pqtd(); bc()
        dix(); dix(); dix()
        lc(); avf(-2); bc()
    else:
        pass

def unitesDesUnitesSexagesimales(chiffreDesUnites):
    if chiffreDesUnites == 1:
        un(4)
    elif chiffreDesUnites == 2:
        un(4); un(4)
    elif chiffreDesUnites == 3:
        un(4); un(4); un(4)
    elif chiffreDesUnites == 4:
        lc(); pqtd(); av(); pqtg(); bc()
        lg(x * 2); teteDeClou(); lg(x)
        lc(); avf(4); pqtg(); avf(5); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(-4); bc()
    elif chiffreDesUnites == 5:
        lc(); pqtd(); av(); pqtg(); bc()
        un(2); un(2)
        lc(); avf(4); pqtg(); avf(5); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(-4); bc()
    elif chiffreDesUnites == 6:
        un(2); un(2); un(2)
        lc(); avf(4); pqtg(); avf(6); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(-4); bc()
    elif chiffreDesUnites == 7:
        lc(); pqtd(); av(); pqtg(); bc()
        lgX(x * 2); teteDeClou()
        lc(); avf(2); pqtg(); avf(5); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(2); pqtg(); avf(6); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(-4); bc()
    elif chiffreDesUnites == 8:
        lc(); pqtd(); av(); pqtg(); bc()
        teteDeClou(); teteDeClou()
        lc(); avf(2); pqtg(); avf(5); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(2); pqtg(); avf(6); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(-4); bc()
    elif chiffreDesUnites == 9:
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(2); pqtg(); avf(6); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(2); pqtg(); avf(6); pqtd(); bc()
        teteDeClou(); teteDeClou(); teteDeClou()
        lc(); avf(-4); bc()
    else:
        pass

# En position médiale et uniquement pour marquer
# l'absence d'unités dans cette position
def zeroBabylonien():
    lc(); pqtd(); avf(6); bc()
    p3htg(); avf(3); lg(x * 2); vd(); avf(-1); vd()
    lc(); pdt(); lg(x); av(); bc(); lg(x * 2); vd()
    avf(-1)
    vd(); lc(); lg(x * 4); av(); p3htg(); bc(); lg(x)

def unitesEnBabylonien(unitesSexagesimales):
    if unitesSexagesimales == 0:
        zeroBabylonien()
    else:
        dizainesDesUnitesSexagesimales(unitesSexagesimales // 10)
        espacement(1)
        unitesDesUnitesSexagesimales(unitesSexagesimales % 10)
    espacement(4)

def nombreEnBabylonien(c):
    if c < 60:
        unitesEnBabylonien(c)
    else:
        nombreEnBabylonien(c // 60)
        unitesEnBabylonien(c % 60)

write("Nombre à coder n = ")
n = lireEntier()
lg(x); ag()
nombreEnBabylonien(n)
st()
