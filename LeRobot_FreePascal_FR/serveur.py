#!/usr/bin/env python3
"""serveur.py -- le robot pour les programmes Pascal compiles par Free Pascal.

    python3 serveur.py ./Programme [arguments...]

Lance le programme Pascal (compile avec les unites de unites/) en lui
ouvrant deux tuyaux : il ecrit ses commandes sur son descripteur 3 et lit les
reponses sur son descripteur 4. Son entree et sa sortie standard restent
celles du terminal (write, writeln, readln). Chaque commande est executee par
la bibliotheque LeRobot_Python_FR (fenetre tkinter), qui garde le meme
comportement que les versions Python et OCaml : grille, crayon carre,
peinture, sons, st (), Echap, bip-bip au bord du cadre.

Format : une ligne par commande, "nom<TAB>arg1<TAB>arg2..." ; la reponse
est "ok" pour une procedure, la valeur pour une fonction (booleens 0/1,
caracteres par leur code), ou "stop" quand le programme doit s'arreter
(Echap, fenetre fermee, sortie du cadre).
"""
import os
import select
import subprocess
import sys

ICI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(os.path.dirname(ICI), "LeRobot_Python_FR"))

if len(sys.argv) < 2:
    sys.stderr.write("usage : serveur.py ./Programme\n")
    sys.exit(2)

# les tuyaux sont crees AVANT d'importer la bibliotheque, qui peut relancer
# l'interpreteur Python (Tk 8.6) : os.execv garde les descripteurs ouverts
if os.environ.get("LEROBOT_TUYAUX"):
    cmd_r, rep_w = map(int, os.environ["LEROBOT_TUYAUX"].split(","))
    enfant = None
else:
    cmd_r, cmd_w = os.pipe()        # programme -> serveur
    rep_r, rep_w = os.pipe()        # serveur -> programme
    # le programme recoit les tuyaux sur ses descripteurs 3 et 4
    def preparer():
        os.dup2(cmd_w, 3)
        os.dup2(rep_r, 4)
    enfant = subprocess.Popen(sys.argv[1:], preexec_fn=preparer, close_fds=False)
    os.close(cmd_w)
    os.close(rep_r)
    for fd in (cmd_r, rep_w):
        os.set_inheritable(fd, True)
    os.environ["LEROBOT_TUYAUX"] = "%d,%d" % (cmd_r, rep_w)
    os.environ["LEROBOT_ENFANT"] = str(enfant.pid)

import Graphics                     # noqa: E402  (peut relancer Python)
import LibRobot                     # noqa: E402  (ouvre la fenetre)
import Principal                    # noqa: E402
from Utile import Stop              # noqa: E402

if enfant is None and os.environ.get("LEROBOT_ENFANT"):
    pid_enfant = int(os.environ["LEROBOT_ENFANT"])
else:
    pid_enfant = enfant.pid if enfant else None

nom_programme = os.path.basename(sys.argv[1])
if not os.environ.get("LEROBOT_PROGRAMME"):
    Graphics.set_window_title(nom_programme)

entree = os.fdopen(cmd_r, "rb", buffering=0)
sortie = os.fdopen(rep_w, "wb", buffering=0)
tampon = b""


def lire_ligne():
    """ligne suivante du programme Pascal, None a la fin ; la fenetre reste
    vivante pendant l'attente"""
    global tampon
    while b"\n" not in tampon:
        prets = select.select([entree], [], [], 0.02)[0]
        if prets:
            morceau = os.read(cmd_r, 65536)
            if not morceau:
                return None
            tampon += morceau
        elif Graphics.est_ouverte():
            Graphics.synchronize()
    ligne, tampon = tampon.split(b"\n", 1)
    return ligne.decode("utf-8", "replace").rstrip("\r")


def repondre(texte):
    try:
        sortie.write((texte + "\n").encode("utf-8"))
    except (BrokenPipeError, OSError):
        pass


def arg(texte):
    """argument : entier, reel, booleen ou chaine (d'apres la forme)"""
    t = texte.strip()
    try:
        return int(t)
    except ValueError:
        pass
    try:
        return float(t)
    except ValueError:
        return texte


def valeur(v):
    if isinstance(v, bool):
        return "1" if v else "0"
    if isinstance(v, tuple):
        return "\t".join(valeur(x) for x in v)
    if isinstance(v, str) and len(v) == 1 and nom_courant in ("lireCar", "interactionTP"):
        return str(ord(v))
    if isinstance(v, float) and v == int(v) and nom_courant in ("tickCount", "random"):
        return str(int(v))
    return "" if v is None else str(v)


