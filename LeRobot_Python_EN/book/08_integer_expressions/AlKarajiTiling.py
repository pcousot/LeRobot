from LibRobot import *

# Tiling of Al-Karaji: nested squares of sides 1,
# 1 + 2, 1 + 2 + 3, ..., 1 + 2 + ... + 10
gs(3); gb(); gl()
for i in range(1, 11):
    # Draw a square with side length
    # 1 + 2 + ... + i
    for j in range(4):
        for k in range(1, i + 1):
            for l in range(k):
                fd()
        qtr()
st()
