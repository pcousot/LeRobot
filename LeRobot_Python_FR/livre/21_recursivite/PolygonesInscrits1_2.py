from LibRobot import *

# Polygones inscrits au milieu des côtés
n = 7
a = 2 * pi / n

def carre(x):

    return x * x

def polygone(x):
    if x >= 1:
        tl(2 * x)
        for i in range(n - 1):
            rt(360 / n); av()
        rt(360 / n); tl(x)
        rt(180 / pi * atan(sin(a) / (1 + cos(a))))
        polygone(sqrt(carre(x * (1 + cos(a))) + carre(x * sin(a))) / 2)

eb(); pe(); polygone(40); st()
