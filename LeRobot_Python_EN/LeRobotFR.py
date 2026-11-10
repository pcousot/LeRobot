"""LeRobot -- l'interface de la bibliotheque du robot
(traduction de LeRobot.mli / LeRobot.ml).

Un programme de dessin commence par  from LeRobot import *  et finit par
st (). Chaque commande attend d'abord selon la vitesse (vt), puis est
enregistree, de sorte que st () puisse rejouer le dessin quand on change la
vitesse (+ / -).

Commandes (voir LeRobot.mli de la version OCaml) :
  grille      lg, lgX, lgY, lgRT, dg, valLgX, valLgY, valLgR, valLgT
  rotations   pn pne pe pse ps psw pw pnw, pivoter, rt,
              phtd pqtd p3htd phtg pqtg p3htg pdt
  translation av, vd, vg, avf, tracer, translater, tl, deplacer
  bords       ce, eh, eb, ad, ag
  crayon      bc, lc, dc, dp, ec, cc, peindre, valBc, valEc, valCc
  mise au pt  cf, valCf, montrerRobot, cacherRobot, valVisible,
              autoriserSorties, interdireSorties, valAutoriserSorties
  vitesse     pp, ex, vt, valVt, st
  ecriture    message, effacerMessage, valMessage, lireCar, ...
Les commandes a deux arguments s'ecrivent tracer(a, b), translater(dx, dy),
deplacer(x, y), lgRT(r, t) (un couple est aussi accepte : deplacer((x, y))).
"""
import Principal
import Robot
import Dessin
import Graph
import Grille
import Ecriture
import Interaction as _Interaction

_wait = Principal.wait


def _enreg(f):
    """Les commandes de dessin sont enregistrees (comme le fait Dessiner)
    pour que st () puisse rejouer le dessin quand on change la vitesse ;
    dans la version de 1998 la liste restait vide et le dessin
    disparaissait."""
    Principal.empile_fun(f)
    f()


def _commande(f, nom=None):
    def commande():
        _wait()
        _enreg(f)
    commande.__name__ = nom or f.__name__
    commande.__qualname__ = commande.__name__   # messages d'erreur : av()
    commande.__doc__ = f.__doc__
    return commande


def valVt():
    return Principal.valVt()


vt = Principal.vt
pp = Principal.pp
ex = Principal.ex


def lg(n):
    _wait(); _enreg(lambda: Principal.lg(n))


def lgX(n):
    _wait(); _enreg(lambda: Principal.lgX(n))


def lgY(n):
    _wait(); _enreg(lambda: Principal.lgY(n))


def lgRT(r, t=None):
    if t is None:
        (r, t) = r
    _wait(); _enreg(lambda: Principal.lgRT(r, t))


dg = _commande(Principal.dg, "dg")
pn = _commande(Principal.pn, "pn")
pne = _commande(Principal.pne, "pne")
pe = _commande(Principal.pe, "pe")
pse = _commande(Principal.pse, "pse")
ps = _commande(Principal.ps, "ps")
psw = _commande(Principal.psw, "psw")
pw = _commande(Principal.pw, "pw")
pnw = _commande(Principal.pnw, "pnw")


def pivoter(n):
    _wait(); _enreg(lambda: Principal.pivoter(n))


def rt(n):
    _wait(); _enreg(lambda: Principal.rt(n))


phtd = _commande(Principal.phtd, "phtd")
pqtd = _commande(Principal.pqtd, "pqtd")
p3htd = _commande(Principal.p3htd, "p3htd")
phtg = _commande(Principal.phtg, "phtg")
pqtg = _commande(Principal.pqtg, "pqtg")
p3htg = _commande(Principal.p3htg, "p3htg")
pdt = _commande(Principal.pdt, "pdt")
av = _commande(Principal.av, "av")
vd = _commande(Principal.vd, "vd")
vg = _commande(Principal.vg, "vg")


def avf(n):
    _wait(); _enreg(lambda: Principal.avf(n))


def _deux(a, b):
    return a if b is None else (a, b)


def tracer(a, b=None):
    p = _deux(a, b)
    _wait(); _enreg(lambda: Principal.tracer(p))


def translater(a, b=None):
    p = _deux(a, b)
    _wait(); _enreg(lambda: Principal.translater(p))


