from LibRobot import *

# Draw a square with procedures

# Draw one side of the square and turn right
def side():
    for j in range(4):
        fd()
    qtr()

# Draw a square
def square():
    for i in range(4):
        side()

square(); st()
