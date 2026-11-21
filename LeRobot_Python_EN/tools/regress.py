#!/usr/bin/env python3
"""regress.py -- checks that the programs of the book still draw the same.

The drawings are the specification: a program of `book/` is correct when
its drawing is the one it has always made. This runs the programs with a
hidden window (as `capture_all.py` does), saves each drawing as a PNG,
and compares it, pixel for pixel, with the reference kept in
`tools/reference/`.

    python3 tools/regress.py                 # check every program
    python3 tools/regress.py 20_polar_grid   # check one chapter
    python3 tools/regress.py --update        # record the references
    python3 tools/regress.py --diffs DIR     # write the drawings that differ

`check.sh` shows the drawings one by one, for a person to look at;
this says, without anyone watching, whether any of them moved.

`--update` is how a deliberate change is accepted: look at the new
drawing first (`--diffs`), then record it, so that the change appears in
the repository as a changed PNG.

Answers to the questions a program asks come from `tools/answers/`, as in
`capture_all.py`. Programs that cannot draw the same twice are listed in
VARIABLES below, with the reason.

Needs nothing that is not in Python: the PNGs are read and written here.
"""
import os
import subprocess
import sys
import zlib
from concurrent.futures import ThreadPoolExecutor

ICI = os.path.dirname(os.path.abspath(__file__))
RACINE = os.path.dirname(ICI)
LIVRE = os.path.join(RACINE, "book")
REFERENCE = os.path.join(ICI, "reference")
PY = os.environ.get("LEROBOT_PYTHON", sys.executable)

# Le tirage au sort est fixe, pour que les programmes qui s'en servent
# redessinent la meme chose (LibRobot : LEROBOT_SEED).
GRAINE = "1991"

# Programmes qui ne peuvent pas redessiner la meme chose, et pourquoi.
VARIABLES = {
    "tutorials_and_games/DigitalClock":
        "montre l'heure qu'il est",
    "17_while/Loop1":
        "ne se termine pas",
    "17_while/Loop2":
        "ne se termine pas",
    "04_writing_running/WrongPaperHen":
        "a une erreur volontaire (le livre la fait lire) : pas de dessin",
}

# ---------------------------------------------------------------------------
# PNG : lecture et ecriture, sans bibliotheque exterieure.

def lire_png(chemin):
    """(largeur, hauteur, pixels RVB) d'un PNG ecrit par Graphics.py."""
    with open(chemin, "rb") as f:
        donnees = f.read()
    if donnees[:8] != b"\x89PNG\r\n\x1a\n":
        raise ValueError("%s n'est pas un PNG" % chemin)
    largeur = hauteur = None
    compresse = b""
    i = 8
    while i < len(donnees):
        taille = int.from_bytes(donnees[i:i + 4], "big")
        nom = donnees[i + 4:i + 8]
        corps = donnees[i + 8:i + 8 + taille]
        if nom == b"IHDR":
            largeur = int.from_bytes(corps[0:4], "big")
            hauteur = int.from_bytes(corps[4:8], "big")
            profondeur, couleur = corps[8], corps[9]
            if (profondeur, couleur) != (8, 2):
                raise ValueError("%s : PNG non gere (%d bits, type %d)"
                                 % (chemin, profondeur, couleur))
        elif nom == b"IDAT":
            compresse += corps
        elif nom == b"IEND":
            break
        i += 12 + taille
    return largeur, hauteur, _defiltrer(zlib.decompress(compresse), largeur, hauteur)


