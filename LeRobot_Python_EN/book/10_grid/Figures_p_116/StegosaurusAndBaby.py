from LibRobot import *

# Draw a stegosaurus and its baby
def stegosaurus():
    # Go to the tip of the tail
    # Down
    pu(); qtr(); qtr(); fdn(7)
    # To the right
    qtl(); fdn(13); qtl(); pd()
    # Top of the tail
    fd()
    # 1st tail spike
    qtr(); cl(); qtl(); cl(); qtr(); qtr()
    cl()
    # 2nd tail spike
    qtr(); qtr(); cl(); qtl(); cl(); qtr()
    cr(); cl(); fd()
    # Draw the 11 bony back plates
    # from back to front
    # 1
    cr(); fdn(3); qtr(); fd(); qtr(); fdn(4); qtr()
    cr(); fd()
    # 2
    qtl(); cr(); fdn(3); qtr(); fd(); qtr(); fdn(2)
    qtr(); pu(); fd(); pd()
    # 3
    cr(); fdn(2); qtr(); fd(); qtr(); fd(); qtr()
    pu(); fd(); pd()
    # 4
    cr(); qtl(); fd(); qtr(); fd(); qtr(); fdn(2)
    qtr(); fdn(2); qtr(); cr()
    qtl(); fd()
    # 5
    fd(); cr(); fd(); qtr(); fdn(2); qtr(); fdn(2)
    qtr(); fd(); cr(); qtl()
    # 6
    fdn(2); qtr(); fdn(2); qtr(); fdn(2); qtr(); fdn(2)
    qtr()
    fdn(2); qtl()
    # 7
    cr(); fd(); qtr(); fdn(2); qtr(); fdn(2); qtr()
    fd(); cr(); fd()
    # 8
    fd(); qtl(); cr(); qtr(); fdn(2); qtr(); fdn(2)
    qtr(); fd(); qtr(); fd()
    qtl(); cr()
    # 9
    cl(); qtr(); qtr(); fdn(2); qtr(); fd(); qtr()
    fd(); qtr(); cl()
    # 10
    cr(); cl(); qtr(); qtr(); fdn(3); qtr(); fd()
    fd(); qtr(); fd(); cr(); cl()
    # 11
    fd(); cr(); qtr(); fdn(3); qtr(); fd(); qtr()
    fdn(2); cr()
    # Draw the head
    # Skull
    fdn(2)
    # Eye
    pu(); qtl(); fd(); dc(); qtr(); qtr(); fd()
    qtl(); pd()
    # Forehead
    cl(); cr()
    # Top of the snout
    fd(); cl()
    # Mouth
    qtl(); fdn(2); qtr(); qtr(); fdn(2); qtl()
    # Underside of the head
    cl(); fdn(7); cl(); qtr(); fd()
    # Draw the front legs
    # Left leg
    qtl(); fdn(3); qtr(); qtr(); fdn(5); qtl(); fdn(2)
    qtl(); fdn(6); qtr(); qtr(); fdn(3)
    # Right leg
    fdn(2); qtl(); fd(); qtl(); fdn(2); qtl(); fd()
    qtr()
    qtr(); fd()
    # Draw the belly
    cl(); qtr(); fd(); fd(); fd()
    # Draw the hind legs
    # Left leg
    qtl(); fdn(3); qtr(); qtr(); fdn(7); qtl(); fdn(2)
    qtl(); fdn(8); qtr(); qtr(); fdn(6)
    # Right leg
    fd(); qtl(); fd(); qtl(); fdn(3); qtl(); fd()
    qtr(); qtr(); fd()
    # Complete the underside of the tail
    fd(); qtr(); cl(); fd(); cr(); cl(); fd()
    qtr(); cl(); qtr()

# Move the stegosaurus off centre to the left
pu(); qtl(); fdn(5); qtr(); pd(); stegosaurus()
# Move the baby stegosaurus off centre to the
# right
pu(); qtl(); fdn(5); qtl(); pd()
gs(4); stegosaurus(); st()
