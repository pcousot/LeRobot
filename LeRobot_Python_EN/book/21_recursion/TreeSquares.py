from LibRobot import *

# Tree squares
def tree(l):
    if l >= 1:
        tetl(); fdn(l); tetr(); tree(l // 2); etr()
        fdn(l); etl()
        tetr(); fdn(l); tetl(); tree(l // 2); etl()
        fdn(l); etr()

def squares(l):
    if l >= 1:
        for i in range(4):
            tree(l); qtr()
        squares(l // 2)

gs(1.2); squares(32); st()
