from LibRobot import *

# Dessiner des étoiles de 2 à 10 branches
tailleQuadrillage = 15
nmax = 10  # Nombre maximum de branches, >= 2
alpha = 30  # 0 < alpha < ((n - 2) * 180) / n

# Dessiner une étoile à n branches
def etoile(n):
    for i in range(n):
        av(); pdt()
        rt(2 * (n - 1) * 180 / n - alpha)
        av(); pdt(); rt(alpha)

lg(tailleQuadrillage); ag()
for i in range(2, nmax + 1):
    etoile(i)
    lg(tailleQuadrillage); translater(3, 0)
st()
