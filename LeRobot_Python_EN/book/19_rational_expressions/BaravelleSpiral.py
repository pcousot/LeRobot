from LibRobot import *

# Baravelle spiral
n = 7
twoToTheN = 128

def spiral():
    for i in range(n):
        fd(); tetr(); fd(); tetr(); fd(); qtr()
        fd(); etr()
        gs(valGsX() / 2)
        fd(); tetr(); fd(); fd(); tetr(); fd()
        qtr(); fd(); etr()

def square():
    fdn(2); qtr(); fdn(2); qtr(); fdn(2); qtr(); fdn(2)
    qtr()

# Place the robot at the bottom left corner of the
# frame, on a grid of side twoToTheN
def corner():
    gs(1); gb(); gl(); gs(twoToTheN)

corner(); square(); spiral()
corner(); fn(); fdn(2); qtr(); fdn(2); qtr()
spiral()
corner(); fn(); fdn(2); etl(); paint()
corner(); fe(); fdn(2); etr(); paint()
st()
