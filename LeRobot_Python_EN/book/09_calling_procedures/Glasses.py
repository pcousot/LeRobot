from LibRobot import *

# Draw a pair of glasses
def lens():
    cr(); fdn(5); cr(); fdn(2); cr(); fdn(5); cr(); fdn(2)
    cr(); fdn(5); cr(); ht()

def bridge():
    cr(); cr(); ht()

def arm():
    etr(); fdn(7); etr(); cr(); fdn(3); cr(); ht()
    cl(); fdn(3); cl(); etl(); fdn(7); tetr()

gs(6); arm(); lens(); bridge(); lens()
arm(); st()
