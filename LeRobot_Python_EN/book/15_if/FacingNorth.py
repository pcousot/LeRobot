from LibRobot import *

# Define the robot's command fn with tests and
# try it in the eight directions

# Turn the robot on the spot to face north
def fn():
    if tne():
        etl()
    elif te():
        qtl()
    elif tse():
        tetl()
    elif ts():
        ht()
    elif tsw():
        tetr()
    elif tw():
        qtr()
    elif tnw():
        etr()

for i in range(1, 9):
    gc(); fn()
    for j in range(i):
        etr()
    fd()
st()
