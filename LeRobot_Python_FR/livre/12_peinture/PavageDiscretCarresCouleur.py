from LibRobot import *

# Pavage de carrés disjoints en couleur
tailleGrille = 19
tailleCrayon = 15
longueurLigne = 23

# Dessiner une colonne de gros points de la couleur
# du crayon, puis passer à la colonne suivante
def colonne():
    ag()
    for i in range(longueurLigne):
        av(); dp()
    pqtg(); av(); pqtd()

lg(tailleGrille); ec(tailleCrayon); eb(); pqtd(); lc()
cc(jaune); colonne(); cc(bleu); colonne()
cc(violet); colonne(); cc(vert); colonne()
cc(rouge); colonne(); cc(indigo); colonne()
cc(noir); colonne()
cc(indigo); colonne(); cc(rouge); colonne()
cc(vert); colonne(); cc(violet); colonne()
cc(bleu); colonne(); cc(jaune); colonne()
st()
