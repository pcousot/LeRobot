"""Ecriture -- ecriture et lecture dans la fenetre du robot
(traduction de Ecriture.ml)."""
import time

import Graphics
from Graphics import (current_point, moveto, draw_string, key_pressed,
                      read_key, button_down)
import Graph
from Dessin import show_ret


def entierEnChaine(n):
    return str(n)


def reelEnChaine(x):
    return "%1.4e" % x


def booleenEnChaine(b):
    return "Vrai" if b else "Faux"


def concat(liste):
    return "".join(liste)


def ecrire(chaine):
    """ecrit la chaine au point courant (qui ne bouge pas)"""
    (x, y) = current_point()
    draw_string(chaine)
    moveto(x, y)


refpol = ""
reftaille = 0


def policeTexte(police):
    """sans effet (la police de la fenetre est fixe)"""
    global refpol
    Graphics.set_font(police)
    refpol = police


def tailleTexte(taille):
    """sans effet"""
    global reftaille
    Graphics.set_text_size(taille)
    reftaille = taille


def valPoliceTexte():
    return refpol


def valTailleTexte():
    return reftaille

# ---------------------------------------------------------------------------
# ecriture dans la barre de messages


def effacerMessage():
    Graph.my_clear_bar(True)
    Graph.draw_bar_border()
    moveto(2, Graph.yTexteBar)


def message(chaine):
    (x, y) = current_point()
    effacerMessage()
    Graph.valM = chaine
    draw_string(chaine)
    moveto(x, y)


def valMessage():
    return Graph.valM

# ---------------------------------------------------------------------------
# Lecture d'un caractere : on rend directement le caractere ('0' pour un
# clic), la fleche de retour de la barre clignotant pendant l'attente


def lireCar():
    allume = True
    n = 0
    while True:
        show_ret(allume)
        if key_pressed():
            return read_key()
        if button_down():
            return "0"
        Graphics.attente_vide()
        Graphics.synchronize()
        time.sleep(0.01)            # clignotement visible (~0,3 s)
        if n == 30:
            n = 0
            allume = not allume
        else:
            n += 1
