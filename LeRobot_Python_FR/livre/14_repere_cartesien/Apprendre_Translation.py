from LibRobot import *

# Didacticiel : apprendre à translater des
# rectangles repérés par des coordonnées
# cartésiennes. Le programme demande de translater
# un rectangle de (x, y) : on déplace le robot avec
# la souris et on clique (ou on tape sur la touche
# Entrée).
nbrMaxEssais = 5
tailleQuadrillage = 10
xRect = 9  # Côté horizontal du rectangle
yRect = 3  # Côté vertical du rectangle

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

# Dessiner un rectangle dont les côtés horizontaux
# ont la longueur xRect, dont les côtés verticaux
# ont la longueur yRect et dont le coin inférieur
# gauche est situé au point où se trouve le robot.
def dessinerRectangle():
    pn()
    for i in range(2):
        avf(yRect)  # Dessiner un côté vertical
        pqtd()
        avf(xRect)  # Dessiner un côté horizontal
        pqtd()

# Écrire le texte t dans le rectangle et repérer son
# coin inférieur gauche par une croix
def ecrireDansLeRectangle(t):
    lc(); av(); pqtd(); av(); ecrire(t)
    pdt(); av(); pqtg(); av(); pdt(); bc()
    croix()

# Dessiner un rectangle et écrire n à l'intérieur
def rectangle(n):
    dessinerRectangle()
    ecrireDansLeRectangle(entierEnChaine(n))

# Dessiner un rectangle et écrire n:(x,y) à
# l'intérieur
def rectangleEtTranslation(n, x, y):
    dessinerRectangle()
    ecrireDansLeRectangle(concat([entierEnChaine(n), ":(", entierEnChaine(x), ",", entierEnChaine(y), ")"]))
lg(tailleQuadrillage); tracerAxes()
styleTexte(gras)
nbrReussis = 0
xsouris = 0; ysouris = 0
c = " "
for essai in range(1, nbrMaxEssais + 1):
    # Tirer au sort les coordonnées (x, y) du coin
    # inférieur gauche du rectangle à translater et
    # celles (xt, yt) du rectangle translaté, de
    # sorte que les rectangles tiennent dans le
    # cadre
    x = auHasard(xmin, xmax - xRect)
    y = auHasard(ymin, ymax - yRect)
    xt = auHasard(xmin, xmax - xRect)
    yt = auHasard(ymin, ymax - yRect)
    # Dessiner le rectangle à translater
    ce(); translater(x, y); cc(violet)
    rectangleEtTranslation(essai, xt - x, yt - y)
    # Demander à l'utilisateur de le translater
    message(concat(["Translater le coin inférieur ", "gauche du rectangle ", entierEnChaine(essai), " de (", entierEnChaine(xt - x), ", ", entierEnChaine(yt - y), ");"]))
    xsouris, ysouris, c = interactionTP(True, False, False, True, False)
    if xt - x == xsouris and yt - y == ysouris:
        # Bonne translation : dessiner le rectangle
        # translaté
        cc(vert); rectangle(essai)
        nbrReussis += 1
    # Signaler l'erreur, marquer le point désigné
    # d'un petit cercle numéroté et dessiner le
    # rectangle translaté
    else:
        bip(); bip(); bip()
        cc(rouge); petitCercle()
        lc()
        if x + xsouris + 3 > xmax:
            pw(); av(); av()  # Écrire à gauche
        else:
            pe(); av()  # Écrire à droite
        bc(); ecrire(entierEnChaine(essai))
        ce(); translater(xt, yt); cc(bleu)
        rectangle(essai)
# Indiquer les résultats
ce(); translater(2, ymin); cc(noir)
essais = entierEnChaine(nbrMaxEssais)
if nbrReussis == 0:
    ecrire(concat(["Aucune réussite sur ", essais, " essais !"]))
elif nbrReussis == 1:
    ecrire(concat(["Une seule réussite sur ", essais, " essais !"]))
else:
    ecrire(concat([entierEnChaine(nbrReussis), " réussites sur ", essais, " essais"]))
ce(); st()
