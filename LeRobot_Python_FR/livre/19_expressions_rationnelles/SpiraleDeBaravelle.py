from LibRobot import *

# Spirale de Baravelle
n = 7
deuxPuissanceN = 128

def spirale():
    for i in range(n):
        av(); p3htd(); av(); p3htd(); av(); pqtd()
        av(); phtd()
        lg(valLgX() / 2)
        av(); p3htd(); av(); av(); p3htd(); av()
        pqtd(); av(); phtd()

def carre():
    avf(2); pqtd(); avf(2); pqtd(); avf(2); pqtd(); avf(2)
    pqtd()

# Placer le robot au coin inférieur gauche du cadre,
# sur une grille de côté deuxPuissanceN
def coin():
    lg(1); eb(); ag(); lg(deuxPuissanceN)

coin(); carre(); spirale()
coin(); pn(); avf(2); pqtd(); avf(2); pqtd()
spirale()
coin(); pn(); avf(2); phtg(); peindre()
coin(); pe(); avf(2); phtd(); peindre()
st()
