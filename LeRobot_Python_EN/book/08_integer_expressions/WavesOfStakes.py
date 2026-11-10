from LibRobot import *

# Draw a row of stakes in waves
gl()
for i in range(1, 9):
    for j in range(1, 6):
        for k in range(2):
            for l in range((6 - j) * ((i + 1) % 2) + j * (i % 2)):
                fd()
            ht()
        qtr(); fd(); qtl()
st()
