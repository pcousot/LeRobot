from LibRobot import *

# Draw a frieze of crossed notches
def rightPattern():
    fd(); fd(); qtr(); fd(); qtl(); fd(); ht()
    fd()
    fd(); ht(); fd(); qtr(); fd(); qtr(); fd()
    fd()

def leftPattern():
    fd(); fd(); qtl(); fd(); qtl(); fd(); ht()
    fd()
    fd(); ht(); fd(); qtr(); fd(); qtl(); fd()
    fd()

def frieze():
    for i in range(10):
        rightPattern(); leftPattern()

gl(); frieze(); st()
