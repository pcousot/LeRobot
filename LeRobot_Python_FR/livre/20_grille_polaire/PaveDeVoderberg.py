from LibRobot import *

# Dessiner un pavé de Voderberg
tailleQuadrillage = 90
theta = 15

# Dessiner un pavé de Voderberg en commençant par la
# pointe.
def pave():
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(11 * theta)
    av(); pdt(); rt(7 * theta)
    av(); pdt(); rt(4 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt(); rt(13 * theta)
    av(); pdt()

eb(); ag(); lg(tailleQuadrillage); rt(-20); pave()
st()
