from LibRobot import *

# Draw the limaçon of Pascal
a = 40
b = 80

pu()
for theta in range(361):
    gc(); fe(); rot(theta)
    fdl(a + b * cos(theta / 180 * pi))
    dp()
st()
