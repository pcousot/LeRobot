from LibRobot import *

# Draw a frieze of podiums
gl(); qtr()
for x in range(10):
    # The robot facing east, draw two
    # steps of the podium going up
    fd(); qtl(); fd(); qtr(); fd(); qtl(); fd()
    # Draw the top of the podium
    qtr(); fd(); qtr()
    # The robot facing south, draw two
    # steps of the podium going down
    fd(); qtl(); fd(); qtr(); fd()
    # Turn the robot to face east
    qtl()
st()
