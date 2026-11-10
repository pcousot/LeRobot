from LibRobot import *

# Pavage du plan à l'aide de deux spirales
# formées de triangles isocèles
n = 12
lo = 30
c = 4  # Nombre de demi-couronnes constituant une spirale
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

def spirale():
    for i in range(1, c + 1):
        for j in range(n):
            tip()
            for k in range(i - 1):
                tib(); tip()

autoriserSorties(); cacherRobot(); spirale(); ce()
av(); pdt(); spirale(); st()
