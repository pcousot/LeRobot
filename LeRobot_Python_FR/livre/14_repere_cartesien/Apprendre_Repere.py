from LibRobot import *

# Didacticiel : apprendre à repérer les points du
# plan par leurs coordonnées cartésiennes.
# Le programme demande de désigner un point (x, y) :
# on déplace le robot avec la souris et on clique
# (ou on tape sur la touche Entrée).
nbrMaxEssais = 5
tailleQuadrillage = 10

# Coordonnées extrêmes des points du cadre, trouvées
# en traçant les axes
xmin = 0
xmax = 0
ymin = 0
ymax = 0

# Écrire le nombre n à côté de l'axe que le robot
# est en train de tracer
def numeroter(n):
    lc()
    if te():
        pqtd(); av(); ecrire(entierEnChaine(n))
        pdt(); av(); pqtd()
    elif tn():
        pqtg(); avf(2); ecrire(entierEnChaine(n))
        pdt(); avf(2); pqtg()
    elif tw():
        pqtg(); av(); ecrire(entierEnChaine(n))
        pdt(); av(); pqtg()
    elif ts():
        pqtd(); avf(2); ecrire(entierEnChaine(n))
        pdt(); avf(2); pqtd()
    bc()

# Tracer un axe gradué depuis l'origine jusqu'au
# bord du cadre ; on obtient la coordonnée du
# dernier point de l'axe
def tracerUnAxe(increment):
    borne = 0
    while not tb():
        if borne != 0 and borne % 5 == 0:
            numeroter(borne); cc(indigo)
        else:
            cc(rouge)
        dc(); cc(noir); av(); borne += increment
    return borne

def tracerAxes():
    global xmin, xmax, ymin, ymax
    ce(); pe(); lg(3); av(); lg(tailleQuadrillage)
    numeroter(0)
    # Axe des x
    ce(); pe(); xmax = tracerUnAxe(1)
    translater(-1, 1); ecrire("X")
    ce(); pw(); xmin = tracerUnAxe(-1)
    # Axe des y
    ce(); pn(); ymax = tracerUnAxe(1)
    translater(1, -1); ecrire("Y")
    ce(); ps(); ymin = tracerUnAxe(-1)
    pn(); cc(rouge); dg(); cc(noir)
    autoriserSorties()

def petitCercle():
    lg(2); vg(); vg(); vg(); vg(); lg(tailleQuadrillage)

def croix():
    ec(3); dc(); ec(1)

# Tirer au sort un nombre entre a et b
def auHasard(a, b):
    return a + randrange(b - a + 1)
lg(tailleQuadrillage); tracerAxes()
styleTexte(gras)
nbrReussis = 0
xsouris = 0; ysouris = 0
c = " "
for essai in range(nbrMaxEssais):
    # Tirer au sort les coordonnées du point (x, y)
    # à désigner
    x = auHasard(xmin, xmax)
    y = auHasard(ymin, ymax)
    # Demander à l'utilisateur de désigner le point
    ce()
    message(concat(["Repérer le point (", entierEnChaine(x), ", ", entierEnChaine(y), ");"]))
    xsouris, ysouris, c = interactionTP(True, False, False, True, False)
    if x == xsouris and y == ysouris:
        # Le point demandé a bien été désigné : le
        # marquer d'une croix
        cc(vert); croix()
        nbrReussis += 1
    # Signaler l'erreur, marquer le point désigné
    # d'un petit cercle et le point demandé d'une
    # croix
    else:
        bip(); bip(); bip()
        cc(rouge); petitCercle()
        ce(); translater(x, y); cc(bleu); croix()
cc(noir)
# Indiquer les résultats
ce(); translater(2, ymin)
essais = entierEnChaine(nbrMaxEssais)
if nbrReussis == 0:
    message(concat(["Aucune réussite sur ", essais, " essais !"]))
elif nbrReussis == 1:
    message(concat(["Une seule réussite sur ", essais, " essais !"]))
else:
    message(concat([entierEnChaine(nbrReussis), " réussites sur ", essais, " essais"]))
ce(); marquerUnePause()
