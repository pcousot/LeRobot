"""LibRobot -- la bibliotheque du robot pour les programmes du livre
"Premieres lecons de programmation" (traduction de LibRobot.ml).

Un programme commence par  from LibRobot import *  et dispose alors de
toutes les commandes du robot (LeRobot), completees et corrigees ci-dessous
comme dans les unites Robot1, Robot2 et Robot3 de "Premieres lecons de
programmation en Turbo Pascal" (Macintosh, 1991).

Differences avec la version OCaml, dues au langage :
  - les procedures Pascal a parametres var (heure, date, interactionTP)
    rendent leurs resultats :  h, m, s = heure ()
  - write et writeln prennent plusieurs arguments : write ("x = ", x)
  - delete et insert rendent la nouvelle chaine : s = delete (s, i, n)
  - sortie_terminal (False : rien n'est ecrit dans le terminal) se change
    par  sortieTerminal (False)
"""
import atexit
import math
import os
import random as _random
import select
import signal
import struct
import subprocess
import sys
import tempfile
import time

from math import sqrt, sin, cos, tan, atan, atan2, exp, log, floor, ceil   # noqa: F401
from random import randrange, randint                                   # noqa: F401

from LeRobotFR import *                                                  # noqa: F401,F403
import LeRobotFR as LeRobot
import Graphics
import Principal
import Robot
import Graph
import Grille
import Dessin
import Ecriture
import Peinture
import Son
from Utile import Stop

_random.seed()

# enregistrement d'une commande (pour que st () la rejoue) : enreg (faire)
enreg = LeRobot._enreg

# ---------------------------------------------------------------------------
# Fonctions predefinies de Pascal


pi = math.pi


def odd(n):
    return n % 2 == 1


def sqr(n):
    return n * n


def sqr_reel(x):
    return x * x


def round(x):
    """arrondi a l'entier le plus proche, les demis a l'oppose de zero
    (comme Pascal et OCaml ; le round de Python arrondit les demis au pair)"""
    return int(math.floor(x + 0.5)) if x >= 0 else -int(math.floor(-x + 0.5))


def trunc(x):
    return int(x)


def random():
    """Random de la boite a outils du Macintosh : entier de -32767 a 32767"""
    return _random.randrange(65535) - 32767


def tickCount():
    """nombre de soixantiemes de seconde ecoules"""
    return int(math.fmod(time.time() * 60., 1e9))


def copy(s, i, n):
    """copy (s, debut, longueur) de Turbo Pascal (debut a partir de 1)"""
    l = len(s)
    i = max(1, i)
    if i > l or n <= 0:
        return ""
    return s[i - 1:i - 1 + n]


def pos(sub, s):
    """position (a partir de 1) de sub dans s, 0 si absente"""
    if sub == "":
        return 0
    return s.find(sub) + 1


def delete(s, i, n):
    """s sans les n caracteres a partir du i-eme (rend la nouvelle chaine)"""
    l = len(s)
    if i < 1 or i > l or n <= 0:
        return s
    return s[:i - 1] + s[i - 1 + n:]


def insert(t, s, i):
    """s avec t insere a la position i (rend la nouvelle chaine)"""
    l = len(s)
    i = max(1, min(i, l + 1))
    return s[:i - 1] + t + s[i - 1:]


def sprintf(format, *valeurs):
    """Printf.sprintf : sprintf ("%.17g", x)"""
    return format % valeurs


maxInt = 32767                  # entiers integer du Macintosh
maxLongint = 2147483647         # entiers longint

# ---------------------------------------------------------------------------
# Orientations absolues (pour pivoter)

nord, nordEst, est, sudEst, sud, sudOuest, ouest, nordOuest = range(8)

# ---------------------------------------------------------------------------
# Couleurs : comme en Turbo Pascal, cc et cf prennent un numero de couleur
# (indice dans la palette de Dessin.py), et valCc rend ce numero. Ces
# constantes masquent les couleurs (rgb) de LeRobot.

blanc, jaune, bleu, violet, vert, rouge, indigo, noir = range(8)

# ---------------------------------------------------------------------------
# Initialisation : la grille du robot de Turbo Pascal mesure 12 pixels par
# defaut (30 dans LeRobot), et le robot part du centre.

lgDefaut = 12.


