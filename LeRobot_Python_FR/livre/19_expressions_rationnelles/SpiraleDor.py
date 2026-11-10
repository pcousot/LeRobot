from LibRobot import *

# Dessiner une spirale d'or
nombreDor = (1 + sqrt(5)) / 2

lg(100)
for i in range(12):
    vd()
    lg(valLgX() / nombreDor)
st()
