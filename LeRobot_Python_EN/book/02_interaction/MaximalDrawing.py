# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Paths of the Robot, page 15.                        *
# *                                                     *
# *******************************************************
from LibRobot import *

def atTop():
    gs(1); gt(); gs(51)

def atLeft():
    gs(1); gl(); gs(51)

def newLine():
    pu(); atLeft(); fs(); fd(); fe(); pd()

def cross():
    for i in range(8):
        etr()
        fd(); ht(); fd(); ht()
        cl(); ht(); cr(); ht()
        cr(); ht(); cl(); ht()

atTop(); atLeft()
for l in range(4):
    newLine()
    for c in range(8):
        fd(); cross()
st()
