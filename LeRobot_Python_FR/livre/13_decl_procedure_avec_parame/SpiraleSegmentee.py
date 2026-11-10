from LibRobot import *

# Dessiner une spirale segmentée

# Tourner à gauche puis avancer le robot tout droit
# de l fois la taille de la grille pour former un
# quart de tour.
def quartDeTour(l):
    pqtg(); avf(l)

# Tracer deux quarts de tour successifs pour former
# un demi-tour.
def demiTour(l):
    quartDeTour(l)
    quartDeTour(l)

# Tracer une spirale de n demi-tours
def spirale(n):
    for l in range(1, n + 1):
        demiTour(l)

lg(6); spirale(19); st()
