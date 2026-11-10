from LibRobot import *

# Draw an arabesque
def halfPattern():
    # Quarter of the pattern
    etl(); fdn(2); etr(); fdn(2); etl(); fd()
    # Central half square
    tetr(); pu(); fdn(2); qtr(); pd(); fd(); qtl()
    fd(); pu(); qtl(); fdn(2); qtl()
    pd(); fd(); qtl(); fd(); qtr(); pu(); fdn(2)
    tetr(); pd()
    # Quarter of the pattern
    fd(); etl(); fdn(2); etr(); fdn(2); etl()

def pattern():
    halfPattern()
    cl(); ht(); cl(); halfPattern()

def centralOval():
    gc(); pu(); fn(); fd(); fd(); pd(); qtr()
    cr(); fdn(2); cr(); cr(); fdn(2); cr()

def centralPatternQuarter():
    cr(); fd(); qtl(); cr(); qtl(); cr(); qtl()
    fd(); cr()

pw(2)
# Outer pattern
for j in range(4):
    pu(); gc(); qtl(); fdn(11); qtr(); fdn(6)
    qtr(); pd()
    pattern(); ht(); pattern()
# Central pattern
for j in range(4):
    pu(); gc(); qtr(); fdn(5); qtr(); pd()
    centralPatternQuarter()
centralOval()
gc(); qtl(); st()
