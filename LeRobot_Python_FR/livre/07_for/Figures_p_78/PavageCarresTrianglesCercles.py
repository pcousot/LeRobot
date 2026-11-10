from LibRobot import *

# Dessiner un pavage de carrés, triangles et cercles

# Dessiner un carré de côté de taille 2, le robot
# partant du coin inférieur gauche tourné vers l'est,
# et arrivant crayon baissé au coin inférieur droit
# également orienté à l'est.
def carre():
    # Dessiner le carré.
    av(); av(); pqtg(); av(); av(); pqtg()
    av(); av(); pqtg(); av(); av(); pqtg()
    # Avancer au coin inférieur droit.
    av(); av()

# Dessiner deux triangles opposés par un sommet
# inscrits dans un carré invisible du quadrillage de
# côté 2, en partant du coin inférieur gauche du carré
# tourné vers l'est, et en arrivant au coin inférieur
# droit, crayon baissé et tourné vers l'est.
def triangles():
    lc(); av(); bc()
    pqtg(); av(); av(); p3htg(); av(); p3htg()
    av(); av(); p3htd(); av(); p3htg()
    lc(); av(); bc()

# Dessiner un cercle de rayon 1 inscrit dans un carré
# invisible du quadrillage de côté 2, en partant du
# coin inférieur gauche du carré tourné vers l'est, et
# en arrivant au coin inférieur droit du carré, crayon
# baissé et tourné vers l'est.
def cercle():
    lc(); av(); bc()
    vg(); vg(); vg(); vg()
    lc(); av(); bc()

# Dessiner une ligne constituée d'un motif répété 7
# fois, le motif étant formé d'un carré, de triangles
# et d'un cercle juxtaposés, le robot partant du coin
# inférieur gauche de la ligne orienté vers l'est, et
# arrivant au coin inférieur droit également orienté à
# l'est.
def ligneCarre():
    for i in range(7):
        # Le robot est crayon baissé, à l'est, en bas à
        # gauche du motif
        carre(); triangles(); cercle()

# Comme ligneCarre, avec le motif formé de triangles,
# d'un cercle et d'un carré.
def ligneTriangles():
    for i in range(7):
        triangles(); cercle(); carre()

# Comme ligneCarre, avec le motif formé d'un cercle,
# d'un carré et de triangles.
def ligneCercle():
    for i in range(7):
        cercle(); carre(); triangles()

# Ramener le robot du coin inférieur droit d'une ligne
# au coin inférieur gauche de la ligne suivante, sans
# dessiner, orienté à l'est et crayon baissé.
def alaLigne():
    lc(); ag(); pqtd(); av(); av(); pqtg(); bc()

# Paver l'écran de 11 lignes de motifs commençant par
# un carré, puis par des triangles, puis par un
# cercle, du coin supérieur droit au coin inférieur
# droit de l'écran, le robot étant orienté à l'est.
def pavage():
    # Dessiner les lignes 1 à 9 de haut en bas.
    for j in range(3):
        alaLigne(); ligneCarre()
        alaLigne(); ligneTriangles()
        alaLigne(); ligneCercle()
    # Dessiner les lignes 10 puis 11.
    alaLigne(); ligneCarre()
    alaLigne(); ligneTriangles()

# Aller au coin supérieur droit, orienté à l'est.
eh(); ad(); pqtd()
# Paver l'écran.
pavage(); st()
