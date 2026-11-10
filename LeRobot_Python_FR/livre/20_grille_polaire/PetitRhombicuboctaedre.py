from LibRobot import *

# Dessiner le développement d'un petit
# rhombicuboctaèdre
c = 20

def triangleEquilateral():
    lgRT(c, 60); phtg(); av(); pqtg(); av(); p3htg()
    avf(2); pqtg()

def carre():
    lg(c)
    for i in range(4):
        av(); pqtd()

def carresEmpiles():
    carre(); pqtd(); av(); pqtd(); carre(); av()
    carre()

def carreEtTrianglesEmpiles():
    triangleEquilateral(); pdt(); carre(); lc()
    phtd(); av(); phtg(); bc()
    triangleEquilateral()

ag(); lc(); avf(2); bc()
for i in range(4):
    carresEmpiles(); carreEtTrianglesEmpiles()
lc(); lg(c); av(); pqtg()
for i in range(3):
    lgRT(c, 60); avf(2); lg(c); av()
pqtd(); bc(); carre(); pdt(); avf(3); pqtg(); av()
pqtd(); carre()
st()
