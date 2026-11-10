from LibRobot import *

# Courbe de Sierpinski d'ordre 5
tailleGrille = 1
ordre = 5

def a(k):
    if k > 0:
        a(k - 1); pivoter(sudEst); av()
        b(k - 1); pivoter(est); avf(2)
        d(k - 1); pivoter(nordEst); av()
        a(k - 1)

def b(k):
    if k > 0:
        b(k - 1); pivoter(sudOuest); av()
        c(k - 1); pivoter(sud); avf(2)
        a(k - 1); pivoter(sudEst); av()
        b(k - 1)

def c(k):
    if k > 0:
        c(k - 1); pivoter(nordOuest); av()
        d(k - 1); pivoter(ouest); avf(2)
        b(k - 1); pivoter(sudOuest); av()
        c(k - 1)

def d(k):
    if k > 0:
        d(k - 1); pivoter(nordEst); av()
        a(k - 1); pivoter(nord); avf(2)
        c(k - 1); pivoter(nordOuest); av()
        d(k - 1)

def courbeSierpinski(i):
    a(i); pivoter(sudEst); av()
    b(i); pivoter(sudOuest); av()
    c(i); pivoter(nordOuest); av()
    d(i); pivoter(nordEst); av()

eh(); ag(); lg(tailleGrille); pe(); lc(); av()
bc(); pn()
courbeSierpinski(ordre); st()
