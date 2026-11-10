from LibRobot import *

# Dessiner une étoile formée de quatre astroïdes
# à boucles
def arc():
    phtg(); vd(); phtg(); vd(); phtg(); vd()

def astroide():
    arc(); p3htd(); arc(); p3htd(); arc(); p3htd()
    arc()

def etoile():
    astroide(); phtd(); astroide(); phtd()
    astroide(); phtd(); astroide()

etoile(); st()
