from LibRobot import *

# Pattern by R. S. Beard
initialGrid = 3  # at least 3
nbRings = 4

def straightBlackSquare():
    fd(); qtr(); fd(); qtr(); fd(); qtr(); fd()
    etl(); paint(); ht(); fd()

def obliqueBlackSquare():
    fd(); qtr(); fd(); qtr(); fd(); qtr(); fd()
    pu(); tetr(); fd(); paint(); fd(); pd()

def ring():
    for i in range(4):
        straightBlackSquare()
        gs(valGsX() / sqrt(2))
        obliqueBlackSquare()
        gs(valGsX() * sqrt(2))

def pattern():
    for i in range(nbRings - 1):
        ring()
        # Place the robot at the bottom left corner of the
        # top left square of the next ring
        pu(); fd(); qtl()
        gs(valGsX() * tan(3 * pi / 8))
        fd(); qtr(); pd()
    ring()

gs(initialGrid); pattern(); st()
