from LibRobot import *

# Dessiner des pavés récursifs
def pave(n):
    if n == 0:
        # Dessiner un carré de côté 0
        dp()
    # Dessiner un carré de côté n
    else:
        avf(n); pqtd(); avf(n); pqtd(); avf(n); pqtd()
        avf(n); pqtd()
        # Paver l'intérieur
        pave(n - 1)

eb(); ag(); pave(10); st()
