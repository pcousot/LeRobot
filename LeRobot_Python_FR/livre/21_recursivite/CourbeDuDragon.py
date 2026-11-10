from LibRobot import *

# Courbe du dragon d'ordre 12
def segmentDroit(n):
    if n == 0:
        av()
    elif n > 0:
        segmentDroit(n - 1)
        pqtg()
        segmentGauche(n - 1)

def segmentGauche(n):
    if n == 0:
        av()
    elif n > 0:
        segmentDroit(n - 1)
        pqtd()
        segmentGauche(n - 1)

lg(2); pe(); segmentDroit(12); st()
