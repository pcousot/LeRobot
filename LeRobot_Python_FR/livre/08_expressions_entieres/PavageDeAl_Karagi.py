from LibRobot import *

# Pavage de Al-Karagi : carrés emboîtés de côtés 1,
# 1 + 2, 1 + 2 + 3, ..., 1 + 2 + ... + 10
lg(3); eb(); ag()
for i in range(1, 11):
    # Dessiner un carré de taille de côté
    # 1 + 2 + ... + i
    for j in range(4):
        for k in range(1, i + 1):
            for l in range(k):
                av()
        pqtd()
st()
