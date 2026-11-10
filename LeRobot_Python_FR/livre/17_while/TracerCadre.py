from LibRobot import *

# Tracer un cadre autour du dessin

# Rejoindre le bord en avançant tout droit
def auBord():
    while not tb():
        av()

def cadre():
    # Rejoindre le bord supérieur sans rien tracer
    lc(); auBord()
    # Tracer la moitié droite du bord supérieur
    pqtd(); bc(); auBord()
    # Tracer le bord droit
    pqtd(); auBord()
    # Tracer le bord inférieur
    pqtd(); auBord()
    # Tracer le bord gauche
    pqtd(); auBord()
    # Tracer le bord supérieur
    pqtd(); auBord()
    # Placer le robot au centre, orienté au nord
    ce(); pn()

cadre(); st()
