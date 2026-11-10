from LibRobot import *

# Pavage du disque avec des pavés de Voderberg

# Les pavés de Voderberg sont disposés en couronnes
# circulaires
tailleQuadrillage = 8
n = 12  # 2 * n pavés forment un cercle
c = 3  # Nombre de couronnes
theta = 15

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

def pavage():
    for i in range(1, c + 1):
        for j in range(2 * n):
            pavePointe()
            for k in range(i - 1):
                paveBase(); pavePointe()
        # Passer à la couronne extérieure suivante.
        lc()
        av(); pdt(); rt(11 * theta)
        av(); pdt(); rt(11 * theta)
        av(); pdt(); rt(11 * theta)
        av(); pdt(); rt(-(9 * theta))
        bc()

lg(tailleQuadrillage); pavage(); st()
