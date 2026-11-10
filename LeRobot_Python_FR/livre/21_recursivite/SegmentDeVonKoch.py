from LibRobot import *

# Dessiner une courbe de Von Koch
def segment(n):
    if n == 0:
        av()
    else:
        segment(n - 1)
        phtg()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        phtg()
        segment(n - 1)

lg(6); ag(); pe(); segment(3); st()
