from LibRobot import *

# Fractal plant
l = 2  # Length of the twigs
a = 26  # Angle of the twigs

# Go through a tree of size n from top to bottom
def goBack(n):
    if n == 0:
        fdl(l)
    else:
        goBack(n - 1)
        goBack(n - 1)
        goBack(n - 1)

def tree(n):
    if n == 0:
        fdl(l)
    else:
        tree(n - 1)
        rot(-a)
        tree(n - 1); pu(); rot(180); goBack(n - 1)
        rot(180); pd()
        rot(a)
        tree(n - 1)
        rot(a)
        tree(n - 1); pu(); rot(180); goBack(n - 1)
        rot(180); pd()
        rot(-a)
        tree(n - 1)

gb(); tree(4); st()
