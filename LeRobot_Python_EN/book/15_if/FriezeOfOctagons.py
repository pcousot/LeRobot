from LibRobot import *

# Draw a frieze of octagons
numberOfOctagons = 15

gl(); qtr()
for i in range(8 * numberOfOctagons):
    if te():
        pu(); fdn(2); pd()
    fd(); etr()
st()
