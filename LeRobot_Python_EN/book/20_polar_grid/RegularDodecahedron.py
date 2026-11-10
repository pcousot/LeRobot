from LibRobot import *

# Draw the net of a regular dodecahedron
side = 18

def pentagon():
    gsX(side); qtr(); fd(); gsRT(side, 72); etl()
    fd()
    gsRT(side, 36); qtl(); fd()
    qtl(); fd(); gsRT(side, 72); qtl(); fd()

# (* the book starts from the bottom border (gb), but
# the second net goes below the starting point: the
# robot left the window and the program stopped. We
# start 5 steps higher. *)
gb(); pu(); fdn(5); pd()
for i in range(2):
    pentagon()
    pu(); gs(side); etl(); fd(); gsRT(side, 72)
    fdn(2)
    qtl(); pd(); pentagon()
    pu(); ht(); fd(); gsRT(side, 36); qtr()
    fd(); etl(); pd()
    pentagon()
    pu(); ht(); fd(); etl(); gsX(side); fd()
    qtr(); pd()
    pentagon()
    pu(); qtr(); fd(); gsX(side); etr(); fd()
    qtr(); pd()
    pentagon()
    pu(); ht(); fd(); gsX(side); etl(); fd()
    gsRT(side, 36); tetr(); fd()
    gsRT(side, 72); qtl()
    fd(); tetl(); pd()
st()
