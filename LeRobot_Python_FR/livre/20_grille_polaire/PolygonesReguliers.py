from LibRobot import *

# Dessiner des polygones réguliers de 3 à 11 côtés
tailleQuadrillage = 24

# Dessiner un polygone régulier de n >= 1 côtés
def polygone(n):
    for i in range(n):
        av(); rt(360 / n)

for i in range(1, 4):
    for j in range(1, 4):
        lg(tailleQuadrillage)
        eh(); translater(0, -(i * i - i // 3 + 1))
        ag(); translater(4 * j, 0)
        pe()
        polygone(3 * (i - 1) + j + 2)
st()
