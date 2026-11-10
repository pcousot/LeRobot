from LibRobot import *

# The robot's turns defined by procedures

# Turns the robot on the spot a quarter turn
# to the right
def qtr():
    etr(); etr()

# Turns the robot on the spot a quarter turn
# to the left
def qtl():
    etl(); etl()

# Turns the robot on the spot 3 eighths of a
# turn to the right
def tetr():
    qtr(); etr()

# Turns the robot on the spot 3 eighths of a
# turn to the left
def tetl():
    qtl(); etl()

# Turns the robot on the spot a half turn
def ht():
    qtr(); qtr()

fd(); qtr(); fd(); qtl(); fd(); tetr(); fd()
tetl(); fd(); ht(); fd()
st()
