from LibRobot import *

# Dessiner et peindre une balle en couleur
epaisseurBord = 3
demiRayon = 30

def quartDeFigure():
    lg(demiRayon); vg(); vg()
    lg(2 * demiRayon); vg(); ce(); pdt()

# Placer le robot dans la zone à peindre et peindre
def peindreQuartDeFigure():
    lg(demiRayon // 2)
    lc(); ce(); pqtd(); av(); bc(); peindre()

ec(epaisseurBord)
for i in range(4):
    quartDeFigure()
for i in range(2):
    cc(bleu); peindreQuartDeFigure()
    cc(violet); peindreQuartDeFigure()
st()
