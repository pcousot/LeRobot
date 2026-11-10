from LibRobot import *

# Dessiner une loupe

# Monter au point de départ, en bas à gauche du verre
# de la loupe
def rejoindreDepart():
    lc(); av(); av(); av(); bc()

def cinqPas():
    av(); av(); av(); av(); av()

def septPas():
    cinqPas(); av(); av()

# Dessiner le bord intérieur du verre de la loupe
def bordInterieurDuVerre():
    cinqPas(); vd(); cinqPas(); vd()
    cinqPas(); vd(); cinqPas(); vd()

# Rejoindre le bord extérieur du support du verre
def rejoindreBordExterieur():
    pqtg(); lc(); av(); pqtg(); av(); pdt(); bc()

# Dessiner le bord extérieur du support du verre
def bordExterieurDuVerre():
    septPas(); vd(); septPas(); vd()
    septPas(); vd(); septPas(); vd()

# Rejoindre le haut du manche, à gauche
def rejoindreHautDuManche():
    pdt(); vg(); av(); av(); pqtd()

# Dessiner la première cannelure du manche
def premiereCannelure():
    vg(); av(); vg()
    lc(); pqtg(); av(); av(); av(); pqtg(); bc()

# Dessiner une cannelure suivante du manche
def cannelureSuivante():
    av(); vg(); av(); vg(); av()
    lc(); pqtg(); av(); av(); av(); pqtg(); av()
    bc()

# Dessiner le manche cannelé de la loupe
def manche():
    premiereCannelure()
    cannelureSuivante(); cannelureSuivante()
    cannelureSuivante(); cannelureSuivante()
    cannelureSuivante(); cannelureSuivante()
    cannelureSuivante(); cannelureSuivante()
    cannelureSuivante(); cannelureSuivante()

rejoindreDepart()
bordInterieurDuVerre()
rejoindreBordExterieur()
bordExterieurDuVerre()
rejoindreHautDuManche()
manche()
st()
