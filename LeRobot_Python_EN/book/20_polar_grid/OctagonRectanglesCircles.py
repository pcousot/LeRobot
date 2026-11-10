from LibRobot import *

# Draw a decorated octagon
r = 24

def octagon():
    qtr(); gsRT(2 * r, 45)
    for i in range(8):
        fd(); rot(45)

def inscribed_Rectangle():
    for i in range(2):
        gs(r); fd(); gsRT(2 * r, 45); fd(); gs(r)
        fd(); qtr(); gsRT(2 * r, 45)
        fd(); qtr()

def three_quarters_of_circle():
    etl(); gs(r); fd(); etr()
    for i in range(4):
        pw(2); cr(); cr(); cr(); pw(1); ht()
        gsRT(2 * r, 45); fd(); ht()
        gs(r)

octagon(); qtl(); inscribed_Rectangle()
gs(r); etl(); fd(); gsRT(2 * r, 45); etr()
fd()
qtr()
inscribed_Rectangle(); three_quarters_of_circle()
st()
