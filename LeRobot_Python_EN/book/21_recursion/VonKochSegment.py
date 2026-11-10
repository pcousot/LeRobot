from LibRobot import *

# Draw a Von Koch curve
def segment(n):
    if n == 0:
        fd()
    else:
        segment(n - 1)
        etl()
        segment(n - 1)
        qtr()
        segment(n - 1)
        etl()
        segment(n - 1)

gs(6); gl(); fe(); segment(3); st()
