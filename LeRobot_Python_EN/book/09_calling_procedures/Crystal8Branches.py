from LibRobot import *

# Draw a crystal with eight branches
def branch():
    etl(); fdn(5); qtr(); etl(); fd(); qtr(); fd()
    etr(); fdn(5); qtl()

def crystal():
    for j in range(8):
        branch()

gs(4); crystal(); st()
