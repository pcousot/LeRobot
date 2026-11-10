from LibRobot import *

# Dessiner un carré en pointillé

# Tracer un trait pointillé de n points,
# en supposant n > 1.
def traitPointille(n):
    lg(8); ec(2); lc()
    for l in range(n - 1):
        dp(); av()
    dp(); bc()

# Tracer un carré pointillé avec p points par côté
# (p > 1).
def carre(p):
    for c in range(4):
        traitPointille(p); pqtd()

carre(30); cacherRobot(); st()
