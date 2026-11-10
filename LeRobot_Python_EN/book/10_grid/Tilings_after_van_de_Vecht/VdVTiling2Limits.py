from LibRobot import *

# Rectangular tiling with two limits, inspired by a
# pattern of N. J. van de Vecht

# Pattern of N. J. van de Vecht, the robot starting
# at the top left and arriving at the bottom left
# facing north.
def pattern():
    qtr(); fdn(4); qtr(); fdn(3); qtr(); fd(); qtr()
    fdn(3); ht(); fdn(3)
    fd(); qtr(); fd(); qtl(); fd(); qtl(); fd()
    qtr(); fd(); qtr(); fdn(3)
    qtr(); fd(); qtr(); fd(); qtl(); fd(); qtl()
    fd(); qtr(); fd(); qtr(); fdn(3)
    ht(); fdn(3); qtr(); fdn(3); pu(); ht(); fdn(6)
    ht(); pd()

def column():
    gsY(1); gt(); gsY(11)
    for i in range(4):
        pattern()
    qtr(); fdn(4); qtl()

gsX(1); gl(); gsX(0)
for i in range(1, 8):
    column(); gsX(2 * i)
for i in range(1, 8):
    column(); gsX(14 - 2 * i)
column(); st()
