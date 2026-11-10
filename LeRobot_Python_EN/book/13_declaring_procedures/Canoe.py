from LibRobot import *

# Draw a canoe and its rowers
numberOfRowers = 12

# Draw a canoe for n rowers
def canoe(n):
    # Draw the bottom of the canoe
    qtr(); fdn(n)
    # Draw the bow of the canoe
    gs(3); etl(); fd(); tetl(); gs(12)
    # Draw the top of the canoe
    fdn(n + 1)
    # Draw the stern of the canoe
    gs(3); tetl(); fd(); etl(); fdn(2)
    # Place the robot under the first rower
    pu(); qtl(); fd(); qtr(); pd()

def rower():
    gs(3)
    # Body
    qtl(); fdn(2)
    # Right arm
    qtr(); fd(); ht(); fd()
    # Left arm
    fd(); ht(); fd(); qtl()
    # Neck
    fd()
    # Head
    qtl(); cr(); cr(); cr(); cr()
    # Go back down
    qtl(); fdn(3); qtl()

# Leave a space between two rowers
def space():
    gs(12); fd()

# Draw n rowers on the canoe
def rowers(n):
    for i in range(n):
        rower(); space()

canoe(numberOfRowers); rowers(numberOfRowers)
st()
