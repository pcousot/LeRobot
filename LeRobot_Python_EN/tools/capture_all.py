#!/usr/bin/env python3
"""Runs all the programs of the book (book/) in capture mode: hidden
window, drawing saved as a PNG at the end. Summarises the errors.

    python3 tools/capture_all.py PNG_FOLDER [filter]

The answers to the questions (readInt...) are read from
tools/answers/<Program>.txt if it exists; the keys (readChar) from
tools/answers/<Program>.touches.
"""
import os
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor

ICI = os.path.dirname(os.path.abspath(__file__))
RACINE = os.path.dirname(ICI)
PY = os.environ.get("LEROBOT_PYTHON", "/Library/Frameworks/Python.framework/Versions/3.10/bin/python3")


def lancer(p, dossier):
    nom = os.path.relpath(p, os.path.join(RACINE, "book"))[:-3].replace("/", "__")
    png = os.path.join(dossier, nom + ".png")
    base = os.path.join(ICI, "answers", os.path.basename(p)[:-3])
    env = dict(os.environ, LEROBOT_CAPTURE=png, LEROBOT_MUET="1",
               PYTHONPATH=RACINE, LEROBOT_RELANCE="1")
    if os.path.exists(base + ".touches"):
        env["LEROBOT_TOUCHES"] = open(base + ".touches").read().replace("\\r", "\r")
    entree = open(base + ".txt") if os.path.exists(base + ".txt") else subprocess.DEVNULL
    try:
        r = subprocess.run([PY, p], env=env, stdin=entree, capture_output=True,
                           text=True, timeout=120, cwd=os.path.dirname(p))
        code, err = r.returncode, r.stderr.strip().splitlines()[-3:]
    except subprocess.TimeoutExpired:
        code, err = "timeout", []
    return (nom, code, err, os.path.exists(png))


def main():
    dossier = sys.argv[1]
    filtre = sys.argv[2] if len(sys.argv) > 2 else ""
    os.makedirs(dossier, exist_ok=True)
    progs = []
    for d, _, fs in sorted(os.walk(os.path.join(RACINE, "book"))):
        for f in sorted(fs):
            if f.endswith(".py") and filtre in os.path.join(d, f):
                progs.append(os.path.join(d, f))
    with ThreadPoolExecutor(6) as ex:
        res = list(ex.map(lambda p: lancer(p, dossier), progs))
    for nom, code, err, png in res:
        if code not in (0, 3) or not png:
            print("%-55s code=%s png=%s %s" % (nom, code, png, " | ".join(err)))
    attente = [nom for nom, code, _, _ in res if code == 3]
    print("%d programs, %d ok, %d waiting for a key: %s" % (
        len(res), sum(1 for r in res if r[1] == 0), len(attente), " ".join(attente)))


main()
