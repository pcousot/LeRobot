from LibRobot import *

# Draw a notched double square
def nineSteps():
    fd(); fd(); fd(); fd(); fd(); fd(); fd(); fd()
    fd()

# Go without drawing to the bottom left of the drawing
def toBottomLeft():
    pu(); ht(); nineSteps(); qtr()
    nineSteps(); fd(); qtr(); pd()

def notch():
    qtl(); fd(); qtr(); fd(); qtr(); fd(); qtl()

def longBar():
    fd(); fd(); fd(); notch(); fd(); fd(); fd()

def shortBar():
    fd(); fd(); notch(); fd(); fd()

def goDown():
    qtr(); fd(); fd(); qtl()

def goUp():
    qtl(); fd(); fd(); qtr()

def outerSide():
    longBar(); goDown(); shortBar()
    goUp(); longBar()

def innerSide():
    shortBar(); goUp(); longBar()
    goDown(); shortBar()

toBottomLeft()
outerSide(); qtr(); outerSide(); qtr()
outerSide(); qtr(); outerSide(); qtr()
pu(); fd(); qtr(); fd(); pd()
innerSide(); qtl(); innerSide(); qtl()
innerSide(); qtl(); innerSide(); qtl()
st()
