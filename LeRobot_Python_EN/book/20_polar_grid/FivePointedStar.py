from LibRobot import *

# Draw a five-pointed star
gridSize = 60

def star():
    etl()
    for i in range(5):
        fd(); rot(144)

gs(gridSize); star(); st()
