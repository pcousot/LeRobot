from LibRobot import *

# Definition of the commands gl, gr, gb and gt

# Definition of the command gl
def toWestEdge():
    pu(); fw()
    while not tb():
        fd()

def farWest():
    if tn():
        toWestEdge(); fn()
    elif tne():
        toWestEdge(); fne()
    elif te():
        toWestEdge(); fe()
    elif tse():
        toWestEdge(); fse()
    elif ts():
        toWestEdge(); fs()
    elif tsw():
        toWestEdge(); fsw()
    elif tw():
        toWestEdge()
    else:
        toWestEdge(); fnw()

def gl():
    if valPd():
        farWest(); pd()
    else:
        farWest()

# Definition of the command gr
def toEastEdge():
    pu(); fe()
    while not tb():
        fd()

def farEast():
    if tn():
        toEastEdge(); fn()
    elif tne():
        toEastEdge(); fne()
    elif te():
        toEastEdge()
    elif tse():
        toEastEdge(); fse()
    elif ts():
        toEastEdge(); fs()
    elif tsw():
        toEastEdge(); fsw()
    elif tw():
        toEastEdge(); fw()
    else:
        toEastEdge(); fnw()

def gr():
    if valPd():
        farEast(); pd()
    else:
        farEast()

# Definition of the command gb
def toSouthEdge():
    pu(); fs()
    while not tb():
        fd()

def atBottom():
    if tn():
        toSouthEdge(); fn()
    elif tne():
        toSouthEdge(); fne()
    elif te():
        toSouthEdge(); fe()
    elif tse():
        toSouthEdge(); fse()
    elif ts():
        toSouthEdge()
    elif tsw():
        toSouthEdge(); fsw()
    elif tw():
        toSouthEdge(); fw()
    else:
        toSouthEdge(); fnw()

def gb():
    if valPd():
        atBottom(); pd()
    else:
        atBottom()

# Definition of the command gt
def toNorthEdge():
    pu(); fn()
    while not tb():
        fd()

def atTop():
    if tn():
        toNorthEdge()
    elif tne():
        toNorthEdge(); fne()
    elif te():
        toNorthEdge(); fe()
    elif tse():
        toNorthEdge(); fse()
    elif ts():
        toNorthEdge(); fs()
    elif tsw():
        toNorthEdge(); fsw()
    elif tw():
        toNorthEdge(); fw()
    else:
        toNorthEdge(); fnw()

def gt():
    if valPd():
        atTop(); pd()
    else:
        atTop()

# Draw a line of length 3 then go back to the
# initial position
def stroke():
    fd(); fd(); fd()
    ht(); fd(); fd(); fd(); ht()

# Bundle of 5 lines in the middle of the left edge
gl(); stroke(); etr(); stroke(); etr(); stroke()
etr(); stroke(); etr(); stroke(); ht()
# Bundle of 5 lines in the middle of the right edge
gr(); stroke(); etl(); stroke(); etl(); stroke()
etl(); stroke(); etl(); stroke(); ht()
# Bundle of 5 lines in the middle of the top edge
gc(); gt(); qtr(); stroke(); etr(); stroke()
etr(); stroke(); etr(); stroke(); etr()
stroke(); qtr()
# Bundle of 5 lines in the middle of the bottom edge
gb(); qtr(); stroke(); etl(); stroke(); etl()
stroke(); etl(); stroke(); etl(); stroke()
qtr()
# Bundle of 3 lines at the top left corner
gt(); gl(); qtr(); stroke(); etr(); stroke()
etr(); stroke(); ht()
# Bundle of 3 lines at the top right corner
gr(); qtl(); stroke(); etl(); stroke(); etl()
stroke(); ht()
# Bundle of 3 lines at the bottom left corner
gb(); gl(); stroke(); etr(); stroke(); etr()
stroke(); qtl()
# Bundle of 3 lines at the bottom right corner
gr(); stroke(); etl(); stroke(); etl(); stroke()
qtr()
# Bundle of 8 lines at the centre of the frame
gc(); stroke(); etr(); stroke(); etr(); stroke()
etr(); stroke(); etr(); stroke(); etr(); stroke()
etr(); stroke(); etr(); stroke(); etr(); st()
