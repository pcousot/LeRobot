# *******************************************************
# *                                                     *
# "Premières leçons de programmation en Turbo Pascal"
# Patrick, Laurent, Radhia et Thibault COUSOT
# Éditions McGraw-Hill, Paris, 1991.
# *                                                     *
# *******************************************************
from LibRobot import *

nbChiffresMax = 15
nbChiffresMaxP1 = 16
# NbChiffresMax + 1
nbChiffres = 0
r = [0] * (nbChiffresMaxP1 + 1)
# Retenues (4 ème ligne en comptant du bas)
rP = [False] * (nbChiffresMaxP1 + 1)
# Chiffres de R découveRPs
a = [0] * (nbChiffresMaxP1 + 1)
# A (3 ème ligne en comptant du bas)
b = [0] * (nbChiffresMaxP1 + 1)
# B (2 ème ligne en comptant du bas)
s = [0] * (nbChiffresMaxP1 + 1)
# A + B (1 ère ligne en comptant du bas)
sP = [False] * (nbChiffresMaxP1 + 1)
# Chiffres de S découveRPs
equ = [" "] * (9 + 1)

# Caractères figurant sur les mêmes touches que les
# chiffres sur le claviuer AZERTY
def initialiserAetBauHasard():
    a[1] = 0
    for i in range(2, nbChiffres + 2):
        a[i] = abs(random() + tickCount()) % 10
    b[1] = 0
    for i in range(2, nbChiffres + 2):
        b[i] = abs(random() + tickCount()) % 10

def additionner():
    # S := A + B, retenues dans R
    sC = 0
    r[nbChiffres + 1] = 0
    for i in range(nbChiffres + 1, 1, -1):
        sC = r[i] + a[i] + b[i]
        if sC < 10:
            r[i - 1] = 0
            s[i] = sC
        else:
            r[i - 1] = 1
            s[i] = sC - 10
    s[1] = r[1]

def marquerAucunChiffreTrouve():
    # Marquer les chiffres de R et S restant à trouver
    for i in range(1, nbChiffres + 2):
        rP[i] = False
        sP[i] = False
    rP[1] = True  # La retenue de poids fort est portée directement dans le résultat S
    if s[1] == 0:
        sP[1] = True
    rP[nbChiffres + 1] = True  # Pas de retenue de poids faible

# Marque d'un emplacement à compléter : un petit carré (un seul point se
# voyait à peine sur les écrans actuels)
def marque(couleur):
    cc(couleur); ec(3); dp(); ec(1); cc(noir)

def ecrireChiffre(s, x, y, c):
    # Ecrire le chiffre C dans le style S en position (X, Y) par rapport au centre
    deplacer(x, y)
    marque(blanc)  # effacer la marque de l'emplacement
    styleTexte(s)
    ecrire(chr(ord("0") + c) * 1)
    styleTexte(normal)

def bipBipBip():
    bip(); bip(); bip()

nbErreurs = 0
nbAdditionsEssayees = 0
nbAdditionsReussies = 0

def erreur():
    global nbErreurs
    bipBipBip(); nbErreurs += 1

c = " "

def carEnChiffreEtEcrire(c, i, x, y):
    # Lire le chiffre I au clavier (en indiquant les erreurs par un 'bip'
    fin = False
    r = ord(c) == ord("0") + i or c == equ[i]
    if r:
        ecrireChiffre(normal, x, y, i)
    else:
        erreur()
    return r

def ecrireNombre(s, y, n, p, d):
    # Ecrire le nombre N, du chiffre de rang P au chiffre de rang D, à la ligne Y
    # (les lignes étant comptées de bas en haut) dans le style S (Gras ou Normal)
    i = 0
    i = p
    while n[i] == 0 and i < d:
        i += 1
    for j in range(i, d + 1):
        ecrireChiffre(s, j, y, n[j])

def marquerEmplacement(y, p, d):
    # Marquer  les  emplacements  des chiffres de rang P au rang D, d'un nombre
    # qui serait écrit à la ligne Y (les lignes étant comptées de bas en haut).
    for i in range(p, d + 1):
        deplacer(i, y); marque(noir)

def barre():
    # Dessiner la barre d'opération à la ligne 1
    deplacer(0, 1); pe()
    for i in range(nbChiffres + 2):
        av()
    pn()

def signeAddition():
    # Dessiner le signe d'addition à la ligne 2
    deplacer(0, 2)
    styleTexte(gras)
    ecrire(concat(["+"]))
    styleTexte(normal)

def operationTerminee():
    # Retourne vrai ssi toutes les positions a compléter l'ont été
    res = False
    resultat = False
    res = True
    for i in range(1, nbChiffres + 2):
        res = res and (rP[i] or r[i] == 0) and sP[i]
    # Ne pas exiger que les retenues égales a zéro soient complétées
    resultat = res
    return resultat

