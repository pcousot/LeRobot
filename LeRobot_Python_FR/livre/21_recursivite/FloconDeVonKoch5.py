from LibRobot import *

# Flocon de Von Koch
def segment(n):
    if n == 0:
        av()
    else:
        segment(n - 1)
        pqtg()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        pqtd()
        segment(n - 1)
        pqtg()
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
    lc(); avf(4); pqtd(); bc()

rejoindreDepart()
lg(2)
carre(3)
st()
