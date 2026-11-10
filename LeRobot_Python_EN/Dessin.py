"""Dessin -- les couleurs et le dessin du robot (traduction de Dessin.ml)."""
import Graphics
from Graphics import rgb, transp, set_color, draw_image, make_image, size_x
import Graph

# ---------------------------------------------------------------------------
# les couleurs

blanc = rgb(255, 255, 255)
gris = rgb(50, 50, 50)
rouge = rgb(255, 1, 1)
bleu = rgb(1, 1, 255)
vert = rgb(1, 255, 1)
violet = rgb(255, 1, 255)
noir = rgb(0, 0, 0)
indigo = rgb(100, 1, 100)
jaune = rgb(255, 255, 1)

# ---------------------------------------------------------------------------
# Dessin du robot

# Facteur d'agrandissement du robot : chaque pixel des dessins ci-dessous
# est affiche comme un carre echelleRobot x echelleRobot (1 a l'origine).
echelleRobot = 3


def agrandir(k, m):
    return [[ligne[j // k] for j in range(k * len(ligne))]
            for ligne in (m[i // k] for i in range(k * len(m)))]


# Les dessins sont donnes par des chaines : X = noir, . = transparent
def _matrice(lignes, couleur=noir):
    return [[couleur if c == "X" else transp for c in l] for l in lignes]


def image_robot(lignes):
    """icone (PhotoImage tkinter) du robot, agrandie echelleRobot fois ;
    le robot est pose sur le dessin et n'en fait pas partie"""
    return Graphics.creer_icone(agrandir(echelleRobot, _matrice(lignes)))


_robN = ["...X...",
         "..XXX..",
         ".XX.XX.",
         "XX...XX",
         ".XX.XX.",
         "XXX.XXX"]
_robS = ["XXX.XXX",
         ".XX.XX.",
         "XX...XX",
         ".XX.XX.",
         "..XXX..",
         "...X..."]
_robE = ["X.X...",
         "XXXX..",
         "XX.XX.",
         "....XX",
         "XX.XX.",
         "XXXX..",
         "X.X..."]
_robO = ["...X.X",
         "..XXXX",
         ".XX.XX",
         "XX....",
         ".XX.XX",
         "..XXXX",
         "...X.X"]
_robNE = ["..XXXXX",
          "..X...X",
          "XXX...X",
          ".X....X",
          "....XXX",
          "...XX..",
          "....X.."]
_robSE = ["....X..",
          "...XX..",
          "....XXX",
          ".X....X",
          "XXX...X",
          "..X...X",
          "..XXXXX"]
_robNO = ["XXXXX..",
          "X...X..",
          "X...XXX",
          "X....X.",
          "XXX....",
          "..XX...",
          "..X...."]
_robSO = ["..X....",
          "..XX...",
          "XXX....",
          "X....X.",
          "X...XXX",
          "X...X..",
          "XXXXX.."]

_robNt = ["...X...",
          "..XXX..",
          ".XXXXX.",
          "XXXXXXX",
          ".XXXXX.",
          "XXXXXXX"]
_robSt = ["XXXXXXX",
          ".XXXXX.",
          "XXXXXXX",
          ".XXXXX.",
          "..XXX..",
          "...X..."]
_robEt = ["X.X...",
          "XXXX..",
          "XXXXX.",
          "XXXXXX",
          "XXXXX.",
          "XXXX..",
          "X.X..."]
_robOt = ["...X.X",
          "..XXXX",
          ".XXXXX",
          "XXXXXX",
          ".XXXXX",
          "..XXXX",
          "...X.X"]
_robNEt = ["..XXXXX",
           "..XXXXX",
           "XXXXXXX",
           ".XXXXXX",
           "..XXXXX",
           "...XX..",
           "....X.."]
_robSEt = ["....X..",
           "...XX..",
           "..XXXXX",
           ".XXXXXX",
           "XXXXXXX",
           "..XXXXX",
           "..XXXXX"]
_robNOt = ["XXXXX..",
           "XXXXX..",
           "XXXXXXX",
           "XXXXXX.",
           "XXXXX..",
           "..XX...",
           "..X...."]
_robSOt = ["..X....",
           "..XX...",
           "XXXXX..",
           "XXXXXX.",
           "XXXXXXX",
           "XXXXX..",
           "XXXXX.."]

robN, robS, robE, robO = map(image_robot, (_robN, _robS, _robE, _robO))
robNE, robSE, robNO, robSO = map(image_robot, (_robNE, _robSE, _robNO, _robSO))
robNt, robSt, robEt, robOt = map(image_robot, (_robNt, _robSt, _robEt, _robOt))
robNEt, robSEt, robNOt, robSOt = map(image_robot, (_robNEt, _robSEt, _robNOt, _robSOt))

# ---------------------------------------------------------------------------
# couleur courante : indice dans color_vect

indice = 1


def indicepp():
    global indice
    indice = (indice + 1) % 8
    return indice


color_vect = [blanc, jaune, bleu, violet, vert, rouge, indigo, noir]


def valCc():
    return indice


def cc(n):
    global indice
    set_color(color_vect[n])
    indice = n


def robColor():
    """petit robot de la couleur courante (case de couleur de la barre)"""
    return _matrice(_robNt[:3] + ["XXXXXXX", ".XXXXX.", "XXXXXXX"], color_vect[indice])


def _retour(allume):
    o = noir if allume else blanc
    lignes = ["................XXXXXX.....",
              "................X.....XX...",
              "................XXXXXX..X..",
              "......................XX.X.",
              "........................X.X",
              "....XX..................X.X",
              "...X.X..................X.X",
              "..X.X.................XX.X.",
              ".X.XXXXXXXXXXXXXXXXXXX..X..",
              "X.....................XX...",
              ".X.XXXXXXXXXXXXXXXXXXX.....",
              "..X.X......................",
              "...X.X.....................",
              "....XX....................."]
    return _matrice(lignes, o)


def show_color():
    draw_image(make_image(robColor()), Graph.xshow, Graph.yshow)


def show_ret(allume):
    """fleche de retour (Entree) de la barre, allumee ou eteinte"""
    draw_image(make_image(_retour(allume)),
               size_x() - Graph.bsupx - 20, (Graph.hBar - 14) // 2)


def cdef():
    set_color(color_vect[indicepp()])
    show_color()


def current_color():
    return color_vect[indice]
