from LibRobot import *

# Dessiner des stries sur les côtés d'un octogone
lc(); avf(5); bc(); lg(4)
for i in range(8):
    # Dessiner 10 stries de longueurs 2, 4, ..., 20.
    for j in range(1, 11):
        # Dessiner une strie de longueur (2 * j) centrée
        # sur un côté de l'octogone.
        avf(j); avf(-2 * j); avf(j)
        # Passer à la strie suivante (sans tracer le côté
        # de l'octogone).
        lc(); pqtd(); av(); pqtg(); bc()
    # Tourner le robot perpendiculairement au côté
    # suivant.
    phtd()
st()
