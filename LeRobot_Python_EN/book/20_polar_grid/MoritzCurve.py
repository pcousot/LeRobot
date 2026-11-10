from LibRobot import *

# Draw Moritz's curve
a = 60

pu(); hideRobot()
for theta in range(-1800, 1801):
    gc(); fe(); rot(theta)
    fdl(a * cos(9 * (theta / 180 * pi) / 10))
    dp()
st()