def init_pict():
    LeRobot.init_pict()
    nom = os.environ.get("LEROBOT_PROGRAMME")
    if nom:
        Graphics.set_window_title(nom)
    lg(lgDefaut)
    # on dessine en noir : la couleur courante de LeRobot (jaune au depart)
    # doit le dire, sinon peindre ne reconnait pas les traits noirs
    LeRobot.cc(noir)
    ce()

# ---------------------------------------------------------------------------
# Temps


marquerUnePause = Principal.marquerUnePause


def heure():
    """rend (heures, minutes, secondes)"""
    t = time.localtime()
    return (t.tm_hour, t.tm_min, t.tm_sec)


def date():
    """rend (jour, mois, annee)"""
    t = time.localtime()
    return (t.tm_mday, t.tm_mon, t.tm_year)

# ---------------------------------------------------------------------------
# Sons : les sons s'accumulent dans un tampon, joue d'un seul tenant par un
# seul afplay (macOS) des que le programme fait autre chose que jouer des
# notes (une commande du robot, une lecture au clavier, st, la fin du
# programme) ; le programme attend alors la fin du morceau. (afplay met un
# temps variable a demarrer : jouees une par une, les notes avaient un rythme
# irregulier.) Sans afplay, ou avec LEROBOT_MUET=1, on attend simplement la
# duree des sons.

afplay = os.path.exists("/usr/bin/afplay") and os.environ.get("LEROBOT_MUET") is None

_joueurs = []                   # processus afplay en cours
_taux = 22050
_tampon = bytearray()
_duree_tampon = 0.
_fichiers_joues = []


def _ramasser(bloquant):
    garder = []
    for p in _joueurs:
        if bloquant:
            p.wait()
        elif p.poll() is None:
            garder.append(p)
    _joueurs[:] = garder


def _lancer_afplay(nom):
    _ramasser(False)
    _joueurs.append(subprocess.Popen(["/usr/bin/afplay", nom],
                                     stdin=subprocess.DEVNULL,
                                     stdout=subprocess.DEVNULL,
                                     stderr=subprocess.DEVNULL))


def _ajouter_son(freq, duree, volume):
    global _duree_tampon
    n = int(duree * _taux)
    attaque = _taux * 0.01
    deux_pi_f = 2. * math.pi * freq
    echantillons = []
    for i in range(n):
        # petite enveloppe pour eviter les claquements
        env = min(1., i / attaque, (n - i) / attaque)
        v = 0. if freq <= 0. else volume * env * math.sin(deux_pi_f * i / _taux)
        echantillons.append(int(v * 32000.))
    _tampon.extend(struct.pack("<%dh" % n, *echantillons))
    _duree_tampon += n / _taux


def _ajouter_silence(duree):
    global _duree_tampon
    n = int(duree * _taux)
    _tampon.extend(b"\0\0" * n)
    _duree_tampon += n / _taux


def vider_sons():
    """joue les sons en attente et attend la fin du morceau"""
    global _duree_tampon
    if _tampon:
        import wave
        fd, nom = tempfile.mkstemp(prefix="lerobot", suffix=".wav")
        os.close(fd)
        with wave.open(nom, "wb") as w:
            w.setnchannels(1)
            w.setsampwidth(2)
            w.setframerate(_taux)
            w.writeframes(bytes(_tampon))
        del _tampon[:]
        d = _duree_tampon
        _duree_tampon = 0.
        _fichiers_joues.append(nom)
        _lancer_afplay(nom)
        _attendre(d)


def _attendre(d):
    """pause de d secondes, la fenetre restant vivante"""
    if Graphics.MODE_CAPTURE:
        return
    fin = time.monotonic() + d
    while True:
        reste = fin - time.monotonic()
        if reste <= 0:
            break
        if Graphics.est_ouverte():
            Graphics.synchronize()
        time.sleep(min(reste, 0.02))


Principal.avant_action = vider_sons

# programme interrompu (Ctrl-C, kill) : arreter aussi le morceau en cours
interrompu = False


def _arreter(sig, frame):
    global interrompu
    interrompu = True
    for p in _joueurs:
        try:
            p.terminate()
        except Exception:
            pass
    os._exit(1)


for _sg in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP):
    try:
        signal.signal(_sg, _arreter)
    except Exception:
        pass

# Echap pendant le dessin leve Utile.Stop : c'est une fin normale du
# programme (sans message d'erreur), pas une erreur
_defaut = sys.excepthook