def deplacer(a, b=None):
    p = _deux(a, b)
    _wait(); _enreg(lambda: Principal.deplacer(p))


def tl(n):
    _wait(); _enreg(lambda: Principal.tl(n))


ce = _commande(Principal.ce, "ce")
eh = _commande(Principal.eh, "eh")
eb = _commande(Principal.eb, "eb")
ad = _commande(Principal.ad, "ad")
ag = _commande(Principal.ag, "ag")
bc = _commande(Principal.bc, "bc")
lc = _commande(Principal.lc, "lc")
dc = _commande(Principal.dc, "dc")
dp = _commande(Principal.dp, "dp")


def valLgTl():
    _wait(); return Principal.valLgTl()


def cf(n):
    _enreg(lambda: Principal.cf(n))


valCf = Principal.valCf
montrerRobot = _commande(Principal.montrerRobot, "montrerRobot")
cacherRobot = _commande(Principal.cacherRobot, "cacherRobot")


def valVisible():
    _wait(); return Principal.valVisible()


autoriserSorties = _commande(Principal.autoriserSorties, "autoriserSorties")
interdireSorties = _commande(Principal.interdireSorties, "interdireSorties")


def valAutoriserSorties():
    _wait(); return Principal.valAutoriserSorties()


def st():
    _wait(); Principal.st()


peindre = _commande(Principal.peindre, "peindre")

# ---------------------------------------------------------------------------
entierEnChaine = Ecriture.entierEnChaine
reelEnChaine = Ecriture.reelEnChaine
booleenEnChaine = Ecriture.booleenEnChaine
concat = Ecriture.concat
policeTexte = Ecriture.policeTexte
tailleTexte = Ecriture.tailleTexte
valPoliceTexte = Ecriture.valPoliceTexte
valTailleTexte = Ecriture.valTailleTexte
message = Ecriture.message
effacerMessage = Ecriture.effacerMessage
valMessage = Ecriture.valMessage
lireCar = Ecriture.lireCar

# ---------------------------------------------------------------------------


def valEc():
    _wait(); return Robot.valEc()


def valX():
    _wait(); return Robot.valX()


def valY():
    _wait(); return Robot.valY()


def valBc():
    _wait(); return Robot.valBc()


def valOrientation():
    _wait(); return Robot.valOrientation()


def ec(n):
    _wait(); _enreg(lambda: Robot.ec(n))


def tn(): _wait(); return Robot.tn()
def tne(): _wait(); return Robot.tne()
def te(): _wait(); return Robot.te()
def tse(): _wait(); return Robot.tse()
def ts(): _wait(); return Robot.ts()
def tsw(): _wait(); return Robot.tsw()
def tw(): _wait(); return Robot.tw()
def tnw(): _wait(); return Robot.tnw()
def tb(): _wait(); return Robot.tb()


# ---------------------------------------------------------------------------
blanc = Dessin.blanc
gris = Dessin.gris
rouge = Dessin.rouge
bleu = Dessin.bleu
vert = Dessin.vert
violet = Dessin.violet
noir = Dessin.noir
indigo = Dessin.indigo
jaune = Dessin.jaune


def cc(n):
    _enreg(lambda: Dessin.cc(n))


valCc = Dessin.valCc

# ---------------------------------------------------------------------------


def init_pict():
    _wait(); Graph.init_pict()


mementoCommandesClavier = Graph.mementoCommandesClavier

# ---------------------------------------------------------------------------


def valLgX(): _wait(); return Grille.valLgX()
def valLgY(): _wait(); return Grille.valLgY()
def valLgR(): _wait(); return Grille.valLgR()
def valLgT(): _wait(); return Grille.valLgT()


# ---------------------------------------------------------------------------
interaction = _Interaction.interaction

# Echap pendant le dessin leve Utile.Stop : c'est une fin normale du
# programme, sans message d'erreur
import sys as _sys
from Utile import Stop as _Stop
_defaut = _sys.excepthook


def _fin(type_, valeur, trace):
    if issubclass(type_, (_Stop, Principal.STOP)):
        try:
            import Graphics
            Graphics.close_graph()
        except Exception:
            pass
        return
    _defaut(type_, valeur, trace)


_sys.excepthook = _fin