def completerOperation():
    # Compléter l'opération en désignant à chauqe fois un emplacement avec la souris et
    # en tapant un chiffre, les erreurs étant signalées par un 'bip'
    # Retourne faux si l'on a abandonné l'opération (touche Échap)
    x = 0
    y = 0
    # Coordonnees de la souris
    rL = False
    c = " "
    while not operationTerminee():
        ce()
        message("Désigner une case (résultat ou retenue) : souris ou flèches, puis taper le chiffre. Échap : abandonner.")
        x, y, c = interactionTP(False, False, False, False, False)
        if c == "\x1b":
            # Échap : abandonner cette opération
            ce()
            return False
        if y == 0:
            if not sP[x]:
                rL = carEnChiffreEtEcrire(c, s[x], x, y)
                sP[x] = rL
            else:
                bipBipBip()
        elif y == 4:
            if not rP[x]:
                rL = carEnChiffreEtEcrire(c, r[x], x, y)
                rP[x] = rL
            else:
                bipBipBip()
        else:
            bipBipBip()
    ce()
    return True

# tout le dialogue est dans la fenetre du robot (barre du bas) : rien
# dans le terminal, qui n'a donc pas a etre efface
def effacerFenetreTexte():
    pass

sortieTerminal(False)
# grille de 20 pixels (12 par defaut) : la police de XQuartz est plus
# grande que celle du Macintosh et les lignes de chiffres se touchaient
lg(20)
equ[0] = "à"  # Equivalent miniscule des chiffres sur les claviers AZERTY
equ[1] = "&"
equ[2] = "é"
equ[3] = "\""
equ[4] = "'"
equ[5] = "("
equ[6] = "§"
equ[7] = "è"
equ[8] = "!"
equ[9] = "ç"
nbAdditionsEssayees = 0
nbAdditionsReussies = 0
effacerFenetreTexte()
while True:  # repeat ... until
    write("Additions à combien de chiffres ? (réponse entre 1 et ", sprintf("%*d", 1, nbChiffresMax), ") : ")
    nbChiffres = lireEntier()
    if nbChiffres < 1:
        writeln("Erreur, pas assez de chiffres. Recommencer...")
    if nbChiffres > nbChiffresMax:
        writeln("Erreur, addition avec trop de chiffres. Recommencer...")
    if 1 <= nbChiffres and nbChiffres <= nbChiffresMax:
        break
while True:  # repeat ... until
    initialiserAetBauHasard()
    additionner()
    marquerAucunChiffreTrouve()
    marquerEmplacement(4, 2, nbChiffres)  # Retenue R
    ecrireNombre(gras, 3, b, 2, nbChiffres + 1)  # Nombre A
    ecrireNombre(gras, 2, a, 2, nbChiffres + 1)  # Nombre B
    signeAddition(); barre()
    if s[1] != 0:
        marquerEmplacement(0, 1, nbChiffres + 1)  # S = A + B
    else:
        marquerEmplacement(0, 2, nbChiffres + 1)  # S = A + B
    ce()
    nbErreurs = 0
    termine = completerOperation()
    nbAdditionsEssayees += 1
    # Addition terminee : le resultat reste dans la barre du bas jusqu'a
    # ce qu'on tape une touche (lue ici, pour qu'elle ne reponde pas a la
    # question suivante)
    suite = "   (taper une touche pour continuer)"
    if not termine:
        message(concat(["Addition abandonnée.", suite]))
    elif nbErreurs == 0:
        nbAdditionsReussies += 1
        message(concat(["Bravo ! Addition réussie sans aucune erreur.", suite]))
    elif nbErreurs == 1:
        message(concat(["Addition terminée, avec une seule erreur.", suite]))
    else:
        message(concat(["Addition terminée, avec ", entierEnChaine(nbErreurs), " erreurs.", suite]))
    lireCar()
    ce(); cf(blanc)
    message("Avez-vous terminé vos opérations ? (répondre 'O' ou 'N')")
    c = lireCar()
    if c == "o" or c == "O" or c == "0":
        break
effacerFenetreTexte()
if nbAdditionsReussies == nbAdditionsEssayees:
    if nbAdditionsEssayees == 1:
        writeln("Bravo, vous avez réussi votre opération sans erreurs !")
    else:
        writeln("Félicitations, vous avez réussi toutes vos opérations sans aucune faute !")
elif nbAdditionsEssayees == 1:
    writeln("Dommage, vous n'avez pas réussi votre opération du premier coup !")
elif nbAdditionsReussies == 1:
    writeln("Une opération réussie du premier coup sur ", sprintf("%*d", 1, nbAdditionsEssayees), " essais")
else:
    writeln(sprintf("%*d", 1, nbAdditionsReussies), " opérations réussies sans fautes sur ", sprintf("%*d", 1, nbAdditionsEssayees), " tentatives")
writeln()
writeln("Terminer en tapant la touche 'Retour-chariot'.")
readln()