def _ligne_du_programme(trace):
    """ligne du programme (et non de la bibliotheque) ou l'erreur a eu lieu"""
    import traceback
    prog = os.path.abspath(sys.argv[0]) if sys.argv and sys.argv[0] else ""
    ligne = None
    for f in traceback.extract_tb(trace):
        if os.path.abspath(f.filename) == prog:
            ligne = f.lineno
    return ligne


def _exception(type_, valeur, trace):
    global interrompu
    if issubclass(type_, (Stop, Principal.STOP)):
        interrompu = True
        try:
            Graphics.close_graph()
        except Exception:
            pass
        return
    if issubclass(type_, Principal.Range_error):
        # sortie du cadre : la fenetre reste ouverte (le dessin montre ou le
        # robot s'est arrete), comme dans la version OCaml
        l = _ligne_du_programme(trace)
        import noms
        sys.stderr.write("Error%s: the robot would leave the frame (%s)\n" % (
            " line %d of %s" % (l, os.path.basename(sys.argv[0])) if l else "",
            noms.ANGLAIS.get(str(valeur), valeur)))
        return
    if issubclass(type_, RecursionError):
        l = _ligne_du_programme(trace)
        sys.stderr.write("Error%s: endless recursion (stack full)\n" % (
            " line %d of %s" % (l, os.path.basename(sys.argv[0])) if l else ""))
        return
    interrompu = True
    _defaut(type_, valeur, trace)


sys.excepthook = _exception


def _jouer_son(freq, duree, volume):
    if duree > 0.:
        if afplay:
            _ajouter_son(freq, duree, volume)
        else:
            _attendre(duree)


def delai(secondes):
    """pause (une pause entre deux notes fait partie du morceau)"""
    if secondes > 0.:
        if _tampon:
            _ajouter_silence(secondes)
        else:
            _attendre(secondes)


def bip():
    """signal sonore court (il sonne tout de suite)"""
    _jouer_son(880., 0.12, 0.5)
    vider_sons()


def biiip():
    """signal sonore long"""
    _jouer_son(880., 0.4, 0.5)
    vider_sons()


def lireCar():
    """lecture d'un caractere dans la fenetre du robot ('0' pour un clic) ;
    les notes en attente sont jouees d'abord. Un clic ne compte que si le
    bouton s'enfonce pendant l'attente."""
    vider_sons()
    enfonce_au_debut = Graphics.button_down()
    allume = True
    n = 0
    while True:
        Dessin.show_ret(allume)
        if Graphics.key_pressed():
            return Graphics.read_key()
        b = Graphics.button_down()
        if b and not enfonce_au_debut:
            while Graphics.button_down():
                Graphics.synchronize()
                time.sleep(0.01)
            return "0"
        if not b:
            enfonce_au_debut = False
        Graphics.attente_vide()
        Graphics.synchronize()
        time.sleep(0.01)
        if n == 30:
            n = 0
            allume = not allume
        else:
            n += 1

# ---------------------------------------------------------------------------
# Musique (Robot3) : note (hauteur, duree)
# hauteur : demi-tons comptes a partir du do du milieu du piano
# duree   : en temps (noire = 1)


# hauteurs
d0 = do0 = ut = 0
re = 2
mi = 4
fa = 5
sol = 7
la = 9
si = 11
octave = 12
diese = 1
bemol = -1
becarre = 0

# durees des notes
ronde = 4.
blanche = 2.
noire = 1.
croche = 0.5
double_croche = 0.25
triple_croche = 0.125
ronde_pointee = 6.
blanche_pointee = 3.
noire_pointee = 1.5
croche_pointee = 0.75
double_croche_pointee = 0.375
noire_en_triolet = 2. / 3.
croche_en_triolet = 1. / 3.
blanche_en_triolet = 4. / 3.

# durees des silences
pause = 4.
demi_pause = 2.
soupir = 1.
demi_soupir = 0.5
quart_de_soupir = 0.25
huitieme_de_soupir = 0.125
soupir_pointe = 1.5
demi_soupir_pointe = 0.75
demi_pause_pointee = 3.

# mouvements : nombre de noires par minute
largo = 50
larghetto = 60
lento = 56
adagio = 70
andante = 85
andantino = 95
moderato = 110
allegretto = 115
allegro = 130
vivace = 150
presto = 175
prestissimo = 200

# nuances : volume de 1 a 9
pianississimo = 1
pianissimo = 2
piano = 3
mezza_voce = 4
mezzo_piano = 4
mezzo_forte = 6
forte = 7
fortissimo = 8
fortississimo = 9

