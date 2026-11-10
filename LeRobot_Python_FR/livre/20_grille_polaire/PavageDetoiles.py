from LibRobot import *

# Pavage du plan avec des étoiles et des hexagones
tailleQuadrillage = 9
lgLigne = 6
nbLignes = 6
n = 8  # Nombre de branches de l'étoile, supposé multiple de 4
alpha = 30  # 0 < alpha < ((n - 2) * 180) / n

def quartDetoile():
    for i in range(n // 4):
        av(); pdt()
        rt(2 * (n - 1) * 180 / n - alpha)
        av(); pdt(); rt(alpha)

def etoile():
    for i in range(4):
        quartDetoile()

def etoileSuivanteEst():
    lc()
    for i in range(2):
        quartDetoile()
    pdt(); bc()

def etoileSuivanteSud():
    lc()
    for j in range(2):
        pdt(); quartDetoile()
    bc()

def ligne():
    lg(1); ag(); lg(tailleQuadrillage); pe()
    rt(alpha / 2)
    for c in range(lgLigne):
        etoile(); etoileSuivanteEst()
    etoileSuivanteSud()

def enHaut():
    lc(); lg(1); eh(); lg(tailleQuadrillage); ps()
    rt(alpha / 2)
    quartDetoile(); bc()

def pavage():
    enHaut()
    for l in range(nbLignes):
        ligne()

pavage(); st()
