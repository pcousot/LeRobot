#!/usr/bin/env python3
"""Execute tous les programmes compiles (_build/bin) en mode capture :
fenetre cachee, dessin enregistre en PNG a la fin. Resume les erreurs.
    python3 outils/tout_capturer.py DOSSIER_PNG [filtre]
Reponses aux questions : ../LeRobot_Python_FR/outils/reponses/<Programme>.txt
(entree standard) et .touches (touches de la fenetre)."""
import os, subprocess, sys
from concurrent.futures import ThreadPoolExecutor
ICI = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REP = os.path.join(os.path.dirname(ICI), 'LeRobot_Python_FR', 'outils', 'reponses')
PY = os.environ.get('LEROBOT_PYTHON', '/Library/Frameworks/Python.framework/Versions/3.10/bin/python3')


def lancer(exe, dossier):
    nom = os.path.basename(exe)
    png = os.path.join(dossier, nom + '.png')
    base = os.path.join(REP, nom)
    env = dict(os.environ, LEROBOT_CAPTURE=png, LEROBOT_MUET='1', LEROBOT_RELANCE='1')
    if os.path.exists(base + '.touches'):
        env['LEROBOT_TOUCHES'] = open(base + '.touches').read().replace('\\r', '\r')
    entree = open(base + '.txt') if os.path.exists(base + '.txt') else subprocess.DEVNULL
    try:
        r = subprocess.run([PY, os.path.join(ICI, 'serveur.py'), exe], env=env, stdin=entree,
                           capture_output=True, text=True, errors='replace', timeout=120, cwd=os.path.dirname(exe))
        code, err = r.returncode, r.stderr.strip().splitlines()[-2:]
    except subprocess.TimeoutExpired:
        code, err = 'timeout', []
    return nom, code, err, os.path.exists(png)


def main():
    dossier = sys.argv[1]
    filtre = sys.argv[2] if len(sys.argv) > 2 else ''
    os.makedirs(dossier, exist_ok=True)
    exes = []
    for d, _, fs in sorted(os.walk(os.path.join(ICI, '_build', 'bin'))):
        for f in sorted(fs):
            p = os.path.join(d, f)
            if os.access(p, os.X_OK) and '.' not in f and filtre in p:
                exes.append(p)
    with ThreadPoolExecutor(6) as ex:
        res = list(ex.map(lambda p: lancer(p, dossier), exes))
    for nom, code, err, png in res:
        if code not in (0, 3) or not png:
            print('%-40s code=%s png=%s %s' % (nom, code, png, ' | '.join(err)))
    print('%d programmes, %d sans erreur' % (len(res), sum(1 for r in res if r[1] in (0, 3) and r[3])))


main()