# ---------------------------------------------------------------------------
# Dessiner : interaction(..., sauver = true) est le dessin interactif complet
# de LeRobot_Python_FR (Dessiner.py : couleurs, peinture, retour arriere pour
# annuler) ; a la fin (Entree), le dessin peut etre sauve dans le programme
# Pascal Dessin_du_Robot.p (comme en 1991), a cote du programme, ou dans
# LeRobot_FreePascal_FR pour le Dessiner du livre (comme mon_dessin.py).

FICHIER_DESSIN = "Dessin_du_Robot.p"
if os.path.abspath(os.getcwd()).startswith(os.path.join(ICI, "livre")):
    FICHIER_DESSIN = os.path.join(ICI, FICHIER_DESSIN)


def texte_dessin_pascal():
    """le programme Pascal du dessin : les commandes, plusieurs par ligne ;
    un changement de couleur (cc avec le nom en commentaire) finit la ligne"""
    lignes = []
    ligne = ""
    for s in reversed(Principal.str_commandes):
        com = ""
        if "#" in s:
            s, com = s.split("#", 1)
            com = " { %s }" % com.strip()
        s = s.strip()
        if s.endswith("()"):
            s = s[:-2]
        if ligne and len(ligne) + len(s) > 70:
            lignes.append(ligne)
            ligne = ""
        ligne = ligne + " " + s + ";" if ligne else s + ";"
        if com:
            lignes.append(ligne + com)
            ligne = ""
    if ligne:
        lignes.append(ligne)
    return ("{$mode macpas}\n"
            "program Dessin_du_Robot;\n"
            " uses Robot1, Robot2;\n"
            " { Mon joli dessin, engendre par Dessiner }\n"
            "begin\n"
            " ce;\n"
            + "".join(" " + l + "\n" for l in lignes)
            + "end.\n")


def dessiner(coordonnees, pivotements, dessin, finsouris, sauver):
    import Interaction
    Principal.fichier_dessin = FICHIER_DESSIN
    Principal.texte_dessin = texte_dessin_pascal
    avant = os.path.getmtime(FICHIER_DESSIN) if os.path.exists(FICHIER_DESSIN) else None
    Interaction.interaction(coordonnees, pivotements, dessin, finsouris, sauver)
    if os.path.exists(FICHIER_DESSIN) and os.path.getmtime(FICHIER_DESSIN) != avant:
        print("Dessin sauve dans %s : ./robot.sh %s pour le reproduire."
              % (os.path.abspath(FICHIER_DESSIN), os.path.abspath(FICHIER_DESSIN)),
              flush=True)


# commandes dont les arguments sont des chaines (pas de conversion)
CHAINES = {"message", "ecrire", "policeTexte"}
nom_courant = ""


def executer(ligne):
    global nom_courant
    champs = ligne.split("\t")
    nom = champs[0]
    nom_courant = nom
    f = getattr(LibRobot, nom, None)
    if f is None or not callable(f):
        sys.stderr.write("serveur du robot : commande inconnue %r\n" % nom)
        return "ok"
    args = champs[1:] if nom in CHAINES else [arg(a) for a in champs[1:]]
    if nom == "interactionTP":
        args = [bool(a) for a in args]
        if args[2] and args[4]:     # dessin et sauvegarde : Dessiner
            dessiner(*args)
            raise Principal.STOP    # la fenetre est fermee : fin du programme
    r = f(*args)
    if r is None:
        return "ok"
    if nom == "interactionTP":
        x, y, c = r
        return "%d\t%d\t%d" % (x, y, ord(c) if c else 0)
    return valeur(r)


def arreter_enfant():
    if pid_enfant:
        try:
            os.kill(pid_enfant, 15)
        except OSError:
            pass


while True:
    ligne = lire_ligne()
    if ligne is None:               # le programme Pascal est fini
        break
    try:
        repondre(executer(ligne))
    except (Stop, Principal.STOP):  # Echap pendant le dessin
        repondre("stop")
        arreter_enfant()
        LibRobot.interrompu = True
        try:
            Graphics.close_graph()
        except Exception:
            pass
        break
    except Principal.Range_error as e:
        # sortie du cadre : le programme s'arrete, la fenetre reste ouverte
        sys.stderr.write("Erreur : le robot sortirait du cadre (%s)\n" % e)
        repondre("stop")
        arreter_enfant()
        break
    except SystemExit:              # fenetre fermee
        repondre("stop")
        arreter_enfant()
        raise

# attendre la fin du programme Pascal (il ecrit peut-etre encore dans le
# terminal) ; la fin du programme Python (LibRobot) attend une touche si la
# fenetre est encore ouverte
if enfant is not None:
    enfant.wait()
elif pid_enfant:
    try:
        os.waitpid(pid_enfant, 0)
    except ChildProcessError:
        pass
