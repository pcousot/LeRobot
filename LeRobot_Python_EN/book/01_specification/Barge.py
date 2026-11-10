# *******************************************************
# *                                                     *
# * "Premières leçons de programmation en Turbo Pascal" *
# * Patrick, Laurent, Radhia and Thibault COUSOT        *
# * Éditions McGraw-Hill, Paris, 1991.                  *
# * Means of transport, page 10.                        *
# *                                                     *
# *******************************************************
from LibRobot import *

# Draw a barge
gridSquareSize = 11
numberOfPortholes = 8

def door():
    # Draw the door of the cabin starting and ending at the bottom
    # right corner, robot facing west
    qtr(); fdn(6); qtl(); fdn(3); qtl(); fdn(3); pu(); qtl(); fd(); dc()
    ht()
    fd(); qtl()
    pd(); fdn(3); qtl(); fdn(3); ht()

def window():
    # Draw the window of the cabin starting and ending at the point
    # of the roof above the top left corner of the window, robot
    # facing east
    qtr(); pu(); fd(); pd(); fdn(3); qtl(); fdn(2); qtl(); fdn(3); qtl()
    fdn(2)
    pu()
    qtr(); fd(); qtr(); pd()

def cabin():
    # Draw the cabin starting from the bottom right corner, robot facing
    # west and ending with the robot facing west at the bottom
    # left corner
    fd(); door(); fdn(7); qtr(); fdn(8); qtl(); fdn(2); ht(); fdn(3)
    window()
    fdn(7); qtr(); fdn(8); qtr(); fdn(8)

def porthole():
    pu(); qtr(); fd(); pd(); qtr(); cl(); cl(); cl(); cl(); pu(); qtr(); fd()
    qtr(); pd()

def deck(n):
    # Top of the barge with N portholes
    fdn(3 * n + 4); qtr(); fdn(3); cr()
    for h in range(n):
        fdn(2); porthole(); fd()
    cr(); fdn(3); qtr(); fdn(3 * n + 5)

def hull(n):
    # Draw the hull of a barge with N portholes, starting from the
    # top left corner
    qtr(); fd(); ht(); fdn(6); cl(); fdn(3 * n + 16); cl(); fdn(6)

gs(gridSquareSize); gr(); pu(); qtl(); fd(); pd(); fdn(3)
cabin()
deck(numberOfPortholes); hull(numberOfPortholes); st()
