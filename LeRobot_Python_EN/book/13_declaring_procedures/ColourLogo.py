from LibRobot import *

# Draw a logo in colour
def smallInnerPattern(c):
    pc(c); pw(1)
    fd(); etr(); fdn(2); etl(); cl(); cr(); ht()
    cr(); cl(); etl(); fdn(2); etr(); fd()

def bigInnerPattern(c):
    pc(c); pw(3)
    pu(); fd(); pd(); fdn(3); cr(); cl(); etl()
    fdn(2); qtl(); fdn(2); etl(); cl(); cr(); fdn(3)
    pu(); fd(); pd()

def innerFrame():
    pc(yellow); pw(3)
    pu(); etl(); fdn(6); tetr(); pd()
    for i in range(4):
        fdn(3); pu(); fdn(6); pd(); fdn(3); qtr()

def middleFrame():
    pc(indigo); pw(5)
    pu(); tetl(); fd(); tetr(); pd()
    for i in range(4):
        fdn(4); etl(); fdn(3); qtr(); fdn(3); etl()
        fdn(4); qtr()

def outerFrame():
    pc(red); pw(7)
    pu(); tetl(); fdn(2); tetr(); pd()
    for i in range(4):
        fdn(6); pu(); fdn(6); pd(); fdn(6); qtr()

gs(8); gc()
bigInnerPattern(green); etr()
smallInnerPattern(black); etr()
bigInnerPattern(black); etr()
smallInnerPattern(violet); etr()
bigInnerPattern(violet); etr()
smallInnerPattern(blue); etr()
bigInnerPattern(blue); etr()
smallInnerPattern(green); etr()
innerFrame(); middleFrame()
outerFrame()
gc(); qtl(); st()
