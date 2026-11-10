from LibRobot import *

# Draw and paint a ball in colour
edgeThickness = 3
halfRadius = 30

def quarterOfFigure():
    gs(halfRadius); cl(); cl()
    gs(2 * halfRadius); cl(); gc(); ht()

# Place the robot in the area to paint and paint
def paintQuarterOfFigure():
    gs(halfRadius // 2)
    pu(); gc(); qtr(); fd(); pd(); paint()

pw(edgeThickness)
for i in range(4):
    quarterOfFigure()
for i in range(2):
    pc(blue); paintQuarterOfFigure()
    pc(violet); paintQuarterOfFigure()
st()
