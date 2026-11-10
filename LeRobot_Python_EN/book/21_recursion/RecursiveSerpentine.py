from LibRobot import *

# Draw serpentines

# Build a serpentine of height n starting from
# its lower west corner
def serpentineE(n):
    if n > 0:
        # Build the base of width n, from west to east
        fe(); fdn(n); fn(); fd()
        # Build the upper serpentine of height
        # n - 1 starting from its lower east corner
        serpentineW(n - 1)

# Build a serpentine of height n starting from
# its lower east corner
def serpentineW(n):
    if n > 0:
        # Build the base of width n, from east to west
        fw(); fdn(n); fn(); fd()
        # Build the upper serpentine of height
        # n - 1 starting from its lower west corner
        serpentineE(n - 1)

gs(6); gb(); gr(); serpentineW(18); gb(); gl()
serpentineE(18); st()
