from LibRobot import *

# Dessiner et peindre une fleur stylisée
tailleGrille = 12
epaisseurTige = 3
epaisseurBord = 1

eb(); lg(tailleGrille)
# Bas de la tige
ec(epaisseurTige); pqtd(); vg()
av(); av(); av()
# Feuille droite :
# dessiner le pourtour
ec(epaisseurBord); vd(); pqtd(); vd()
# peindre l'intérieur
cc(vert); phtg(); peindre(); p3htd()
# Feuille gauche :
# dessiner le pourtour
cc(noir); vg(); pqtg(); vg()
# peindre l'intérieur
cc(vert); phtd(); peindre(); p3htg()
# Haut de la tige
cc(noir); ec(epaisseurTige)
av(); av(); av(); av()
# Coeur :
# dessiner le pourtour du coeur
ec(epaisseurBord); pqtd()
vg(); vg(); vg(); vg()
# pétales
cc(noir); pqtd(); vg(); vg(); vg()
cc(violet); phtd(); peindre(); phtd()
cc(noir); pqtd(); vg(); vg(); vg()
cc(violet); phtd(); peindre(); phtd()
cc(noir); pqtd(); vg(); vg(); vg()
cc(violet); phtd(); peindre(); phtd()
cc(noir); pqtd(); vg(); vg(); vg()
cc(violet); phtd(); peindre(); phtd()
# peindre l'intérieur du coeur
pqtd(); cc(jaune); peindre()
st()
