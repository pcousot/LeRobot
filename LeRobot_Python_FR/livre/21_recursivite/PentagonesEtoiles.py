from LibRobot import *

# Pentagones étoilés imbriqués
alpha = 36  # 0 < alpha < ((5 - 2) * 180) / 5

# Étoile à 5 branches, n >= 5
def etoile(n):
    for i in range(n):
        av(); pdt()
        rt(2 * 4 * 180 / 5 - alpha)
        av(); pdt(); rt(alpha)

def pentagoneEtoile(l):
    if l > 2:
        # Initialisation
        lc(); pe(); lgRT(l, alpha); avf(1)
        lgRT(2 * valLgX(), alpha); avf(2)
        bc()
        # Pentagone étoilé
        lgRT(l, alpha)
        rt(180 - alpha); etoile(5)
        for i in range(4):
            rt(i // 2 * alpha)
            lgRT(valLgX() * 2, 36)
            rt((-2 - i // 2) * alpha)
            etoile(8)
            pe(); lgRT(l, alpha)
            rt(180 - alpha + i * 72)
            etoile(9)
        rt(-alpha)
        lgRT(valLgX() * 2, 36)
        rt(-alpha)
        etoile(7)
        # Prochain pentagone étoilé
        pe(); lgRT(l, alpha)
        lgRT(valLgX() * 2, 36); avf(-1)
        pentagoneEtoile(l * (2 / (1 + 4 * cos(36 / 180 * pi))))

l = 31

eb(); pentagoneEtoile(l)
st()
