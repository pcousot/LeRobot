from LibRobot import *

# Painted rectangular tiling with one limit,
# inspired by a pattern of N. J. van de Vecht

# Pattern of N. J. van de Vecht, the robot starting
# at the top left and arriving at the bottom left
# facing north.
def pattern():
    qtr(); fdn(4); qtr(); fdn(3); qtr(); fd(); qtr()
    fdn(3); ht(); fdn(3)
    etr(); paint(); etl(); fd(); qtr(); fd()
    qtl(); fd(); qtl(); fd()
    qtr(); fd()
    qtr(); fdn(3); qtr(); fd(); qtr(); fd(); qtl()
    fd(); qtl(); fd(); qtr(); fd()
    qtr(); fdn(3); ht(); fdn(3); etr(); paint()
    etr(); fdn(3); pu(); ht()
    fdn(6); ht(); pd()

def column():
    gt()
    for i in range(4):
        pattern()
    qtr(); fdn(4); qtl()

gl(); gsY(11); gsX(22)
for i in range(1, 10):
    column(); gsX(22 - 2 * i)
st()
