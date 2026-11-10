from LibRobot import *

# Draw a spider's web
def hexagon(r):
    gsRT(r, 60)
    gc(); fw()
    for i in range(2):
        pu(); fd(); fd(); pd(); tetr(); fd(); etr()
        fd(); fd(); etr(); fd(); gc()
        fe()

def diagonals(r):
    gsRT(r, 60)
    fsw()
    for i in range(4):
        fd(); gc(); qtr()
    gc(); fw(); fdn(2); gc(); fe(); fdn(2)

def web():
    for i in range(1, 9):
        hexagon(5 * i)
        diagonals(5 * i)

web(); st()
