from LibRobot import *

# Draw ducks

# Draw a duck on a
# grid of size l without changing
# the original grid
def duck(l):
    # Remember the dimensions of the original grid
    lX = valGsX(); lY = valGsY()
    # Draw a duck with a grid of size l
    gs(l)
    fdn(19)  # Waterline
    gsX(3 * l); gsY(7 * l); etl()  # Tail
    fd(); ht(); gsX(4 * l); gsY(2 * l); fd()
    gsX(6 * l); gsY(3 * l); tetr(); cl()  # Back
    gsX(4 * l); gsY(l); cl(); ht()
    gs(l); fdn(2); gs(3 * l); cl(); cl()  # Head
    pu(); qtl(); fd(); dc(); ht(); fd()  # Eye
    qtl(); pd()
    gsX(2 * l); gsY(l); fd(); etr(); fd()  # Beak
    qtl(); fd()
    gsX(2 * l); gsY(6 * l); fd()  # Breast
    etl()
    # Place the robot at the rear of the duck
    gs(l); fdn(18)
    # Restore the original grid
    gsX(lX); gsY(lY)

gs(6); fe(); duck(3); fd(); duck(2); fd()
duck(1); fd(); duck(1); st()
