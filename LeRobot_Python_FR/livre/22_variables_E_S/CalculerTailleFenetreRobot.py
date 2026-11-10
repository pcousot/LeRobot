from LibRobot import *

# Calcul de la taille de la fenêtre de déplacement du
# robot
largeur = 0
hauteur = 0

def largeurFenetreRobot():
    global largeur
    lg(1); lc(); ce(); ag(); pe(); largeur = 0
    while not tb():
        largeur += 1; av()

def hauteurFenetreRobot():
    global hauteur
    lg(1); lc(); ce(); eb(); pn(); hauteur = 0
    while not tb():
        hauteur += 1; av()

largeurFenetreRobot(); hauteurFenetreRobot()
message("(" + str(largeur) + " x " + str(hauteur) + ")")
marquerUnePause()
