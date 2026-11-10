from LibRobot import *

# Dessiner un double carré cranté
def neufPas():
    av(); av(); av(); av(); av(); av(); av(); av()
    av()

# Aller sans dessiner en bas à gauche du dessin
def enBasAGauche():
    lc(); pdt(); neufPas(); pqtd()
    neufPas(); av(); pqtd(); bc()

def cran():
    pqtg(); av(); pqtd(); av(); pqtd(); av(); pqtg()

def grandeBarre():
    av(); av(); av(); cran(); av(); av(); av()

def petiteBarre():
    av(); av(); cran(); av(); av()

def descendre():
    pqtd(); av(); av(); pqtg()

def monter():
    pqtg(); av(); av(); pqtd()

def coteExterieur():
    grandeBarre(); descendre(); petiteBarre()
    monter(); grandeBarre()

def coteInterieur():
    petiteBarre(); monter(); grandeBarre()
    descendre(); petiteBarre()

enBasAGauche()
coteExterieur(); pqtd(); coteExterieur(); pqtd()
coteExterieur(); pqtd(); coteExterieur(); pqtd()
lc(); av(); pqtd(); av(); bc()
coteInterieur(); pqtg(); coteInterieur(); pqtg()
coteInterieur(); pqtg(); coteInterieur(); pqtg()
st()
