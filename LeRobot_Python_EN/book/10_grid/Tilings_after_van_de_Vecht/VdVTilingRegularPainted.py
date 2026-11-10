from LibRobot import *

# Painted regular tiling inspired by a pattern of
# N. J. van de Vecht

# Painted pattern of N. J. van de Vecht, the robot
# starting at the top left and arriving at the
# bottom left facing north.
def paintedPattern():
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
        paintedPattern()
    qtr(); fdn(4); qtl()

gl(); gs(11); gt(); fdn(-24); fdn(24)
for i in range(11):
    column()
fdn(24); st()
