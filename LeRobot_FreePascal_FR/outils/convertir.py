#!/usr/bin/env python3
"""convertir.py : copie les programmes Turbo Pascal de 1991
(../../LeRobot_TurboPascal, Macintosh) dans livre/, prets pour Free Pascal :
  - encodage MacRoman -> UTF-8, fins de ligne CR -> LF ;
  - la clause uses du Macintosh (Memtypes, Quickdraw, OSIntf, ToolIntf,
    MacPrint, Sane, et les directives de segment {$S ...}) est remplacee
    par les unites du robot (Robot1, Robot2, Robot3) ;
  - {$mode macpas} (dialecte Pascal du Macintosh) en tete (sans {$codepage utf8} : les chaines restent en octets UTF-8, comme le terminal).
Les dossiers prennent les noms de ceux de LeRobot_OCaml_FR/livre (sans accents).
Les programmes de outils/manuels.txt ne sont pas ecrases.

    python3 outils/convertir.py SOURCE.p DESTINATION.p
convertit un seul programme (UTF-8 ou MacRoman) : robot.sh le fait pour un
programme qui n'a pas encore {$mode macpas} (programme d'origine)."""
import os
import re
import sys
import unicodedata

ICI = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(os.path.dirname(ICI), 'LeRobot_TurboPascal')
OCAML = os.path.join(os.path.dirname(ICI), 'LeRobot_OCaml_FR', 'livre')
DST = os.path.join(ICI, 'livre')


def sans_accents(s):
    s = unicodedata.normalize('NFD', s)
    return ''.join(c for c in s if unicodedata.category(c) != 'Mn')


def nom_dossier(rel):
    """dossier de LeRobot_OCaml_FR/livre correspondant (chapitre NN_...)"""
    parties = rel.split(os.sep)
    num = parties[0][:2]
    for d in sorted(os.listdir(OCAML)):
        if d[:2] == num:
            chap = d
            break
    else:
        chap = re.sub(r'\W+', '_', sans_accents(parties[0].strip())).strip('_')
    autres = [re.sub(r'[^\w.]+', '_', sans_accents(p.strip())).strip('_') for p in parties[1:]]
    return os.path.join(chap, *autres)


def convertir(texte):
    t = texte.replace('\r\n', '\n').replace('\r', '\n')
    m = re.search(r'\buses\b(.*?);(\s*\{\$S\})?', t, re.S | re.I)
    if m:
        unites = re.findall(r'\bRobot\d\b', m.group(1), re.I)
        uses = 'uses ' + ', '.join(unites or ['Robot1']) + ';'
        # garder les directives de segment hors de la clause
        avant = t[:m.start()]
        avant = re.sub(r'\{\$S\+?\}\s*$', '', avant)
        t = avant + uses + t[m.end():]
    # un caractere accentue affecte a une variable de type char occupe deux
    # octets en UTF-8 : l'ecrire par son code (#233 pour 'é'), comme le rend
    # lireCar (les chaines, elles, restent en UTF-8)
    t = re.sub(r"(:=\s*)'([^\x00-\x7f])'(?=\s*;)",
               lambda c: c.group(1) + '#%d' % ord(c.group(2)), t)
    # sur la premiere ligne : les numeros de ligne des erreurs restent ceux
    # du programme d'origine (et du livre)
    return '{$mode macpas} ' + t


def main():
    if not os.path.isdir(SRC):
        sys.exit("convertir.py : %s n'existe plus (livre/ est deja converti) ;\n"
                 "usage : convertir.py SOURCE.p DESTINATION.p" % SRC)
    manuels = set()
    mf = os.path.join(ICI, 'outils', 'manuels.txt')
    if os.path.exists(mf):
        manuels = {l.split('#')[0].strip() for l in open(mf) if l.split('#')[0].strip()}
    n = 0
    for d, _, fs in os.walk(SRC):
        for f in fs:
            nom = f.strip()
            # nom tronque sur le Macintosh (31 caracteres) : 'Nom.' pour 'Nom.p'
            if nom.endswith('.') and not nom.startswith('.'):
                nom += 'p'
            if not nom.endswith('.p'):
                continue
            p = os.path.join(d, f)
            rel = os.path.relpath(p, SRC)
            dossier = nom_dossier(os.path.dirname(rel))
            relq = os.path.join(dossier, nom)
            if relq[:-2] in manuels:
                continue
            q = os.path.join(DST, relq)
            os.makedirs(os.path.dirname(q), exist_ok=True)
            texte = open(p, 'rb').read().decode('mac_roman')
            with open(q, 'w', encoding='utf-8') as fq:
                fq.write(convertir(texte))
            n += 1
    print(n, 'programmes convertis')


def un_seul(src, dst):
    octets = open(src, 'rb').read()
    try:
        texte = octets.decode('utf-8')
    except UnicodeDecodeError:
        texte = octets.decode('mac_roman')
    with open(dst, 'w', encoding='utf-8') as f:
        f.write(convertir(texte))


if len(sys.argv) == 3:
    un_seul(sys.argv[1], sys.argv[2])
else:
    main()
