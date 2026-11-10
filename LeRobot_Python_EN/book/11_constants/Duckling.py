from LibRobot import *

# Draw a duckling hatching from its egg
g = 6  # Grid size

def head():
    # Top left of the skull
    gsX(3 * g); gsY(6 * g)
    cr()
    # Down feathers
    qtl(); gsX(2 * g)
    gsY(4 * g); cl(); ht(); pu()
    fd(); qtr(); fd(); pd(); ht(); cr()
    pu(); ht(); fd(); qtl(); fd(); pd()
    gsX(g)
    gsY(6 * g); ht(); cr()
    # Top right of the skull
    pu(); ht(); fd(); qtl(); fd(); pd(); qtl()
    gsX(3 * g)
    gsY(6 * g); cr(); gs(g)
    # Outline of the eyes
    pu(); etr(); fd(); tetr(); pd()
    gsY(3 * g); cl(); cl()
    gs(g); fd(); ht(); fd()
    gsY(3 * g); cl(); cl(); tetl()
    # Right eye
    gsY(g); pu(); fd(); pd(); pw(2); dp()
    # Left eye
    pu(); etr(); fdn(2); pd(); dp(); pw(1)
    # Get into position to draw the cheeks
    pu(); etr(); fd(); qtl(); pd()

def cheeks():
    gs(5 * g); cr()
    gs(3 * g); cr()
    gs(5 * g); cr()
    gsX(4 * g); gsY(g)
    cl(); gs(5 * g); cr()
    gs(3 * g); cr()
    gs(5 * g); cr()
    gsX(2 * g)
    gsY(g); etr(); cl(); cl()
    gs(g)
    # Get into position to draw the mouth
    pu(); tetr(); fd(); pd()

def mouth():
    # Right corner of the lips
    cr(); cl(); ht(); cr(); qtl()
    # Lips
    gs(2 * g); cl(); gsY(g)
    cr(); gs(2 * g); cl()
    # Left corner of the lips
    qtr(); gs(g); cr(); ht(); cl()
    cr()
    # Get into position to draw the neck
    pu(); tetl(); fdn(2); qtr(); pd()

def neck():
    # Left side
    gsY(8 * g); fd(); ht(); fd()
    # Right side
    pu(); qtr(); gsX(2 * g); fd()
    pd(); qtr(); fd(); gs(g)

def fullShell():
    # Upper right edge
    etl(); fd(); qtl(); gsY(2 * g)
    for i in range(3):
        fd(); qtr(); fd(); qtl()
    tetr()
    # Bottom
    gsX(8 * g); gsY(14 * g)
    cr(); cr()
    # Upper left edge
    etr(); gsX(g)
    gsY(2 * g)
    for i in range(3):
        fd(); qtr(); fd(); qtl()
    # Middle
    gs(2 * g); fd(); qtr(); fd()
    gs(g)
    # Get into position to draw the empty shell
    pu(); etl(); fdn(10); qtr(); fdn(3); etl(); pd()

def emptyShell():
    # Upper left edge
    gsX(g); gsY(2 * g)
    for i in range(3):
        fd(); qtl(); fd(); qtr()
    # Middle
    gs(2 * g); fd(); qtl(); fd()
    # Upper right edge
    qtr(); gsX(g)
    gsY(2 * g)
    for i in range(3):
        fd(); qtl(); fd(); qtr()
    etr()
    # Bottom
    gsX(8 * g); gsY(11 * g)
    cr(); cr(); gs(g)

gs(g); pu(); fdn(10); pd()
head(); cheeks(); mouth(); neck(); fullShell()
emptyShell(); st()
