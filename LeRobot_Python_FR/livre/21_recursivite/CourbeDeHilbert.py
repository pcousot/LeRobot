from LibRobot import *

# Courbe de Hilbert d'ordre 6
def segmentG(n):
    if n > 0:
        pqtg()
        segmentD(n - 1)
        av()
        pqtd()
        segmentG(n - 1)
        av()
        segmentG(n - 1)
        pqtd()
        av()
        segmentD(n - 1)
        pqtg()

def segmentD(n):
    if n > 0:
        pqtd()
        segmentG(n - 1)
        av()
        pqtg()
        segmentD(n - 1)
        av()
        segmentD(n - 1)
        pqtg()
        av()
        segmentG(n - 1)
        pqtd()

def rejoindreDepart():
    lc(); phtd(); avf(8); p3htd(); bc()

rejoindreDepart()
lg(3)
segmentD(6)
st()
