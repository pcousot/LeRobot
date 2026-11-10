from LibRobot import *

# Tiling of cubes by A. H. Christie, 'Pattern design.
# An introduction to the study of formal ornament',
# Clarendon press, Oxford, 1929; reprinted by Dover,
# New York, 1969.
sideLength = 13
angle = 30
nbRows = 7
nbColumns = 7

def cube():
    fne(); fd(); qtr(); fd(); qtr(); fd(); qtr()
    fd()
    fs(); fdn(2); etl(); fd(); tetl(); fdn(2)
    etr(); paint(); qtr(); pc(violet); paint()
    pc(black); etr()
    fdn(2); tetl(); fd(); etl(); fdn(2)

def tiling():
    gsRT(sideLength, angle)
    gt()
    for i in range(1, nbRows + 1):
        gl(); pu()
        if i % 2 == 1:
            fs(); fdn(2); fse(); fd()
        else:
            fse(); fd(); fs(); fd(); fsw(); fd()
        pd()
        for j in range(nbColumns):
            cube()

tiling(); st()
