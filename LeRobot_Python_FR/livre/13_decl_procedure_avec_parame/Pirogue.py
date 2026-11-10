from LibRobot import *

# Dessiner une pirogue et ses rameurs
nombreDeRameurs = 12

# Dessiner une pirogue de n rameurs
def pirogue(n):
    # Dessiner le fond de la pirogue
    pqtd(); avf(n)
    # Dessiner l'avant de la pirogue
    lg(3); phtg(); av(); p3htg(); lg(12)
    # Dessiner le dessus de la pirogue
    avf(n + 1)
    # Dessiner l'arrière de la pirogue
    lg(3); p3htg(); av(); phtg(); avf(2)
    # Placer le robot sous le premier rameur
    lc(); pqtg(); av(); pqtd(); bc()

def rameur():
    lg(3)
    # Corps
    pqtg(); avf(2)
    # Bras droit
    pqtd(); av(); pdt(); av()
    # Bras gauche
    av(); pdt(); av(); pqtg()
    # Cou
    av()
    # Tête
    pqtg(); vd(); vd(); vd(); vd()
    # Redescendre
    pqtg(); avf(3); pqtg()

# Prévoir un espace entre deux rameurs
def espace():
    lg(12); av()

# Dessiner n rameurs sur la pirogue
def rameurs(n):
    for i in range(n):
        rameur(); espace()

pirogue(nombreDeRameurs); rameurs(nombreDeRameurs)
st()
