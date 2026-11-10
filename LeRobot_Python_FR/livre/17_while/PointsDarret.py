from LibRobot import *

# Dessiner la grille de tous les points d'arrêt
# possibles du robot

# Avancer tout droit jusqu'au bord du cadre de
# déplacement du robot
def auBord():
    while not tb():
        av()

# Le robot étant au bord nord orienté vers le sud,
# marquer les points d'arrêt sur la verticale, puis
# l'avancer vers l'est et le réorienter au nord, si
# possible.
def verticaleNordSud():
    dp()
    while not tb():
        av(); dp()
    pqtd()
    if not tb():
        av(); pqtd()

# Le robot étant au bord sud orienté vers le nord,
# marquer les points d'arrêt sur la verticale, puis
# l'avancer vers l'est et le réorienter au sud, si
# possible.
def verticaleSudNord():
    dp()
    while not tb():
        av(); dp()
    pqtg()
    if not tb():
        av(); pqtg()

def dg():
    # Rejoindre le bord nord
    lc(); auBord()
    # Rejoindre le coin nord-est
    pqtd(); auBord()
    # Orienter le robot au sud
    pqtd()
    # Marquer les verticales, d'est en ouest
    while not tb():
        verticaleNordSud()
        verticaleSudNord()
    # Remettre le robot au centre orienté vers le nord
    ce(); pn()

dg(); st()
