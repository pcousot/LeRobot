from LibRobot import *

# Draw a frieze of half-octagons
numberOfHalfOctagons = 10

gl()
for i in range(4 * numberOfHalfOctagons):
    fd(); etr()
    if ts():
        fd(); ht()
st()