_tempo = 100
_volume = 0.6


def metronome(n):
    global _tempo
    if n > 0:
        _tempo = n


def nuance(n):
    global _volume
    _volume = max(1, min(9, n)) / 10.


def _duree_temps(d):
    return d * 60. / _tempo


def note(hauteur, duree):
    freq = 261.6256 * (2. ** (hauteur / 12.))
    d = _duree_temps(duree)
    # note legerement detachee
    _jouer_son(freq, d * 0.9, _volume)
    if afplay:
        _ajouter_silence(d * 0.1)
    else:
        _attendre(d * 0.1)


def silence(duree):
    if afplay:
        _ajouter_silence(_duree_temps(duree))
    else:
        _attendre(_duree_temps(duree))

# ---------------------------------------------------------------------------
# Ecriture de texte a la position du robot


normal, gras, italique, souligne, contour, ombre, condense, etendu = \
    0, 1, 2, 4, 8, 16, 32, 64

_style = normal


def styleTexte(s):
    """sans effet"""
    global _style
    _style = s


_police = "courier"


def policeTexte(p):
    """sans effet"""
    global _police
    _police = p


def valPoliceTexte():
    return _police


courier = "courier"
geneva = "geneva"
monaco = "monaco"
chicago = "chicago"
newYork = "new york"
times = "times"
helvetica = "helvetica"


def ecrire(s):
    """Le texte part de la position du robot ; si le robot regarde vers
    l'ouest (on ecrit a gauche d'un point : pw; lc; av; ecrire ...), il est
    aligne a droite et finit a la position du robot."""
    s = str(s)
    Principal.wait()

    def faire():
        x = Robot.pixel(Robot.valX())
        y = Robot.pixel(Robot.valY())
        if Robot.valOrientation() == ouest:
            x = x - Graphics.text_size(s)[0]
        Principal.draw(False)
        (cx, cy) = Graphics.current_point()
        Graphics.moveto(x, y)
        Graphics.draw_string(s)
        Graphics.moveto(cx, cy)
        Principal.draw(True)
    LeRobot._enreg(faire)


message = Ecriture.message

# ---------------------------------------------------------------------------
# Lectures (readln, lireEntier, ...) : sur le Macintosh, la question et la
# reponse etaient dans la fenetre texte de Pascal. Ici la question (le texte
# ecrit par write sur la ligne en cours) s'affiche aussi dans la barre du bas
# de la fenetre du robot, et la reponse peut etre tapee dans cette fenetre
# (Entree pour valider, retour arriere pour corriger) ou dans le terminal :
# la premiere des deux est prise.

_ligne_en_cours = []

# False : rien n'est ecrit dans le terminal (programme dont tout le dialogue
# est dans la fenetre du robot)
sortie_terminal = True


def sortieTerminal(b):
    global sortie_terminal
    sortie_terminal = b


# lignes ecrites depuis la derniere lecture : elles s'affichent avec la
# question dans la barre du bas
_lignes_ecrites = []


def write(*textes):
    """ecrit les textes (ou nombres) dans le terminal, sans aller a la ligne"""
    for t in textes:
        t = str(t)
        if sortie_terminal:
            sys.stdout.write(t)
        _ligne_en_cours.append(t)
    if sortie_terminal:
        sys.stdout.flush()


def writeln(*textes):
    """ecrit les textes (ou nombres) dans le terminal, puis va a la ligne"""
    textes = [str(t) for t in textes]
    if sortie_terminal:
        print("".join(textes), flush=True)
    _ligne_en_cours.extend(textes)
    if _ligne_en_cours:
        _lignes_ecrites.insert(0, "".join(_ligne_en_cours))
    del _ligne_en_cours[:]


_entree_fermee = False


def _fenetre_ouverte():
    return Graphics.est_ouverte()


def _lire_terminal():
    try:
        l = sys.stdin.readline()
    except Exception:
        l = ""
    if l == "":
        raise EOFError
    return l.rstrip("\n")


