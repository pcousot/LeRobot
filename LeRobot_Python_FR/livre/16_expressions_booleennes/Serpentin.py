from LibRobot import *

# Dessiner un serpentin
def dessinSerpentin(l):
    for i in range(1, 2 * l + 1):
        if i <= l:
            lg(i)
        else:
            lg(2 * l + 1 - i)
        if i % 2 == 1:
            # Demi-cercle supérieur
            vd(); vd()
        # Demi-cercle inférieur
        else:
            vg(); vg()

ag(); dessinSerpentin(13); st()
