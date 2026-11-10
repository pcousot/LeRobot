from LibRobot import *

# Draw a rosette of squares
l = 30  # Length of a segment

def square():
    fdl(l); rot(90); fd(); rot(90); fd(); rot(90); fd()
    rot(90); fd()

def rosette():
    for i in range(6):
        rot(30); fdl(l); rot(30); square()

rosette(); st()
