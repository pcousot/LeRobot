from LibRobot import *

# Draw a frieze of braces
def brace():
    cr(); cl(); qtr(); qtr(); cl(); cr(); qtr()
    qtr()

gl()
for i in range(10):
    brace()
st()
