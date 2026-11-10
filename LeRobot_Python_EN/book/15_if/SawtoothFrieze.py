from LibRobot import *

# Draw a sawtooth frieze
numberOfTeeth = 31

gl(); etr()
for i in range(2 * numberOfTeeth):
    fd()
    if tne():
        tetr()
    else:
        tetl()
st()
