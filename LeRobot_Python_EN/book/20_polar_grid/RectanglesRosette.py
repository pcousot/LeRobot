from LibRobot import *

# Draw a rosette of rectangles
lengthBR = 108  # Length of the big rectangle
widthBR = 61  # Width of the big rectangle, length of the small one
widthSR = 16  # Width of the small rectangle
n = 6  # 2 * n is the number of points of the central star

def rectangles():
    pu(); fdl(widthBR // 2); rot(90); pd()
    fdl(lengthBR / 2); rot(90)
    fdl(widthBR); rot(90)
    fdl(lengthBR); rot(90)
    fdl(widthBR); rot(90)
    fdl(lengthBR / 2)
    pu(); fdl(widthSR / 2); rot(90); pd()
    fdl(widthBR); rot(90)
    pu(); fdl(widthSR); rot(90); pd()
    fdl(widthBR); ht()

for i in range(n):
    rectangles(); gc(); rot(180 / n)
st()
