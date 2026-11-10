from LibRobot import *

# Pavage de Golomb : 1 carré de côté 1, 2 carrés de
# côté 2, ..., 10 carrés de côté 10, bord gradué

# Dessiner un carré de côté n et avancer de n
def carre(n):
    for i in range(4):
        avf(n); pqtg()
    avf(n)

# Dessiner un quart de couronne de carrés de côté n
# pair
def quartDeCouronnePaire(n):
    for i in range(n // 2):
        carre(n)
    avf(n // 2); pqtg(); avf(n // 2)
    for i in range(n // 2):
        carre(n)
    pqtg(); avf(n // 2 * (n + 1))
    pqtg(); avf(n // 2 * (n + 1))

# Dessiner un quart de couronne de carrés de côté n
# impair
def quartDeCouronneImpaire(n):
    for i in range(n // 2):
        carre(n)
    avf(n); pqtg(); avf(n)
    for i in range(n // 2):
        carre(n)
    pqtg(); avf((n + 1) // 2 * n)
    pqtg(); avf((n + 1) // 2 * n)

# Dessiner les n quarts de couronnes du pavage
def pavage(n):
    pe()
    for i in range(1, n + 1):
        if i % 2 == 1:
            quartDeCouronneImpaire(i)
        else:
            quartDeCouronnePaire(i)
        if i != n:
            avf(i + 1); pqtg()

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

eh(); ag(); lc(); pdt(); av(); pdt(); bc()
lg(3); pavage(10); pqtg(); marquerLeBord(10); st()
