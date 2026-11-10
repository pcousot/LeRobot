from LibRobot import *

# Draw a rosette of an octagon and squares
for i in range(8):
    fd(); fd(); etl()
    for j in range(4):
        fd(); qtr()
    tetl(); fd(); tetl()
st()
