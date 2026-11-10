from LibRobot import *

# Pavage à la Escher du triangle, en couleurs
r = 5  # Taille d'une branche de l'étoile

# Le robot ne revient pas dans l'hexagone ni dans
# l'étoile avant peindre (le pas de la grille polaire
# n'est pas celui du Macintosh) : on retient les sommets
# tracés et on peint depuis leur centre.
sommets = []

def retenir():
    global sommets
    sommets = [(valX(), valY())] + sommets

def peindreCentre():
    global sommets
    n = len(sommets)
    a = round(sum(x for (x, y) in sommets) / n)
    b = round(sum(y for (x, y) in sommets) / n)
    sommets = []
    Principal.wait()
    def faire():
        Principal.draw(False)
        fond = Graphics.point_color(a, b)
        if fond != Dessin.current_color():
            Peinture.remplir(fond, a, b)
        Principal.draw(True)
    enreg(faire)

def hexagone():
    for i in range(6):
        av(); retenir(); rt(60)

def etoile():
    for i in range(6):
        av(); retenir(); rt(60); av(); retenir(); rt(240)

def triangleOndule():
    phtd(); vd(); vg(); lgRT(valLgX(), 60); p3htg()
    vd(); vg(); pqtg(); vd()
    vg()

def motif():
    # Triangle
    lg(r * 5); triangleOndule()
    # Hexagone
    lc(); pqtg(); lg(r * 5); av(); phtg(); lg(r)
    av()
    bc(); lgRT(r * 2, 54)
    bc(); hexagone(); lc(); pdt(); lg(r); av()
    peindreCentre(); p3htg()
    lg(r * 5)
    av(); pqtg(); bc()
    # Étoile
    lc(); lgRT(r * 5, 60); avf(2); lg(r); pdt(); av()
    lgRT(r, 60); phtg(); bc()
    etoile(); lc(); phtd(); lg(r); pdt()
    peindreCentre(); av()
    lgRT(r * 5, 60); avf(-2)
    bc()

def motifSansEtoile():
    # Triangle
    lg(r * 5); triangleOndule()
    # Hexagone
    lc(); pqtg(); lg(r * 5); av(); phtg(); lg(r)
    av()
    bc(); lgRT(r * 2, 54)
    bc(); hexagone(); lc(); pdt(); lg(r); av()
    peindreCentre(); p3htg()
    lg(r * 5)
    av(); pqtg(); bc()

for j in range(1, 4):
    for i in range(j - 1):
        motif()
    motifSansEtoile()
    lc(); lg(r * 5); pqtg(); avf(j * 2 + 1)
    pqtg()
    lgRT(r * 5, 60)
    avf(2); pdt(); bc()
st()