def _defiltrer(brut, largeur, hauteur):
    """Annule les filtres par ligne du PNG (les cinq types)."""
    ligne_octets = largeur * 3
    sortie = bytearray(ligne_octets * hauteur)
    precedente = bytearray(ligne_octets)
    i = 0
    for y in range(hauteur):
        filtre = brut[i]
        i += 1
        courante = bytearray(brut[i:i + ligne_octets])
        i += ligne_octets
        if filtre == 1:      # Sub
            for x in range(3, ligne_octets):
                courante[x] = (courante[x] + courante[x - 3]) & 0xFF
        elif filtre == 2:    # Up
            for x in range(ligne_octets):
                courante[x] = (courante[x] + precedente[x]) & 0xFF
        elif filtre == 3:    # Average
            for x in range(ligne_octets):
                a = courante[x - 3] if x >= 3 else 0
                courante[x] = (courante[x] + ((a + precedente[x]) >> 1)) & 0xFF
        elif filtre == 4:    # Paeth
            for x in range(ligne_octets):
                a = courante[x - 3] if x >= 3 else 0
                b = precedente[x]
                c = precedente[x - 3] if x >= 3 else 0
                p = a + b - c
                pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
                pred = a if (pa <= pb and pa <= pc) else (b if pb <= pc else c)
                courante[x] = (courante[x] + pred) & 0xFF
        elif filtre != 0:
            raise ValueError("filtre PNG inconnu : %d" % filtre)
        sortie[y * ligne_octets:(y + 1) * ligne_octets] = courante
        precedente = courante
    return bytes(sortie)


def ecrire_png(chemin, largeur, hauteur, pixels):
    """Ecrit un PNG RVB, comme Graphics.sauver_png."""
    brut = b"".join(b"\0" + pixels[y * largeur * 3:(y + 1) * largeur * 3]
                    for y in range(hauteur))

    def bloc(nom, corps):
        return (len(corps).to_bytes(4, "big") + nom + corps
                + zlib.crc32(nom + corps).to_bytes(4, "big"))

    entete = (largeur.to_bytes(4, "big") + hauteur.to_bytes(4, "big")
              + bytes((8, 2, 0, 0, 0)))
    with open(chemin, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n" + bloc(b"IHDR", entete)
                + bloc(b"IDAT", zlib.compress(brut, 9)) + bloc(b"IEND", b""))


