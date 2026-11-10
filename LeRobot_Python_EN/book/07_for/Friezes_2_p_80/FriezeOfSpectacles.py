from LibRobot import *

# Draw a frieze of spectacles
def spectacles():
    fd(); fd(); qtr(); fd(); qtr(); fd(); qtr()
    fd(); fd()
    qtr(); fd(); fd(); fd(); qtr()
    fd(); fd(); qtr(); fd(); qtr(); fd(); qtr()
    fd(); fd()

def frieze():
    qtr()
    for l in range(8):
        spectacles()

gl(); frieze(); st()
