from LibRobot import *

# Dessiner un cristal à huit branches
def branche():
    phtg(); avf(5); pqtd(); phtg(); av(); pqtd(); av()
    phtd(); avf(5); pqtg()

def cristal():
    for j in range(8):
        branche()

lg(4); cristal(); st()
