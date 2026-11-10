from LibRobot import *

# Nested star pentagons
alpha = 36  # 0 < alpha < ((5 - 2) * 180) / 5

# 5-pointed star, n >= 5
def star(n):
    for i in range(n):
        fd(); ht()
        rot(2 * 4 * 180 / 5 - alpha)
        fd(); ht(); rot(alpha)

def starPentagon(l):
    if l > 2:
        # Initialisation
        pu(); fe(); gsRT(l, alpha); fdn(1)
        gsRT(2 * valGsX(), alpha); fdn(2)
        pd()
        # Star pentagon
        gsRT(l, alpha)
        rot(180 - alpha); star(5)
        for i in range(4):
            rot(i // 2 * alpha)
            gsRT(valGsX() * 2, 36)
            rot((-2 - i // 2) * alpha)
            star(8)
            fe(); gsRT(l, alpha)
            rot(180 - alpha + i * 72)
            star(9)
        rot(-alpha)
        gsRT(valGsX() * 2, 36)
        rot(-alpha)
        star(7)
        # Next star pentagon
        fe(); gsRT(l, alpha)
        gsRT(valGsX() * 2, 36); fdn(-1)
        starPentagon(l * (2 / (1 + 4 * cos(36 / 180 * pi))))

l = 31

gb(); starPentagon(l)
st()
