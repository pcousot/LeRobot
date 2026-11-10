from LibRobot import *

# Mosaïque de l'Alhambra en couleur
nombreDeLignes = 3
nombreDeColonnes = 7

def motif1():
    phtd(); av(); p3htd(); avf(2); p3htg(); av()
    p3htg(); av()
    # Peindre
    phtd(); cc(indigo); peindre(); cc(noir); phtg()
    av(); avf(-1); p3htg()
    cc(jaune); peindre(); cc(noir); p3htd()
    # Continuer
    av()

def motif2():
    for i in range(2):
        av(); p3htd(); av(); phtg(); av(); pqtd()
        av(); phtg(); av(); p3htd(); av(); pqtg()
    cc(violet); peindre(); cc(noir)

eh(); ag(); lc(); avf(-2); bc()
for j in range(nombreDeLignes):
    for i in range(nombreDeColonnes):
        motif1()
        # Motif2 suivant
        lc(); avf(-2); pqtd(); av(); bc()
        motif2()
        # Motif1 suivant
        lc(); avf(-1); pqtd(); avf(2); pqtg(); bc()
    # Ligne paire suivante
    lc(); pdt(); avf(2); bc()
    for i in range(nombreDeColonnes):
        motif1()
        # Motif1 suivant
        lc(); pdt(); avf(4); pqtg(); bc()
    # Ligne impaire suivante
    lc(); avf(2); pdt(); bc()
st()
