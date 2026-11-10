from LibRobot import *

# Flocon de Von Koch
def segment(n):
    if n == 0:
        av()
    else:
        segment(n - 1)
        phtg()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        phtg()
        segment(n - 1)

def carre(n):
    segment(n)
    pqtd()
    segment(n)
    pqtd()
    segment(n)
    pqtd()
    segment(n)

def rejoindreDepart():
    lc(); phtd(); avf(6); p3htd(); bc()

rejoindreDepart()
lg(3)
carre(3)
st()
