from LibRobot import *

# Pavage du plan à l'aide de trois spirales
# formées de pavés de Voderberg
tailleQuadrillage = 6
longueur = 3  # Nombre de tiers de couronnes constituant une spirale
theta = 15

# Dessiner un pavé de Voderberg en commençant par la
# pointe
def pavePointe():
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(7 * theta)
    av(); pdt(); rt(4 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt()

# Dessiner un pavé de Voderberg en commençant par la
# base
def paveBase():
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(4 * theta)
    av(); avf(-1); rt(-(4 * theta))

def segment(n):
    for i in range(4):
        pavePointe()
        for j in range(n):
            paveBase(); pavePointe()

def virage(n):
    for i in range(4):
        pavePointe()
        for j in range(n - 1):
            paveBase(); pavePointe()

def spirale(l):
    for i in range(1, l + 1):
        segment(i); virage(i)

ce(); lg(tailleQuadrillage); pn()
spirale(longueur)
ce(); lg(tailleQuadrillage); pn(); rt(8 * theta)
spirale(longueur)
ce(); lg(tailleQuadrillage); pn(); rt(16 * theta)
spirale(longueur)
st()