def _lire_ligne():
    global _entree_fermee
    vider_sons()
    if not _fenetre_ouverte():
        try:
            return _lire_terminal()
        except EOFError:
            sys.exit(0)
    # au plus les deux dernieres lignes ecrites, puis la question
    dernieres = _lignes_ecrites[:2]
    invite = " ".join(list(reversed(dernieres)) + ["".join(_ligne_en_cours)])
    tape = []
    while True:
        message(invite + "".join(tape) + "_")
        touche = None
        while True:
            if Graphics.key_pressed():
                touche = Graphics.read_key()
                break
            if not _entree_fermee:
                try:
                    pret = select.select([sys.stdin], [], [], 0.02)[0]
                except (OSError, ValueError):
                    pret = []
                    _entree_fermee = True
                if pret:
                    try:
                        l = _lire_terminal()
                    except EOFError:
                        _entree_fermee = True
                        continue
                    _fin_lecture()
                    return l
            else:
                Graphics.attente_vide()
                time.sleep(0.02)
            Graphics.synchronize()
        if touche in ("\r", "\n", "\x03"):
            l = "".join(tape)
            if sortie_terminal:
                print(l, flush=True)
            _fin_lecture()
            return l
        if touche in ("\b", "\x7f"):
            if tape:
                tape.pop()
        elif ord(touche[0]) >= 32:
            tape.append(touche)


def _fin_lecture():
    del _ligne_en_cours[:]
    del _lignes_ecrites[:]
    message("")


def readln():
    """attend que l'on tape Entree"""
    _lire_ligne()


def _chiffres_azerty(s):
    """les touches de la rangee du haut d'un clavier AZERTY (sans
    majuscule) valent les chiffres"""
    table = {"&": "1", "\xe9": "2", '"': "3", "'": "4", "(": "5",
             "\xa7": "6", "\xe8": "7", "!": "8", "\xe7": "9", "\xe0": "0"}
    return "".join(table.get(c, c) for c in s)


def lireEntier():
    while True:
        try:
            return int(_chiffres_azerty(_lire_ligne()).strip())
        except ValueError:
            write("Enter an integer: ")


def lireReel():
    while True:
        try:
            return float(_chiffres_azerty(_lire_ligne()).strip())
        except ValueError:
            write("Enter a number: ")


def lireChaine():
    return _lire_ligne()


def lireCaractere():
    s = _lire_ligne()
    return "\r" if s == "" else s[0]

# ---------------------------------------------------------------------------
# Entrees-sorties de Pascal (fenetre texte) : le terminal


def modeTexte():
    sys.stdout.flush()


def modeDessin():
    pass


def effacerTexte():
    sys.stdout.write("\x1b[2J\x1b[H")
    sys.stdout.flush()


def ecranNoirEtBlanc():
    return False

# ---------------------------------------------------------------------------
# Interaction (Robot3)
# x, y, c = interactionTP (coordonnees, pivotements, dessin, finsouris, sauver)
# Le robot suit la souris case par case (ou se deplace d'un carreau avec les
# touches fleches) ; l'interaction se termine par un
# clic (si finsouris), par la touche Entree ou par toute touche qui n'est pas
# une commande du robot. On obtient la translation totale du robot (en
# carreaux de grille) et le dernier caractere frappe.


def interactionTP(coordonnees, pivotements, dessin, finsouris, sauver):
    tx = 0
    ty = 0
    vitesse = valVt()
    vt(10)
    ancien = Principal.coord
    Principal.coord = coordonnees
    Principal.draw(False); Principal.draw(True)
    c = " "
    # touches de l'edition anglaise : r/l huitieme de tour, f avance,
    # d/u crayon baisse/leve
    commandes = {"r": phtd, "+": pqtd, "l": phtg, "-": pqtg}
    if pivotements and dessin:
        commandes.update({"f": av, ")": vd, "(": vg, "u": lc, "d": bc,
                          "p": dp, "c": dc, ".": dg})
    elif not pivotements:
        commandes = {}
    fleches = {Graphics.FLECHE_GAUCHE: (-1, 0), Graphics.FLECHE_DROITE: (1, 0),
               Graphics.FLECHE_HAUT: (0, 1), Graphics.FLECHE_BAS: (0, -1)}
    fin = False
    while not fin:
        rxp = Robot.valX() + Grille.valLgX() / 2.
        ryp = Robot.valY() + Grille.valLgY() / 2.
        rxn = Robot.valX() - Grille.valLgX() / 2.
        ryn = Robot.valY() - Grille.valLgY() / 2.
        e = Graphics.wait_next_event([Graphics.Mouse_motion, Graphics.Key_pressed,
                                      Graphics.Button_down])
        if e.keypressed and e.key in fleches:
            # les fleches deplacent le robot d'un carreau
            (dx, dy) = fleches[e.key]
            try:
                translater(dx, dy)
                tx += dx
                ty += dy
            except Principal.Range_error:
                Son.bipbip()            # le robot proteste
        elif e.keypressed:
            c = e.key
            if c in ("\r", "\n", "\x1b"):
                fin = True
            elif c in commandes:
                commandes[c]()
            else:
                # toute autre touche termine l'interaction et est rendue
                # (Addition_A_Completer : on designe une case et on tape le
                # chiffre)
                fin = True
        elif e.button and finsouris:
            # attendre que le bouton soit relache
            while Graphics.button_down():
                Graphics.synchronize()
                time.sleep(0.01)
            fin = True
        else:
            mx, my = e.mouse_x, e.mouse_y
            dx = 1 if mx > rxp else (-1 if mx < rxn else 0)
            dy = 1 if my > ryp else (-1 if my < ryn else 0)
            if dx != 0 or dy != 0:
                try:
                    translater(dx, dy)
                    tx += dx
                    ty += dy
                except Principal.Range_error:
                    Son.bipbip()        # le robot proteste
    Principal.coord = ancien
    Principal.draw(False); Principal.draw(True)
    vt(vitesse)
    return (tx, ty, c)

