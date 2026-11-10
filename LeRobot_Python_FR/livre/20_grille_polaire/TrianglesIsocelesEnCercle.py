from LibRobot import *

# Pavage du disque avec des triangles isocèles

# Les triangles isocèles sont disposés en couronnes
# circulaires
n = 12
lo = 30
c = 4  # Nombre de couronnes
angleBase = (180 - 180 / n) / 2

# Dessiner un triangle isocèle en commençant par la
# pointe
def tip():
    tl(lo)
    rt(180 - angleBase)
    tl(2 * lo * cos(angleBase / 180 * pi))
    rt(180 - angleBase)
    tl(lo); pdt()

# Dessiner un triangle isocèle en commençant par la
# base
def tib():
    tl(lo)
    rt(180 - 180 / n); tl(lo)
    rt(180 - angleBase)
    tl(2 * lo * cos(angleBase / 180 * pi))
    lc(); avf(-1); bc()
    rt(angleBase)

def pavage():
    for i in range(1, c + 1):
        for j in range(2 * n):
            tip()
            for k in range(i - 1):
                tib(); tip()
        av()

pavage(); st()
