from LibRobot import *

# Le « chapeau », découvert par David Smith en novembre 2022, dont
# l'apériodicité a été démontrée avec Joseph Samuel Myers, Craig S. Kaplan
# et Chaim Goodman-Strauss (« An aperiodic monotile », 2023) : une seule
# tuile qui recouvre tout le plan, mais jamais de façon périodique. Il est
# formé de huit cerfs-volants de la grille hexagonale de cerfs-volants :
# ses 13 côtés ont pour longueurs 1 et racine de 3 (un côté, de longueur 2,
# est formé de deux côtés de longueur 1 alignés), et ses coins tournent de
# 60 ou 90 degrés. Pour paver le plan, certains chapeaux doivent être
# retournés : l'image du chapeau dans un miroir (l'« anti-chapeau ») est
# dessinée à droite.

unite = 36                 # longueur 1, en points
r3 = sqrt(3)

# le contour, côté après côté : rotation (degrés, sens direct) avant le
# côté, puis longueur du côté
cotes = [(-60, r3), (90, 1), (60, 2), (60, 1), (-90, r3), (60, r3),
         (90, 1), (60, 1), (-90, r3), (60, r3), (90, 1), (-60, 1),
         (90, r3)]

# un point bien à l'intérieur du chapeau, vu du coin de départ (le robot
# tourné vers le nord, x vers la droite, y vers le haut)
interieurX = 1.6
interieurY = 0.5


def chapeau(u, miroir):
    # Dessiner un chapeau de côtés de longueur u, en partant et en revenant
    # au même coin, tourné vers le nord ; miroir = -1 dessine son image
    # dans un miroir
    rt(miroir * 180)           # direction qui précède le premier côté
    for rotation, longueur in cotes:
        rt(miroir * rotation)
        tl(longueur * u)
    rt(-miroir * 180)          # de nouveau tourné vers le nord


def peindreChapeau(u, miroir):
    # Peindre l'intérieur du chapeau dessiné depuis le coin du robot
    angle = atan2(interieurY, interieurX) * 180 / pi - 90
    distance = sqrt(interieurX ** 2 + interieurY ** 2) * u
    lc()
    rt(miroir * angle); tl(distance)
    peindre()
    pdt(); tl(distance); pdt(); rt(-miroir * angle)
    bc()


cacherRobot()
lg(unite); lc(); deplacerReel(-6.5, 1.5); bc()
ec(3)
cc(bleu); chapeau(unite, 1); peindreChapeau(unite, 1)
lc(); pqtd(); tl(11 * unite); pqtg(); bc()
cc(rouge); chapeau(unite, -1); peindreChapeau(unite, -1)
message("Le chapeau de David Smith (en bleu) et son image dans un miroir (en rouge)")
st()