# ---------------------------------------------------------------------------
# Ensembles de caracteres (set of char)


def intervalle(a, b):
    """les caracteres de a a b"""
    return [chr(i) for i in range(ord(a), ord(b) + 1)]

# ---------------------------------------------------------------------------
# Deplacements absolus dans le repere cartesien de la grille, avec des
# coordonnees reelles (Deplacer et Tracer de Turbo Pascal) :
#   deplacerReel (x, y)  place le robot au point (x, y) sans tracer,
#   tracerReel (x, y)    l'y amene en tracant si le crayon est baisse.
# (le tracer de LeRobot prend des coordonnees en pixels)


def _point_reel(x, y):
    return (float(Graph.centrex) + x * Grille.valLgX(),
            float(Graph.centrey) + y * Grille.valLgY())


def _aller(trace, x, y=None):
    if y is None:
        (x, y) = x
    Principal.wait()

    def faire():
        (a, b) = _point_reel(x, y)
        Principal.draw(False)
        Graphics.moveto(Robot.pixel(Robot.valX()), Robot.pixel(Robot.valY()))
        Graphics.set_line_width(Robot.valEc())
        if trace and Robot.valBc():
            Principal.trait(Robot.pixel(a), Robot.pixel(b))
        else:
            Graphics.moveto(Robot.pixel(a), Robot.pixel(b))
        Robot.r_ce(a, b)
        Principal.draw(True)
    LeRobot._enreg(faire)


def deplacerReel(x, y=None):
    _aller(False, x, y)


def tracerReel(x, y=None):
    _aller(True, x, y)


def rt(t):
    """rt (Turbo Pascal) : le robot tourne de t degres (sens direct) en
    gardant la longueur de son pas : lgY s'il regarde au nord ou au sud, lgX
    a l'est ou a l'ouest, la diagonale du carreau sinon. (Le rt de LeRobot
    prend toujours la diagonale, sqrt 2 fois trop longue apres lg l.) En
    arrivant sur une direction cardinale, le pas dans cette direction est
    aussi garde (grille carree de cote r)."""
    o = valOrientation()
    if o % 4 == 0:
        r = valLgY()
    elif o % 2 == 0:
        r = valLgX()
    else:
        r = valLgR()
    if r < 1e-6:
        LeRobot.rt(t)
        return
    lt = valLgT()
    a0 = [90., lt, 0., 360. - lt, 270., 180. + lt, 180., 180. - lt][o]
    a = math.fmod(a0 + t, 360.)
    if a < 0.:
        a += 360.
    if 360. - a < 1e-9:
        a = 0.

    def proche(x):
        return abs(a - x) < 1e-9
    if proche(0.):
        lg(r); pe()
    elif proche(90.):
        lg(r); pn()
    elif proche(180.):
        lg(r); pw()
    elif proche(270.):
        lg(r); ps()
    elif a < 90.:
        lgRT(r, a); pne()
    elif a < 180.:
        lgRT(r, 180. - a); pnw()
    elif a < 270.:
        lgRT(r, a - 180.); psw()
    else:
        lgRT(r, 360. - a); pse()


