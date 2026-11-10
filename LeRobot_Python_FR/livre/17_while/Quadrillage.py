from LibRobot import *

# Dessiner un quadrillage aussi grand que le cadre

# Rejoindre le bord, tout droit
def auBord():
    while not tb():
        av()

def rejoindreCoinNordEst():
    # Rejoindre le bord nord
    lc(); pn(); auBord()
    # Rejoindre le coin nord-est
    pe(); auBord()

# Le robot étant au bord nord, descendre en traçant la
# verticale puis remonter.
def verticale():
    # Orienter le robot vers le sud
    ps()
    # Descendre en traçant la verticale
    bc(); auBord()
    # Remonter du sud au nord
    lc(); pn(); auBord()

# Partant d'un robot au bord nord, tracer les verticales
# d'est en ouest et terminer avec le robot au coin
# nord-ouest.
def tracerVerticales():
    # Tracer la première verticale à l'est
    verticale()
    # Tracer les verticales suivantes, d'est en ouest
    pw()
    while not tb():
        # Avancer à l'ouest
        av()
        # Tracer la verticale
        verticale()
        pw()

# Le robot étant au bord ouest, traverser en traçant
# l'horizontale puis retraverser pour rejoindre le bord
# ouest.
def horizontale():
    # Orienter le robot vers l'est
    pe()
    # Traverser en traçant l'horizontale
    bc(); auBord(); lc()
    # Retraverser d'est en ouest
    pw(); auBord()

# Partant d'un robot au bord ouest, tracer les
# horizontales du nord au sud et terminer avec le robot
# au coin sud-ouest.
def tracerHorizontales():
    # Tracer la première horizontale au nord
    horizontale()
    # Tracer les horizontales suivantes, du nord au sud
    ps()
    while not tb():
        # Avancer au sud
        av()
        # Tracer l'horizontale
        horizontale()
        ps()

rejoindreCoinNordEst()
tracerVerticales()
tracerHorizontales()
st()
