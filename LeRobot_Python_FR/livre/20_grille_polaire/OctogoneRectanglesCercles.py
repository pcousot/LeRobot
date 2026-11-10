from LibRobot import *

# Dessiner un octogone décoré
r = 24

def octogone():
    pqtd(); lgRT(2 * r, 45)
    for i in range(8):
        av(); rt(45)

def rectangle_Inscrit():
    for i in range(2):
        lg(r); av(); lgRT(2 * r, 45); av(); lg(r)
        av(); pqtd(); lgRT(2 * r, 45)
        av(); pqtd()

def trois_quarts_de_cercle():
    phtg(); lg(r); av(); phtd()
    for i in range(4):
        ec(2); vd(); vd(); vd(); ec(1); pdt()
        lgRT(2 * r, 45); av(); pdt()
        lg(r)

octogone(); pqtg(); rectangle_Inscrit()
lg(r); phtg(); av(); lgRT(2 * r, 45); phtd()
av()
pqtd()
rectangle_Inscrit(); trois_quarts_de_cercle()
st()
