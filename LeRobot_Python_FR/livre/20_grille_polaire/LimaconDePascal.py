from LibRobot import *

# Tracer le limaçon de Pascal
a = 40
b = 80

lc()
for theta in range(361):
    ce(); pe(); rt(theta)
    tl(a + b * cos(theta / 180 * pi))
    dp()
st()
