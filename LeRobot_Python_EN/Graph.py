"""Graph -- la fenetre graphique et la barre du bas (traduction de Graph.ml).

La fenetre s'ouvre des l'import de ce module, comme en OCaml (open_graph
au chargement de Graph.ml).
"""
import Graphics
from Graphics import (open_graph, size_x, size_y, set_color, fill_rect,
                      moveto, lineto, draw_string, current_point, clear_graph,
                      white, black)

# ===========================================================================
# DIMENSION DE LA FENETRE GRAPHIQUE
dimX = 800
dimY = 700

# HAUTEUR DE LA BARRE DU BAS (15 a l'origine) et epaisseur de son bord
hBar = 24
epBord = 2
yTexteBar = 5                       # ordonnee du texte dans la barre
# ===========================================================================

open_graph(" %dx%d" % (dimX, dimY))

mementoCommandesClavier = ("- :qtl + :qtr l :etl r :etr f :fd ( :cl ) :cr "
                           "d :pd u :pu c :dc . :dg p :dp * :pc w :paint  Return :end")
valM = ""

xshow = dimX - 48
yshow = (hBar - 6) // 2

binfx = 10
binfy = hBar + epBord
bsupx = 10
bsupy = 10

centrex = (size_x() - bsupx + binfx) // 2
centrey = (size_y() - bsupy + binfy) // 2


def my_clear_bar(tout):
    global valM
    set_color(white)
    fill_rect(0, 0, (size_x() - 1) if tout else (dimX - 52), hBar)
    valM = ""
    set_color(black)


def draw_bar_border():
    """bord de la barre : trait epais en haut, trait fin a droite"""
    fill_rect(0, hBar, size_x(), epBord)
    moveto(size_x() - 1, hBar)
    lineto(size_x() - 1, 0)


def my_draw_bar():
    global valM
    (x, y) = current_point()
    my_clear_bar(False)
    draw_bar_border()
    moveto(dimX - 52, hBar)
    lineto(dimX - 52, 0)
    moveto(dimX - 38, hBar)
    lineto(dimX - 38, 0)
    moveto(2, yTexteBar)
    draw_string(mementoCommandesClavier)
    valM = mementoCommandesClavier
    moveto(x, y)


def init_pict():
    clear_graph()
    my_draw_bar()


def testbornes(a, b):
    # (b est compare a bsupx, comme dans la version OCaml)
    return (a >= binfx and a <= size_x() - bsupx
            and b >= binfy and b <= size_y() - bsupx)
