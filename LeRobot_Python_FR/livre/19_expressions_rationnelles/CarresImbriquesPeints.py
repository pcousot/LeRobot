from LibRobot import *

# Motif de S. Horemis, 'Optical and geometrical
# patterns and designs', Dover, New York, 1970.
n = 6
deuxPuissanceN = 64  # 2 à la puissance n

eb(); ag(); lg(deuxPuissanceN)
for i in range(n):
    for j in range(4):
        avf(4); pqtd()
    avf(2); phtd()
    for j in range(4):
        avf(2); avf(-1); pqtd(); peindre(); pqtg()
        av(); pqtd()
    av(); phtd()
    lg(valLgX() / 2)
st()
