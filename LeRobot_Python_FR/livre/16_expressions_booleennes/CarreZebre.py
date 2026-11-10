from LibRobot import *

# Dessiner un carré zébré
lg(3)
for i in range(4):
    for j in range(1, 10):
        avf(3 * j); pqtd(); avf(3 * j); p3htd()
        avf(3 * j); p3htd()
        if j % 2 == 1:
            lc(); avf(3 * j - 1); pqtd(); av()
            peindre(); pdt(); av(); pqtg()
            avf(3 * j - 1); pdt(); bc()
        phtd(); avf(3 * j); p3htd(); avf(3 * j)
        pqtd(); avf(3 * j)
        if not j % 2 == 1:
            lc(); p3htd(); avf(3 * j - 1); p3htd()
            av(); peindre(); pdt()
            av(); p3htg(); avf(3 * j - 1); phtd(); bc()
        pqtd()
    pqtd()
st()
