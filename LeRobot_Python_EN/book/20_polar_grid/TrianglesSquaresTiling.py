from LibRobot import *

# Tiling of triangles and squares
sideLength = 15
nbRows = 6
nbColumns = 4

def trianglesNS():
    gsRT(sideLength, 60)
    fn(); etr(); fd(); qtr(); fd(); tetr(); fdn(2)
    tetl(); fd(); qtl(); fd()

def trianglesWE():
    gsRT(sideLength, 30)
    fne(); fd(); qtr(); fd(); qtr(); fd(); qtr()
    fd(); qtr(); fd(); tetr()
    fdn(2); tetl(); fd()

def tiling():
    gc(); gs(12); gt()
    for i in range(1, nbRows + 1):
        gsRT(sideLength, 60); pu(); gl()
        if i % 2 == 1:
            gsRT(sideLength, 30); fs(); fd()
            gsRT(sideLength, 60); fd()
        else:
            gsRT(sideLength, 30); fe(); fd(); fs()
            fd()
            gsRT(sideLength, 60); fsw(); fd()
        pd()
        for j in range(nbColumns):
            if i % 2 == 1:
                trianglesWE(); trianglesNS()
            else:
                trianglesNS(); trianglesWE()

def colouring():
    gc(); gs(12); gt(); pu()
    for i in range(1, nbRows):
        gsRT(sideLength, 60); pu(); gl()
        if i % 2 == 1:
            gsRT(sideLength, 30); fs(); fd()
            gsRT(sideLength, 60); fd()
        else:
            gsRT(sideLength, 30); fe(); fd(); fs()
            fd()
            gsRT(sideLength, 60); fsw(); fd()
        for j in range(1, nbColumns + 1):
            if i % 2 == 1:
                gsRT(sideLength, 30); fe(); fdn(2); fn()
                pc(yellow); paint()
                if j != nbColumns:
                    gsRT(sideLength, 60); fe(); fdn(2); fn()
                    pc(black); paint()
            else:
                gsRT(sideLength, 60); fe(); fdn(2); fn()
                pc(black); paint()
                if j != nbColumns:
                    gsRT(sideLength, 30); fe(); fdn(2); fn()
                    pc(yellow); paint()

tiling(); colouring(); st()
