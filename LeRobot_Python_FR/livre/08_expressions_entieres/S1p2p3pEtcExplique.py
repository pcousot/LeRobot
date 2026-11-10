from LibRobot import *

# Figure du livre : calcul de 1 + 2 + ... + 10 avec
# un rectangle de 10 x 11 dont la moitié est pavée
nmax = 10

def carre():
    av(); pqtd(); av(); pqtd(); av(); pqtd(); av()
    pqtd(); av()

eb(); ag(); lc(); av(); pqtd(); av(); pqtg()
bc()
for i in range(1, nmax + 1):
    for j in range(i):
        carre()
    translater(1, -i)
# Carre extérieur
avf(nmax + 1); pqtg()
avf(nmax); pqtg()
avf(nmax + 1); pqtg()
avf(nmax); pqtg(); lc()
avf(nmax + 1); pqtg()
avf(nmax); pqtg()
p3htd(); cc(jaune); peindre(); st()
