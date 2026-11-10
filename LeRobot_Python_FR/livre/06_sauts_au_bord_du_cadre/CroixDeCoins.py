from LibRobot import *

# Dessiner des croix au bord et au centre du cadre
ag(); dc()  # au milieu du bord gauche
ad(); dc()  # au milieu du bord droit
ce(); eh(); dc()  # au milieu du bord supérieur
eb(); dc()  # au milieu du bord inférieur
eh(); ag(); dc()  # au coin supérieur gauche
ad(); dc()  # au coin supérieur droit
eb(); ag(); dc()  # au coin inférieur gauche
ad(); dc()  # au coin inférieur droit
ce(); dc()  # au centre
st()
