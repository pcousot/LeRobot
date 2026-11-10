#!/usr/bin/env python3
"""fr2en.py -- replaces, in a robot program written for the French library
(LeRobot_Python_FR), the French names of the robot's commands and constants
by their English names (table noms.NOMS). Only Python names are replaced (not
strings, comments, or attributes such as Principal.av); the program's own
names, comments and strings are left as they are.

    python3 outils/fr2en.py Programme.py [> Program.py]

Prints a warning on stderr when the program defines a name that is also an
English command name (it would hide that command).
"""
import io
import os
import sys
import tokenize

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from noms import NOMS  # noqa: E402

ANGLAIS = set(NOMS.values())


def traduire(texte, nom_fichier='?'):
    lignes = texte.splitlines(keepends=True)
    remplacements = []          # (ligne, colonne, longueur, nouveau)
    precedent = None
    definis = set()
    try:
        jetons = list(tokenize.generate_tokens(io.StringIO(texte).readline))
    except (tokenize.TokenError, IndentationError, SyntaxError) as e:
        sys.stderr.write('%s: tokenize: %s\n' % (nom_fichier, e))
        return texte
    for k, t in enumerate(jetons):
        if t.type == tokenize.NAME:
            attribut = precedent is not None and precedent.string == '.'
            if not attribut and t.string in NOMS and NOMS[t.string] != t.string:
                (l, c) = t.start
                remplacements.append((l, c, len(t.string), NOMS[t.string]))
            elif not attribut and t.string in ANGLAIS and t.string not in NOMS:
                # nom anglais deja employe par le programme : collision
                if precedent is not None and precedent.string in ('def', 'class'):
                    definis.add(t.string)
                elif k + 1 < len(jetons) and jetons[k + 1].string == '=':
                    definis.add(t.string)
        if t.type not in (tokenize.NL, tokenize.NEWLINE, tokenize.COMMENT,
                          tokenize.INDENT, tokenize.DEDENT):
            precedent = t
    for l, c, n, nouveau in sorted(remplacements, reverse=True):
        s = lignes[l - 1]
        lignes[l - 1] = s[:c] + nouveau + s[c + n:]
    for d in sorted(definis):
        sys.stderr.write('%s: defines %r, which is also an English command\n' % (nom_fichier, d))
    return ''.join(lignes)


def main():
    p = sys.argv[1]
    with open(p, encoding='utf-8') as f:
        sys.stdout.write(traduire(f.read(), p))


if __name__ == '__main__':
    main()
