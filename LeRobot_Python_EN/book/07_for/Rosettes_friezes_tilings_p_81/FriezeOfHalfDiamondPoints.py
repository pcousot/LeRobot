from LibRobot import *

# Draw a frieze of half diamond points
def leftPattern():
    fd(); fd(); fd(); tetr(); fd(); etr(); fd()
    fd(); qtr(); fd(); ht(); fd(); qtl()

def rightPattern():
    fd(); fd(); etr(); fd(); tetr(); fd(); fd()
    fd(); qtr(); fd(); ht(); fd(); qtl()

def horizontalLine():
    for i in range(2):
        for j in range(40):
            fd()
        ht()

gl()
for j in range(20):
    leftPattern(); rightPattern()
pu(); ht(); fd(); qtr(); pd()
horizontalLine()
pu(); qtr(); fd(); fd(); fd(); fd(); qtl()
pd(); horizontalLine()
pu(); qtr(); fd(); qtl(); pd()
horizontalLine(); st()
