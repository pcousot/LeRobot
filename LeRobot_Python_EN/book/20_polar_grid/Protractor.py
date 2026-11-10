from LibRobot import *

# Draw a protractor graduated in degrees
length = 16

gb(); fe(); pu()
for i in range(181):
    if i == 0 or i == 90 or i == 180:
        pd(); fdn(length - 7); pu(); fdn(2)
        label(intToString(i)); fd(); pd(); fdn(4)
        pu()
    elif i % 10 == 5:
        fdn(length - 2); pd(); fdn(2); pu()
    elif i % 10 == 0:
        fdn(length - 5); label(intToString(i))
        fdn(2); pd(); fdn(3); pu()
    else:
        fdn(length - 1); pd(); fd(); pu()
    ht(); fdn(length); ht(); rot(1)
st()
