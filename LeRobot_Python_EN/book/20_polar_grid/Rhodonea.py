from LibRobot import *

# Draw a three-petalled rhodonea
a = 60

pu(); hideRobot()
for theta in range(181):
    gc(); fe(); rot(theta)
    fdl(a * cos(3 * (theta / 180 * pi)))
    dp()
st()
