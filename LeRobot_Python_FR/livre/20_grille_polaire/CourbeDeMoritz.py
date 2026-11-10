from LibRobot import *

# Tracer la courbe de Moritz
a = 60

lc(); cacherRobot()
for theta in range(-1800, 1801):
    ce(); pe(); rt(theta)
    tl(a * cos(9 * (theta / 180 * pi) / 10))
    dp()
st()
