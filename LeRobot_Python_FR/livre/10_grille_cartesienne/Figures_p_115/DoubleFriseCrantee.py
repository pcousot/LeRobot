from LibRobot import *

# Dessiner une double frise crantée
def cran():
    pqtg(); av(); pqtd(); av(); pqtd(); av(); pqtg()

def grandeBarre():
    avf(3); cran(); avf(3)

def petiteBarre():
    avf(2); cran(); avf(2)

def descente():
    pqtd(); avf(2); pqtg()

def montee():
    pqtg(); avf(2); pqtd()

def frise():
    for j in range(13):
        grandeBarre(); descente(); petiteBarre(); montee()

lg(3)
# Frise supérieure (de gauche à droite
ag(); pqtd(); frise()
# Frise inférieure (de droite à gauche
lc(); av(); ps(); avf(3); pqtd()
bc(); frise(); st()
