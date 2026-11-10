from LibRobot import *

# Tracer une rhodonée à trois pétales
a = 60

lc(); cacherRobot()
for theta in range(181):
    ce(); pe(); rt(theta)
    tl(a * cos(3 * (theta / 180 * pi)))
    dp()
st()
