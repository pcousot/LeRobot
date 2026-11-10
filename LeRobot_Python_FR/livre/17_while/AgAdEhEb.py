from LibRobot import *

# Définition des commandes ag, ad, eb et eh

# Définition de la commande ag
def auBordOuest():
    lc(); pw()
    while not tb():
        av()

def alOuest():
    if tn():
        auBordOuest(); pn()
    elif tne():
        auBordOuest(); pne()
    elif te():
        auBordOuest(); pe()
    elif tse():
        auBordOuest(); pse()
    elif ts():
        auBordOuest(); ps()
    elif tsw():
        auBordOuest(); psw()
    elif tw():
        auBordOuest()
    else:
        auBordOuest(); pnw()

def ag():
    if valBc():
        alOuest(); bc()
    else:
        alOuest()

# Définition de la commande ad
def auBordEst():
    lc(); pe()
    while not tb():
        av()

def alEst():
    if tn():
        auBordEst(); pn()
    elif tne():
        auBordEst(); pne()
    elif te():
        auBordEst()
    elif tse():
        auBordEst(); pse()
    elif ts():
        auBordEst(); ps()
    elif tsw():
        auBordEst(); psw()
    elif tw():
        auBordEst(); pw()
    else:
        auBordEst(); pnw()

def ad():
    if valBc():
        alEst(); bc()
    else:
        alEst()

# Définition de la commande eb
def auBordSud():
    lc(); ps()
    while not tb():
        av()

def enBas():
    if tn():
        auBordSud(); pn()
    elif tne():
        auBordSud(); pne()
    elif te():
        auBordSud(); pe()
    elif tse():
        auBordSud(); pse()
    elif ts():
        auBordSud()
    elif tsw():
        auBordSud(); psw()
    elif tw():
        auBordSud(); pw()
    else:
        auBordSud(); pnw()

def eb():
    if valBc():
        enBas(); bc()
    else:
        enBas()

# Définition de la commande eh
def auBordNord():
    lc(); pn()
    while not tb():
        av()

def enHaut():
    if tn():
        auBordNord()
    elif tne():
        auBordNord(); pne()
    elif te():
        auBordNord(); pe()
    elif tse():
        auBordNord(); pse()
    elif ts():
        auBordNord(); ps()
    elif tsw():
        auBordNord(); psw()
    elif tw():
        auBordNord(); pw()
    else:
        auBordNord(); pnw()

def eh():
    if valBc():
        enHaut(); bc()
    else:
        enHaut()

# Dessiner un trait de longueur 3 puis reprendre la
# position initiale
def trait():
    av(); av(); av()
    pdt(); av(); av(); av(); pdt()

# Faisceau de 5 traits au milieu du bord gauche
ag(); trait(); phtd(); trait(); phtd(); trait()
phtd(); trait(); phtd(); trait(); pdt()
# Faisceau de 5 traits au milieu du bord droit
ad(); trait(); phtg(); trait(); phtg(); trait()
phtg(); trait(); phtg(); trait(); pdt()
# Faisceau de 5 traits au milieu du bord supérieur
ce(); eh(); pqtd(); trait(); phtd(); trait()
phtd(); trait(); phtd(); trait(); phtd()
trait(); pqtd()
# Faisceau de 5 traits au milieu du bord inférieur
eb(); pqtd(); trait(); phtg(); trait(); phtg()
trait(); phtg(); trait(); phtg(); trait()
pqtd()
# Faisceau de 3 traits au coin supérieur gauche
eh(); ag(); pqtd(); trait(); phtd(); trait()
phtd(); trait(); pdt()
# Faisceau de 3 traits au coin supérieur droit
ad(); pqtg(); trait(); phtg(); trait(); phtg()
trait(); pdt()
# Faisceau de 3 traits au coin inférieur gauche
eb(); ag(); trait(); phtd(); trait(); phtd()
trait(); pqtg()
# Faisceau de 3 traits au coin inférieur droit
ad(); trait(); phtg(); trait(); phtg(); trait()
pqtd()
# Faisceau de 8 traits au centre du cadre
ce(); trait(); phtd(); trait(); phtd(); trait()
phtd(); trait(); phtd(); trait(); phtd(); trait()
phtd(); trait(); phtd(); trait(); phtd(); st()