def dp():
    """dessine un point : le crayon du Macintosh est un carre, dp trace un
    carre de cote ec ; avec le crayon normal (ec 1), un pixel ; avec ec 2,
    un disque un peu plus gros que le carre, pour que le point du Morse se
    voie (CodeMorse1)."""
    Principal.wait()

    def faire():
        Principal.draw(False)
        x = Robot.pixel(Robot.valX())
        y = Robot.pixel(Robot.valY())
        e = Robot.valEc()
        if e <= 1:
            Graphics.plot(x, y)
        elif e == 2:
            Graphics.fill_circle(x, y, 3)
        else:
            Graphics.fill_rect(x - e // 2, y - e // 2, e, e)
        Principal.draw(True)
    LeRobot._enreg(faire)

# ---------------------------------------------------------------------------
# Capture (verification) : LEROBOT_CAPTURE=fichier.png enregistre le dessin
# a la fin (st, ou fin du programme) puis termine le programme.


def _capturer():
    f = os.environ.get("LEROBOT_CAPTURE")
    if f and Graphics.est_ouverte():
        Graphics.synchronize()
        Graphics.sauver_png(f)
        return True
    return False

# ---------------------------------------------------------------------------
# Fin de programme : un programme qui se termine sans st (par exemple apres
# une chanson) laisserait la fenetre se fermer aussitot ; on attend qu'une
# touche soit frappee ou que l'on clique.
#
# Mode verification (verifier.sh) : la variable LEROBOT_VERIFIER donne le
# fichier des remarques. A la fin du dessin (st, ou fin du programme) on
# repond dans la fenetre du robot :
#   Entree        correct                  (code de sortie 0)
#   r             relancer le programme    (code 11)
#   q ou Echap    arreter la verification  (code 12)
#   autre touche  debut d'une remarque, terminee par Entree, notee dans le
#                 fichier                  (code 10)

_verifie = False


def _fin(code):
    try:
        Graphics.close_graph()
    except Exception:
        pass
    sys.stdout.flush()
    os._exit(code)


def _verifier(fichier):
    global _verifie
    _verifie = True
    Ecriture.message("Return: correct   r: run again   q: quit   other key: remark")

    def touche():
        return Graphics.wait_next_event([Graphics.Key_pressed]).key
    c = touche()
    if c in ("\r", "\n"):
        _fin(0)
    if c == "r":
        _fin(11)
    if c in ("q", "\x1b"):
        _fin(12)
    rem = []
    while True:
        if c in ("\b", "\x7f"):
            if rem:
                rem.pop()
        elif ord(c[0]) >= 32:
            rem.append(c)
        Ecriture.message("Remark (Return to finish, Esc to cancel): " + "".join(rem))
        c = touche()
        if c in ("\r", "\n"):
            break
        if c == "\x1b":
            rem = []
            break
    if not rem:
        _verifie = False            # remarque annulee : on redemande
        return
    nom = os.environ.get("LEROBOT_PROGRAMME", sys.argv[0])
    with open(fichier, "a", encoding="utf-8") as f:
        f.write(nom + " : " + "".join(rem) + "\n")
    _fin(10)


def st():
    """fin du programme (voir LeRobot.st)"""
    vider_sons()
    if _capturer():
        _fin(0)
    fichier = os.environ.get("LEROBOT_VERIFIER")
    if fichier:
        Principal.wait()
        while True:
            _verifier(fichier)
    else:
        LeRobot.st()


def _a_la_fin():
    try:
        vider_sons()
    except Exception:
        pass
    if Graphics.est_ouverte() and not _verifie and not interrompu:
        try:
            if _capturer():
                _fin(0)
            if os.environ.get("LEROBOT_VERIFIER"):
                st()
            Ecriture.message("End of the program: press a key or click")
            while not (Graphics.key_pressed() or Graphics.button_down()):
                Graphics.attente_vide()
                Graphics.synchronize()
                time.sleep(0.02)
            Graphics.close_graph()
        except BaseException:
            pass
    _ramasser(True)
    for f in _fichiers_joues:
        try:
            os.remove(f)
        except OSError:
            pass


atexit.register(_a_la_fin)


def _attente_capture():
    """mode capture : le programme attend une touche qui ne viendra pas"""
    _capturer()
    _fin(3)


Graphics._sur_attente = _attente_capture

# ---------------------------------------------------------------------------
# La fenetre du robot s'ouvre des le debut du programme : un programme du
# livre commence directement par ses commandes (av (); pqtd (); ...).
init_pict()
