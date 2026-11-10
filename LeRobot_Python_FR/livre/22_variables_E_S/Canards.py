from LibRobot import *

# Dessiner des canards

# Dessiner un canard sur une
# grille de taille l sans changer
# la grille originelle
def canard(l):
    # Mémoriser les dimensions de la grille originelle
    lX = valLgX(); lY = valLgY()
    # Dessiner un canard avec une grille de taille l
    lg(l)
    avf(19)  # Ligne de flottaison
    lgX(3 * l); lgY(7 * l); phtg()  # Queue
    av(); pdt(); lgX(4 * l); lgY(2 * l); av()
    lgX(6 * l); lgY(3 * l); p3htd(); vg()  # Dos
    lgX(4 * l); lgY(l); vg(); pdt()
    lg(l); avf(2); lg(3 * l); vg(); vg()  # Tête
    lc(); pqtg(); av(); dc(); pdt(); av()  # Oeil
    pqtg(); bc()
    lgX(2 * l); lgY(l); av(); phtd(); av()  # Bec
    pqtg(); av()
    lgX(2 * l); lgY(6 * l); av()  # Poitrail
    phtg()
    # Placer le robot à l'arrière du canard
    lg(l); avf(18)
    # Restituer la grille originelle
    lgX(lX); lgY(lY)

lg(6); pe(); canard(3); av(); canard(2); av()
canard(1); av(); canard(1); st()
