from LibRobot import *

# Draw the pattern of N. J. van de Vecht, then the
# same pattern painted

# Pattern of N. J. van de Vecht
def pattern():
    qtr(); fdn(4); qtr(); fdn(3); qtr(); fd(); qtr()
    fdn(3); ht(); fdn(3)
    fd(); qtr(); fd(); qtl(); fd(); qtl(); fd()
    qtr(); fd(); qtr(); fdn(3)
    qtr(); fd(); qtr(); fd(); qtl(); fd(); qtl()
    fd(); qtr(); fd(); qtr(); fdn(3)
    ht(); fdn(3); qtr(); fdn(3); pu(); ht(); fdn(6)
    ht(); pd()

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

pattern()
pu(); qtr(); fdn(8); qtl(); fdn(6); pd()
paintedPattern(); st()
