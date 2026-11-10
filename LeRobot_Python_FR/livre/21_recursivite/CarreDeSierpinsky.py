from LibRobot import *

# Carré de Sierpinski
def segment(n):
    if n == 0:
        av()
    else:
        segment(n - 1)
        segment(n - 1)
        pqtd()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        pqtd()
        lc(); segment(n - 1); bc()
        segment(n - 1)

def carre(n):
    for i in range(4):
        segment(n); pqtd()

ag(); eb(); lg(2); carre(4); st()
