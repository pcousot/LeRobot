"""Interaction -- dessin interactif au clavier et a la souris
(traduction de Interaction.ml), utilise par Dessiner.py.

Touches (edition anglaise) : - qtl, + qtr, l etl, r etr, f fd, ( cl, ) cr, d pd, u pu,
c dc, . dg, p dp, * couleur suivante (pc), w paint, retour arriere :
annuler la derniere commande, Entree : fin (et sauvegarde dans
mon_dessin.py). Les fleches deplacent le robot d'un carreau, sans tracer. Un clic (ou un deplacement bouton enfonce) amene le robot,
sans tracer, au point de la grille le plus proche de la souris.
"""
import Graphics
import Son
from Graphics import wait_next_event, Mouse_motion, Key_pressed, Button_down, close_graph
from Utile import Stop
import Principal
from Principal import (empile_fun, empile_str, phtd, pqtd, phtg, pqtg, dg, av,
                       vd, vg, lc, bc, dp, dc, peindre, cf, valCf, undo,
                       translater, Range_error, st)
from Robot import valX, valY, pixel
from Grille import valLgX, valLgY
import Dessin
from Dessin import cdef, valCc


def _commande(f, texte, avant=True):
    """commande enregistree (pour l'annuler, la rejouer et la sauver) :
    pivotements, grille et crayon sont enregistres avant d'etre executes,
    les deplacements apres (ils peuvent echouer au bord du cadre)"""
    def faire():
        if avant:
            empile_fun(f); empile_str(texte); f()
        else:
            f(); empile_fun(f); empile_str(texte)
    return faire


# PIVOTEMENTS
lpivot = {
    "r": _commande(phtd, "etr()"),
    "+": _commande(pqtd, "qtr()"),
    "l": _commande(phtg, "etl()"),
    "-": _commande(pqtg, "qtl()"),
}

nom_couleur = ["white", "yellow", "blue", "violet", "green", "red", "indigo", "black"]


def _couleur_suivante():
    cdef()
    # enregistrer la couleur choisie : elle est rejouee apres un effacement
    # et sauvee dans mon_dessin.py (cc prend le numero 0..7)
    n = valCc()
    empile_fun(lambda: Dessin.cc(n))
    empile_str("pc(%d)  # %s" % (n, nom_couleur[n]))


def _effacer():
    cf(valCf())
    undo()


ldessin = {
    # GRILLE
    ".": _commande(dg, "dg()"),
    # DEPLACEMENTS
    "f": _commande(av, "fd()", avant=False),
    ")": _commande(vd, "cr()", avant=False),
    "(": _commande(vg, "cl()", avant=False),
    # CRAYON
    "u": _commande(lc, "pu()"),
    "d": _commande(bc, "pd()"),
    "p": _commande(dp, "dp()"),
    "c": _commande(dc, "dc()"),
    # COULEURS
    "*": _couleur_suivante,
    # PEINTURE : la zone fermee derriere le robot, couleur du crayon
    "w": _commande(peindre, "paint()", avant=False),
    # ERREURS
    "\b": _effacer,
    "\x7f": _effacer,
}


def _arret():
    raise Stop()


linter = {"\r": _arret}

translation_totale = (0, 0)

# touches fleches : deplacement d'un carreau
FLECHES = {Graphics.FLECHE_GAUCHE: (-1, 0), Graphics.FLECHE_DROITE: (1, 0),
           Graphics.FLECHE_HAUT: (0, 1), Graphics.FLECHE_BAS: (0, -1)}


def trans(a, b):
    global translation_totale
    (u, v) = translation_totale
    translater(a, b)
    translation_totale = (u + a, v + b)


def t(u, v):
    return lambda: translater(u, v)


def testeny(my, ryp, ryn):
    """teste la difference en ordonnee entre robot et souris"""
    if my > ryp:
        trans(0, 1)
    elif my < ryn:
        trans(0, -1)


def _sortie_interdite(msg):
    """le robot refuse de sortir du cadre : il proteste (bip-bip)"""
    Son.bipbip()
    import noms
    print(" ** EXIT FORBIDDEN ** " + noms.ANGLAIS.get(str(msg), str(msg)), flush=True)


def interaction(coordonnees, pivotements, dessin, finsouris, sauver):
    global translation_totale
    listop = {}
    if pivotements:
        listop.update(lpivot)
    if pivotements and dessin:
        listop.update(ldessin)
    listop.update(linter)

    def interagit():
        global translation_totale
        rxp = int(valX() + valLgX() / 2.)       # un peu de marge
        ryp = int(valY() + valLgY() / 2.)
        rxn = int(valX() - valLgX() / 2.)
        ryn = int(valY() - valLgY() / 2.)
        motion = wait_next_event([Mouse_motion, Key_pressed, Button_down])
        if motion.keypressed and motion.key in FLECHES:
            # fleche : le robot se deplace d'un carreau sans tracer, comme
            # avec la souris (translater, enregistre avec la commande
            # suivante)
            try:
                trans(*FLECHES[motion.key])
            except Range_error as e:
                _sortie_interdite(e)
        elif motion.keypressed:                 # action : commande
            (a, b) = translation_totale
            # effacement (retour arriere) : le deplacement a la souris pas
            # encore enregistre est abandonne, sinon c'est lui qui serait
            # efface et non la derniere commande
            if motion.key in ("\b", "\x7f"):
                translation_totale = (0, 0)
            elif (a, b) != (0, 0):
                empile_fun(t(a, b))
                empile_str("translate(%d, %d)" % (a, b))
                translation_totale = (0, 0)
            f = listop.get(motion.key)
            if f is not None:
                try:
                    f()
                except Range_error as e:            # bord trop pres
                    _sortie_interdite(e)
        else:                                       # action : souris
            if finsouris and motion.button:
                raise Stop()
            # un clic (ou un deplacement bouton enfonce) amene le robot,
            # sans tracer, au point de la grille le plus proche de la souris ;
            # bouton relache, le robot reste en place. Si finsouris, le
            # bouton termine l'interaction : le robot suit alors la souris
            # pas a pas, bouton relache, comme en 1998.
            try:
                if not finsouris:
                    if motion.button:
                        def vers(m, r, lg):
                            return pixel((m - r) / lg)
                        dx = vers(motion.mouse_x, valX(), valLgX())
                        dy = vers(motion.mouse_y, valY(), valLgY())
                        if (dx, dy) != (0, 0):
                            trans(dx, dy)
                else:
                    if motion.mouse_x > rxp:
                        trans(1, 0)
                        testeny(motion.mouse_y, ryp, ryn)
                    elif motion.mouse_x < rxn:
                        trans(-1, 0)
                        testeny(motion.mouse_y, ryp, ryn)
                    else:
                        testeny(motion.mouse_y, ryp, ryn)
            except Range_error as e:
                _sortie_interdite(e)

    def inter():
        Principal.coord = coordonnees
        Principal.sauvegarde = sauver and dessin
        try:
            while True:
                interagit()
        except Stop:
            empile_fun(st)
            empile_str("st()")
            st()

    try:
        cf(0)
        inter()
    except Stop:
        close_graph()
        print(flush=True)
