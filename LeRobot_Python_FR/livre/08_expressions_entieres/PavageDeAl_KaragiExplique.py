from LibRobot import *

# Pavage de Al-Karagi expliqué : les équerres paires
# sont peintes et le bord est gradué (figure du livre)
nmax = 10

# Graduer les quatre côtés du grand carré
def marquerLeBord(n):
    l = valLgX()
    m = (n + 1) // 2 * n if n % 2 == 1 else (n + 1) * (n // 2)
    for i in range(4):
        for j in range(m):
            lg(2); pqtd(); av(); pdt(); av(); pqtd()
            lg(l); av()
        lg(2); pqtd(); av(); pdt(); av(); pqtd()
        lg(l); pqtg()

# Numéroter les équerres de 1 à n
def numeroter(n):
    policeTexte(courier); tailleTexte(9)
    for k in range(1, n + 1):
        for l in range(k // 2):
            av()
        translater(0, -4); ecrire(entierEnChaine(k))
        translater(0, 4)
        for l in range(k - k // 2):
            av()

eb(); ag(); lc(); av(); pqtd(); av(); pqtg()
bc(); lg(3)
for i in range(1, nmax + 1):
    # Dessiner un carré de taille de côté
    # 1 + 2 + ... + i
    for j in range(4):
        for k in range(1, i + 1):
            for l in range(k):
                av()
        pqtd()
# Peindre
translater(1, 1)
for i in range(2, nmax + 1):
    avf(i); pqtd(); avf(i); pqtd()
    avf(i); pqtd(); avf(i); pqtd()
    if i % 2 == 0:
        phtg(); cc(jaune); peindre(); pdt(); peindre()
        cc(violet); pqtd(); peindre(); p3htd(); cc(noir)
    translater(i, i)
# Retour en bas à gauche
for i in range(1, nmax + 1):
    translater(-i, -i)
pqtd(); marquerLeBord(nmax); numeroter(nmax); st()
