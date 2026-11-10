from LibRobot import *

# Fractal plants of orders 1 to 4
a = 26  # Angle of the twigs

# Go through a tree of size n from top to bottom,
# l being the length of the twigs
def goBack(l, n):
    if n == 0:
        fdl(l)
    else:
        goBack(l, n - 1)
        goBack(l, n - 1)
        goBack(l, n - 1)

# Draw a tree of size n, l being the length
# of the twigs
def tree(l, n):
    if n == 0:
        fdl(l)
    else:
        tree(l, n - 1)
        rot(-a)
        tree(l, n - 1); pu(); rot(180); goBack(l, n - 1)
        rot(180); pd()
        rot(a)
        tree(l, n - 1)
        rot(a)
        tree(l, n - 1); pu(); rot(180); goBack(l, n - 1)
        rot(180); pd()
        rot(-a)
        tree(l, n - 1)

def threeToThePower(n):
    if n <= 0:
        return 1
    else:
        return 3 * threeToThePower(n - 1)

for i in range(1, 5):
    bg(white); gb()
    tree(162 // threeToThePower(i), i)
    markPause()
st()
