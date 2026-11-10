from LibRobot import *

# Avancer sans jamais sortir du cadre

# Avancer si cela ne fait pas sortir le robot du cadre
def avSansSortir():
    if not tb():
        av()

for i in range(1025):
    avSansSortir()
st()
