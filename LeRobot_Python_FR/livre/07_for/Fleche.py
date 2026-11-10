from LibRobot import *

# Dessiner une flèche verticale
def plume():
    av(); p3htg(); av(); lc(); p3htg(); av(); av()
    p3htg(); bc(); av(); phtd()

def empennage():
    for i in range(5):
        plume()

def tige():
    for i in range(10):
        av()

def pointe():
    pqtg(); av(); p3htd(); av(); pqtd(); av()
    p3htd(); av()

eb(); empennage(); tige(); pointe(); st()
