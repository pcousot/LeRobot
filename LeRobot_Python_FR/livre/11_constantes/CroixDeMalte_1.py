from LibRobot import *

# Dessiner une croix de Malte
largeur = 20  # Largeur d'une branche
longueur = 30  # Longueur d'une branche

# Dessiner une branche verticale avec le robot
# orienté au nord ou au sud
def brancheVerticale():
    lgX(largeur); lgY(longueur)
    vg(); pdt(); av(); av(); pdt(); vg(); pqtg()

# Dessiner une branche horizontale avec le robot
# orienté à l'est ou à l'ouest
def brancheHorizontale():
    lgX(longueur); lgY(largeur)
    vg(); pdt(); av(); av(); pdt(); vg(); pqtg()

def croixDeMalte():
    for i in range(2):
        brancheVerticale(); brancheHorizontale()

croixDeMalte(); st()
