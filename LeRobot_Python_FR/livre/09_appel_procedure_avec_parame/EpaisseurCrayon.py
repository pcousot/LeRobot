from LibRobot import *

# Effet de av () avec des crayons de plus en plus
# épais
lc(); avf(5); pqtd(); lgX(6); avf(-1); lgX(12)
for i in range(1, 5):
    lc(); pqtd(); avf(i); pqtg(); bc()
    ec(12 * i); av(); lc(); avf(-1)
dg(); st()