def comparer(attendu, obtenu, chemin_diff=None):
    """Nombre de pixels qui different, et ou. None si les tailles different."""
    la, ha, pa = lire_png(attendu)
    lb, hb, pb = lire_png(obtenu)
    if (la, ha) != (lb, hb):
        return None, "taille %dx%d au lieu de %dx%d" % (lb, hb, la, ha)
    differents = [i // 3 for i in range(0, len(pa), 3)
                  if pa[i:i + 3] != pb[i:i + 3]]
    if differents and chemin_diff:
        # le dessin obtenu, les pixels qui ont bouge en rouge
        marque = bytearray(pb)
        for n in differents:
            marque[n * 3:n * 3 + 3] = b"\xff\x00\x00"
        ecrire_png(chemin_diff, lb, hb, bytes(marque))
    if not differents:
        return 0, ""
    xs = [n % la for n in differents]
    ys = [n // la for n in differents]
    ou = "x %d-%d, y %d-%d" % (min(xs), max(xs), min(ys), max(ys))
    return len(differents), ou


# ---------------------------------------------------------------------------
# Lancer les programmes.

def programmes(filtre=""):
    trouves = []
    for d, _, fs in sorted(os.walk(LIVRE)):
        for f in sorted(fs):
            if f.endswith(".py") and filtre in os.path.join(d, f):
                trouves.append(os.path.join(d, f))
    return trouves


def nom_de(chemin):
    return os.path.relpath(chemin, LIVRE)[:-3]


def dessiner(chemin, dossier):
    """Lance un programme, fenetre cachee ; rend (code, erreur, png)."""
    png = os.path.join(dossier, nom_de(chemin).replace("/", "__") + ".png")
    os.makedirs(os.path.dirname(png), exist_ok=True)
    base = os.path.join(ICI, "answers", os.path.basename(chemin)[:-3])
    env = dict(os.environ, LEROBOT_CAPTURE=png, LEROBOT_MUET="1",
               LEROBOT_SEED=GRAINE, PYTHONPATH=RACINE, LEROBOT_RELANCE="1")
    if os.path.exists(base + ".touches"):
        env["LEROBOT_TOUCHES"] = open(base + ".touches").read().replace("\\r", "\r")
    entree = open(base + ".txt") if os.path.exists(base + ".txt") else subprocess.DEVNULL
    try:
        r = subprocess.run([PY, chemin], env=env, stdin=entree,
                           capture_output=True, text=True, timeout=120,
                           cwd=os.path.dirname(chemin))
        erreur = r.stderr.strip().splitlines()[-1:] or [""]
        return r.returncode, erreur[0], png
    except subprocess.TimeoutExpired:
        return "timeout", "n'a pas fini en 120 s", png
    finally:
        if entree is not subprocess.DEVNULL:
            entree.close()


# ---------------------------------------------------------------------------

def main():
    args = sys.argv[1:]
    enregistrer = "--update" in args
    if enregistrer:
        args.remove("--update")
    dossier_diffs = None
    if "--diffs" in args:
        i = args.index("--diffs")
        dossier_diffs = args[i + 1]
        del args[i:i + 2]
        os.makedirs(dossier_diffs, exist_ok=True)
    filtre = args[0] if args else ""

    dessins = os.path.join(ICI, "_dessins")
    os.makedirs(dessins, exist_ok=True)
    os.makedirs(REFERENCE, exist_ok=True)

    a_faire = [p for p in programmes(filtre) if nom_de(p) not in VARIABLES]
    sautes = [n for n in VARIABLES if filtre in n]
    if not a_faire:
        print("aucun programme ne correspond a « %s »" % filtre)
        return 1

    print("%d programmes..." % len(a_faire))
    with ThreadPoolExecutor(6) as ex:
        resultats = list(ex.map(lambda p: (p,) + dessiner(p, dessins), a_faire))

    bons = []
    changes = []
    casses = []
    nouveaux = []
    for chemin, code, erreur, png in sorted(resultats):
        nom = nom_de(chemin)
        # code 3 : le programme attend une touche qui ne viendra pas ; le
        # dessin est fini, c'est normal en mode capture.
        if code not in (0, 3) or not os.path.exists(png):
            casses.append((nom, code, erreur))
            continue
        ref = os.path.join(REFERENCE, nom.replace("/", "__") + ".png")
        if enregistrer:
            os.replace(png, ref)
            nouveaux.append(nom)
            continue
        if not os.path.exists(ref):
            nouveaux.append(nom)
            continue
        diff = os.path.join(dossier_diffs, nom.replace("/", "__") + ".png") \
            if dossier_diffs else None
        combien, ou = comparer(ref, png, diff)
        if combien:
            changes.append((nom, combien, ou))
        else:
            bons.append(nom)

    if enregistrer:
        print("%d dessins enregistres dans tools/reference/" % len(nouveaux))
        for nom, code, erreur in casses:
            print("  PAS ENREGISTRE  %-50s code=%s %s" % (nom, code, erreur))
        return 1 if casses else 0

    for nom, code, erreur in casses:
        print("  ERREUR      %-50s code=%s %s" % (nom, code, erreur))
    for nom, combien, ou in changes:
        print("  A CHANGE    %-50s %d pixels (%s)" % (nom, combien, ou))
    for nom in nouveaux:
        print("  SANS REF    %-50s (--update pour l'enregistrer)" % nom)
    for nom in sautes:
        print("  SAUTE       %-50s %s" % (nom, VARIABLES[nom]))

    print("\n%d pareils, %d changes, %d en erreur, %d sans reference, %d sautes"
          % (len(bons), len(changes), len(casses), len(nouveaux), len(sautes)))
    if changes and dossier_diffs:
        print("dessins changes, pixels bouges en rouge : %s" % dossier_diffs)
    return 1 if (changes or casses or nouveaux) else 0


if __name__ == "__main__":
    sys.exit(main())
