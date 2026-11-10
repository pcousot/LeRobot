from LibRobot import *

# Draw a six-pointed star
gridSize = 20

def star():
    etr()
    for i in range(6):
        fd(); rot(60); fd(); rot(240)

gs(gridSize); star(); st()
