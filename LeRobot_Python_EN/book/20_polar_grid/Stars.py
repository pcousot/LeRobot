from LibRobot import *

# Draw stars with 2 to 10 points
gridSize = 15
nmax = 10  # Maximum number of points, >= 2
alpha = 30  # 0 < alpha < ((n - 2) * 180) / n

# Draw a star with n points
def star(n):
    for i in range(n):
        fd(); ht()
        rot(2 * (n - 1) * 180 / n - alpha)
        fd(); ht(); rot(alpha)

gs(gridSize); gl()
for i in range(2, nmax + 1):
    star(i)
    gs(gridSize); translate(3, 0)
st()
