from LibRobot import *

# Draw a frieze shaped like a fence

# Draw the n-shaped pattern of the fence
def n():
    fd(); fd(); qtr(); fd(); fd(); qtr(); fd()
    fd(); ht()

# Draw a fence
def fence():
    for i in range(20):
        n()

gl(); fence(); st()
