from LibRobot import *

# Dessiner un grillage en superposant deux quadrillages
# dont l'un est tourné d'un huitième de tour

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
    rejoindreCoinNordEst()
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

def rejoindreCoinNordOuest():
    # Rejoindre le bord nord
    lc(); pn(); auBord()
    # Rejoindre le coin nord-ouest
    pw(); auBord()

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
    rejoindreCoinNordOuest()
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

def rejoindreCoinSudOuest():
    # Rejoindre le bord sud
    lc(); ps(); auBord()
    # Rejoindre le coin sud-ouest
    pw(); auBord()

# Partant du bord ouest ou nord, tracer l'oblique du
# nord-ouest vers le sud-est et revenir au bord
# d'origine.
def obliqueNOSE():
    # Tracer l'oblique
    pse(); bc(); auBord()
    # Revenir
    pnw(); lc(); auBord()

def tracerObliquesNOSE():
    rejoindreCoinSudOuest()
    # Tracer les obliques NO-SE partant du bord ouest
    pn()
    while not tb():
        av()
        obliqueNOSE()
        pn()
    # Tracer les obliques NO-SE partant du bord nord
    pe()
    while not tb():
        av()
        obliqueNOSE()
        pe()

def rejoindreCoinSudEst():
    # Rejoindre le bord sud
    lc(); ps(); auBord()
    # Rejoindre le coin sud-est
    pe(); auBord()

# Partant du bord sud ou ouest, tracer l'oblique du
# sud-ouest vers le nord-est et revenir au bord
# d'origine.
def obliqueSONE():
    # Tracer l'oblique
    pne(); bc(); auBord()
    # Revenir
    psw(); lc(); auBord()

def tracerObliquesSONE():
    rejoindreCoinSudEst()
    # Tracer les obliques SO-NE partant du bord sud
    pw()
    while not tb():
        av()
        obliqueSONE()
        pw()
    # Tracer les obliques SO-NE partant du bord ouest
    pn()
    while not tb():
        av()
        obliqueSONE()
        pn()

tracerVerticales()
tracerHorizontales()
tracerObliquesNOSE()
tracerObliquesSONE()
st()
