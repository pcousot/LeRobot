from LibRobot import *

# Carrelage en trois couleurs
nombreDeLignes = 10  # pair
longueurLigne = 10  # pair

# Le robot étant orienté à l'est, au coin inférieur
# gauche, dessiner un carré en noir et revenir au
# point de départ, orienté au sud.
def carre():
    cc(noir)
    av(); pqtg(); av(); pqtg(); av(); pqtg(); av()

# Le robot étant en bas à gauche du carré, orienté
# au sud, peindre le carré de la couleur du crayon,
# puis placer le robot en bas à gauche du carré
# suivant, tourné vers l'est.
def peindreCarre():
    phtd(); peindre(); p3htg(); cc(noir); av()

# Dessiner une ligne de petits carreaux bleus et
# rouges
def ligneImpaire():
    for i in range(longueurLigne // 2):
        carre(); cc(bleu); peindreCarre()
        carre(); cc(rouge); peindreCarre()

# Dessiner une ligne de petits carreaux blancs et
# indigos
def lignePaire():
    for i in range(longueurLigne // 2):
        carre(); cc(blanc); peindreCarre()
        carre(); cc(indigo); peindreCarre()

def aLaLigne():
    avf(-longueurLigne); lc(); pqtd(); av(); pqtg()
    bc()

def pavage():
    for i in range(nombreDeLignes // 2):
        ligneImpaire(); aLaLigne()
        lignePaire(); aLaLigne()

ag(); eh(); avf(-1); pqtd()
pavage(); st()
