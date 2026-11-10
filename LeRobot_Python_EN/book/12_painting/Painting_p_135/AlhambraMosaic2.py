from LibRobot import *

# Alhambra mosaic
gridSize = 4
rowLength = 7
numberOfRows = 8  # even

def pattern():
    gs(gridSize); fd(); qtr(); fd()
    gsX(2 * gridSize)
    gsY(3 * gridSize); qtl(); cr()
    pu(); fdn(-1); pd(); cr()
    gs(gridSize); qtl(); fd(); qtr()
    fd(); ht()

def nextPattern():
    pu(); gs(gridSize); qtr(); fdn(2)
    qtl(); pd()

def row():
    for i in range(rowLength):
        pattern(); nextPattern()

def backToOddRowStart():
    pu(); qtl()
    fdn(4 * rowLength + 2 * (rowLength - 1)); qtr()
    pd()

def backToEvenRowStart():
    pu(); qtl()
    fdn(4 * rowLength + 2 * rowLength + 3); qtr()
    pd()

def tiling():
    for i in range(numberOfRows // 2):
        row()
        fd(); qtr(); fd(); pu(); fdn(-3); qtl()
        fdn(-1); pd(); backToOddRowStart()
        pu(); fdn(-3); pd(); qtr(); fd(); qtr()
        fd(); qtl(); pu(); fdn(2); qtl(); pd()
        row(); backToEvenRowStart()
        pu(); fdn(-4); pd()

def frame():
    pu(); fdn(4); pd()
    fdn(4 * numberOfRows); qtr()
    fdn(4 * rowLength + 2 * (rowLength - 1) + 3)
    qtr()
    fdn(4 * numberOfRows); qtr()
    fdn(4 * rowLength + 2 * (rowLength - 1) + 3)
    qtr()

def colouring():
    pu(); fdn(2); qtr(); fd()
    for i in range(numberOfRows // 2 - 1):
        for j in range(rowLength):
            paint(); fdn(6)
        paint()
        qtl(); fdn(8); qtl(); fdn(6 * rowLength); ht()
    for j in range(rowLength):
        paint(); fdn(6)
    paint()

pu(); gs(gridSize); gl(); gt()
fdn(-4); pd()
tiling(); frame(); colouring()
st()
