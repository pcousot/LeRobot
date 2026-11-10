from LibRobot import *

# Dessiner le développement d'un grand
# rhombicuboctaèdre
c = 12

def carre():
    lg(c)
    for i in range(4):
        av(); pqtd()

def hexagone():
    pqtd()
    for i in range(2):
        lg(c); av(); lgRT(c, 60); phtg(); av(); pqtg()
        av()
        phtg()
    pqtg()

def octogone():
    pqtd()
    for i in range(4):
        lg(c); av(); lgRT(c, 45); phtg(); av(); phtg()
    pqtg()

# Dessiner un carré avec un hexagone au dessus et au
# dessous
def carreEtHexagonesEmpiles():
    hexagone(); pqtd(); lg(c); av(); pqtd(); carre()
    av(); hexagone()

# Dessiner un octogone avec un carré au dessus et au
# dessous
def octogoneEtCarresEmpiles():
    carre(); pqtd(); av(); pqtd(); octogone(); lc()
    av(); lg(c); av()
    lgRT(c, 45)
    av(); bc(); carre()

ag(); lc(); avf(2); pqtd(); avf(2); pqtg(); bc()
for i in range(4):
    octogoneEtCarresEmpiles(); lc(); p3htg()
    lgRT(c, 45); av(); phtg()
    lg(c)
    av(); bc(); carreEtHexagonesEmpiles(); lc()
    pdt(); lg(c); av()
    lgRT(c, 45)
    phtd(); av(); phtg(); bc()
lc(); lg(c); av(); pqtg()
for i in range(6):
    lgRT(c, 45); av(); lg(c); av()
pqtd(); bc(); octogone(); lc(); pdt(); avf(2); lg(c)
avf(3); pqtg()
av(); pqtd()
bc(); octogone()
st()
