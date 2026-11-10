from LibRobot import *

# Draw a Maltese cross
armLength = 50

gsRT(armLength, 30)
etr()
for i in range(2):
    fd(); tetr(); fdn(2); tetr(); fdn(2); tetl()
    fdn(2); tetl(); fd()
    gsRT(armLength, 60); qtl()
st()
