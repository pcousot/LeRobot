from LibRobot import *

# Draw a frieze of tildes

# Draw a tilde-shaped pattern ~
def tilde():
    etr(); fd(); etr(); fd()
    qtr(); fd(); fd(); qtl()
    fd(); etl(); fd()

gl()
for i in range(10):
    tilde()
    # Back up to the next tilde's start
    pu(); tetl(); fd(); pd()
    # Turn the robot to face north
    qtr()
st()
