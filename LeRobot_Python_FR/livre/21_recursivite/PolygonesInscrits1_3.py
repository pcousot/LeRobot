from LibRobot import *

# Polygones inscrits au tiers des côtés
n = 7
a = 2 * pi / n

def carre(x):

    return x * x

def polygone(x):
    if x >= 1:
        tl(3 * x)
        for i in range(n - 1):
            rt(360 / n); av()
        rt(360 / n); tl(x)
        rt(180 / pi * atan(sin(a) / (2 + cos(a))))
        polygone(sqrt(carre(2 * x + x * cos(a)) + carre(x * sin(a))) / 3)

eb(); pe(); polygone(26); st()
