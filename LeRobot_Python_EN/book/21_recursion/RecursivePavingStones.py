from LibRobot import *

# Draw recursive tiles
def pavingStone(n):
    if n == 0:
        # Draw a square of side 0
        dp()
    # Draw a square of side n
    else:
        fdn(n); qtr(); fdn(n); qtr(); fdn(n); qtr()
        fdn(n); qtr()
        # Tile the inside
        pavingStone(n - 1)

gb(); gl(); pavingStone(10); st()
