from LibRobot import *

# Cross with three transverse arms

# Draw an arm of length i
def arm(i):
    fd(); qtr(); fdn(i); qtl(); fd(); qtl(); fdn(i)
    qtr()

def rightHalfOfCross():
    for i in range(1, 4):
        arm(4 - i)

def leftHalfOfCross():
    for i in range(1, 4):
        arm(i)

rightHalfOfCross()
# Top
fd(); qtl(); fd(); qtl()
leftHalfOfCross()
# Bottom
fdn(2); qtl(); fd(); qtl(); fd()
st()
