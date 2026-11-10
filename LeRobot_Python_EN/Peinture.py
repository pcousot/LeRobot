"""Peinture -- remplissage d'une zone (traduction de Peinture.remplir).

Le remplissage par germes de la version Caml Light (Peinture.peindre), qui
laissait des zones non peintes et que Principal n'utilise plus, n'est pas
repris : seul le remplissage par lignes (remplir) est traduit.
"""
import Graphics
from Graphics import size_x, size_y, current_point, moveto, set_line_width
from Graph import testbornes


def remplir(fond, x0, y0):
    """remplit, avec la couleur courante, la zone de couleur fond contenant
    (x0, y0) : remplissage par lignes, l'image etant lue en memoire"""
    w = size_x()
    h = size_y()
    lit = Graphics.lire_pixel

    def peut(x, y):
        return (0 <= x < w and 0 <= y < h and testbornes(x, y)
                and lit(x, y) == fond)

    # le point courant (position du robot) est remis a la fin : sinon le
    # trait suivant partirait du bout de la derniere ligne peinte
    (px, py) = current_point()
    set_line_width(1)
    pile = [(x0, y0)]
    while pile:
        (x, y) = pile.pop()
        if peut(x, y):
            g = x
            d = x
            while peut(g - 1, y):
                g -= 1
            while peut(d + 1, y):
                d += 1
            # (les points peints ne sont plus de la couleur fond)
            Graphics._span(g, d, y)
            # germes des lignes au-dessus et au-dessous
            for y2 in (y + 1, y - 1):
                dedans = False
                for i in range(g, d + 1):
                    if peut(i, y2):
                        if not dedans:
                            pile.append((i, y2))
                            dedans = True
                    else:
                        dedans = False
    Graphics._peut_etre_afficher()
    moveto(px, py)
