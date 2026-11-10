from LibRobot import *

# Pavage du plan à l'aide de deux spirales
# formées de pavés de Voderberg
tailleQuadrillage = 6
n = 12  # n pavés contigus forment un demi-cercle
theta = 15
c = 4  # Nombre de demi-couronnes constituant une spirale

# Dessiner un pavé de Voderberg en commençant par la
# pointe.
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
# base.
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

def spirale():
    for i in range(1, c + 1):
        for j in range(n):
            pavePointe()
            for k in range(i - 1):
                paveBase(); pavePointe()

# Dessiner un pavé de Voderberg miroir en commençant
# par la pointe.
def pavePointeMiroir():
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(4 * theta)
    av(); pdt(); rt(7 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt()

# Dessiner un pavé de Voderberg miroir en commençant
# par la base.
def paveBaseMiroir():
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(7 * theta)
    av(); avf(-1); rt(-(7 * theta))

def spiraleMiroir():
    for i in range(1, c + 1):
        for j in range(n):
            pavePointeMiroir()
            for k in range(i - 1):
                paveBaseMiroir(); pavePointeMiroir()

lg(tailleQuadrillage); spirale()
ce(); lg(tailleQuadrillage); pn(); lc()
av(); pdt(); rt(11 * theta)
av(); pdt(); rt(11 * theta)
av(); pdt(); rt(11 * theta)
av(); pdt()
bc()
spiraleMiroir(); st()
