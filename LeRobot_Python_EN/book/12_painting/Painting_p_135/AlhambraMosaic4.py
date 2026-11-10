from LibRobot import *

# Alhambra mosaic in colour
numberOfRows = 3
numberOfColumns = 7

def pattern1():
    etr(); fd(); tetr(); fdn(2); tetl(); fd()
    tetl(); fd()
    # Paint
    etr(); pc(indigo); paint(); pc(black); etl()
    fd(); fdn(-1); tetl()
    pc(yellow); paint(); pc(black); tetr()
    # Go on
    fd()

def pattern2():
    for i in range(2):
        fd(); tetr(); fd(); etl(); fd(); qtr()
        fd(); etl(); fd(); tetr(); fd(); qtl()
    pc(violet); paint(); pc(black)

gt(); gl(); pu(); fdn(-2); pd()
for j in range(numberOfRows):
    for i in range(numberOfColumns):
        pattern1()
        # Next pattern2
        pu(); fdn(-2); qtr(); fd(); pd()
        pattern2()
        # Next pattern1
        pu(); fdn(-1); qtr(); fdn(2); qtl(); pd()
    # Next even row
    pu(); ht(); fdn(2); pd()
    for i in range(numberOfColumns):
        pattern1()
        # Next pattern1
        pu(); ht(); fdn(4); qtl(); pd()
    # Next odd row
    pu(); fdn(2); ht(); pd()
st()
