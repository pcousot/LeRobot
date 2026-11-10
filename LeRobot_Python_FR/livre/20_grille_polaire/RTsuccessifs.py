from LibRobot import *

# Rotations successives de 15 degrés : les segments
# tracés par av () ont tous la même longueur
longueurCote = 50
n = 24

message("lg 50.; pe (); av ()")
lg(longueurCote); pe(); av(); marquerUnePause()
for i in range(n):
    message("ce (); rt 15.; av ()")
    ce(); rt(360 / n); av()
    marquerUnePause()
st()
