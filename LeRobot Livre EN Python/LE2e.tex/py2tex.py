#!/usr/bin/env python3
# py2tex.py -- compose un programme Python (.py) pour le livre, dans le style
# des programmes de la premiere edition (et de ml2tex.py pour OCaml) :
#   mots-cles en gras (\mcl), identificateurs en machine a ecrire (\idt),
#   commentaires dans la police des commentaires (\cmt), chaines (\cha),
#   indentation en debut de ligne (\blk pour deux blancs).
# Le code compris entre les marques « et » est souligne (corrections
# montrees dans les corriges) ; ces marques ne figurent que dans les
# extraits (.extrait), pas dans les programmes executables.
#
#   python3 py2tex.py Programme.py > Programme.tex
#
# Edition anglaise : les commentaires (une ligne commencant par #) sont
# remplaces par leur traduction, lue dans traductions-commentaires.tsv (a
# cote de ce script : "commentaire francais<TAB>commentaire anglais") ;
# un commentaire absent du fichier reste tel quel.

import os
import re
import sys

MOTS_CLES = set("""and as assert break class continue def del elif else except
False finally for from global if import in is lambda None nonlocal not or pass
raise return True try while with yield""".split())

# caracteres speciaux de TeX, dans une police machine a ecrire
SPECIAUX = {
    '\\': r'\char92{}', '{': r'\{', '}': r'\}', '$': r'\$', '&': r'\&',
    '#': r'\#', '^': r'\char94{}', '_': r'\_', '%': r'\%', '~': r'\char126{}',
    ' ': r'\ ', '<': r'\char60{}', '>': r'\char62{}', '|': r'\char124{}',
    '"': r'\char34{}', '-': r'{-}', "'": r'\textquotesingle{}',
}


TRADUCTIONS = {}
_tsv = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                    'traductions-commentaires.tsv')
if os.path.exists(_tsv):
    for _l in open(_tsv, encoding='utf-8'):
        _fr, _, _en = _l.rstrip('\n').partition('\t')
        if _en:
            TRADUCTIONS[_fr.strip()] = _en.strip()


def traduire(commentaire):
    return TRADUCTIONS.get(commentaire.strip(), commentaire)


def echapper(t):
    return ''.join(SPECIAUX.get(c, c) for c in t)


def lexemes(ligne):
    """Decoupe une ligne en (genre, texte) ; genre : mcl, idt, cmt, cha,
    sou+ / sou- (debut / fin du soulignement)."""
    res = []
    i = 0
    n = len(ligne)
    while i < n:
        c = ligne[i]
        if c == '«':
            res.append(('sou+', ''))
            i += 1
            continue
        if c == '»':
            res.append(('sou-', ''))
            i += 1
            continue
        if c == '#':
            res.append(('cmt', traduire(ligne[i:])))
            break
        if c in '"\'':
            q = ligne[i:i + 3] if ligne[i:i + 3] in ('"""', "'''") else c
            j = ligne.find(q, i + len(q))
            while j > 0 and ligne[j - 1] == '\\' and len(q) == 1:
                j = ligne.find(q, j + 1)
            j = n if j < 0 else j + len(q)
            res.append(('cha', ligne[i:j]))
            i = j
            continue
        m = re.match(r"[A-Za-z_À-ÿ][A-Za-z0-9_À-ÿ]*", ligne[i:])
        if m:
            mot = m.group(0)
            res.append(('mcl' if mot in MOTS_CLES else 'idt', mot))
            i += len(mot)
            continue
        res.append(('idt', c))
        i += 1
    return res


def composer(lignes):
    # \parskip nul : les lignes d'un programme ne s'ecartent pas quand la
    # page est etiree (\flushbottom)
    sortie = ['{', r'\parindent \parindentprog', r'\parskip 0pt', r'\nopagebreak\medskip', '', r'\carrenoir']
    for ligne in lignes:
        ligne = ligne.rstrip('\n').rstrip()
        if not ligne.strip():
            # ligne vide : un petit espace, comme entre deux paragraphes
            sortie.append(r'\vspace{0.3\baselineskip}')
            continue
        blancs = len(ligne) - len(ligne.lstrip(' '))
        retrait = r'\blk' * ((blancs + 1) // 2)
        morceaux = lexemes(ligne.lstrip(' '))
        # regrouper les lexemes successifs de meme genre (sauf mots-cles)
        groupes = []
        for genre, t in morceaux:
            if groupes and genre in ('idt', 'cmt', 'cha') and groupes[-1][0] == genre:
                groupes[-1] = (genre, groupes[-1][1] + t)
            else:
                groupes.append((genre, t))
        texte = ''
        souligne = False
        for genre, t in groupes:
            if genre == 'sou+':
                texte += r'\underline{'
                souligne = True
            elif genre == 'sou-':
                if souligne:
                    texte += '}'
                souligne = False
            elif genre == 'mcl':
                texte += r'{\mcl ' + echapper(t) + '}'
            elif genre == 'cmt':
                texte += r'{\cmt ' + echapper(t) + '}'
            elif genre == 'cha':
                texte += r'{\cha ' + echapper(t) + '}'
            else:
                texte += r'{\idt ' + echapper(t) + '}'
        if souligne:
            texte += '}'
        sortie.append(r'\vspace{\neglskip}\mbox{\blc ' + retrait + texte + r'}\par')
    # pas de coupure de page apres la premiere ligne ni avant la derniere
    # (une ligne seule en bas ou en haut d'une page)
    # (un programme court, de 12 lignes au plus, n'est pas coupe du tout)
    lignes_prog = [k for k, l in enumerate(sortie) if l.startswith(r'\vspace{\neglskip}\mbox')]
    if len(lignes_prog) <= 12:
        coupures = lignes_prog[:-1]
    else:
        coupures = [lignes_prog[0], lignes_prog[-2]]
    for k in sorted(coupures, reverse=True):
        sortie.insert(k + 1, r'\nopagebreak')
    # la marque de fin (\Box) qui suit reste avec la derniere ligne
    sortie += ['', r'\nopagebreak\medskip }\nopagebreak', '']
    return '\n'.join(sortie)


def main():
    with open(sys.argv[1], encoding='utf-8') as f:
        lignes = f.readlines()
    # supprimer les lignes vides de la fin
    while lignes and not lignes[-1].strip():
        lignes.pop()
    sys.stdout.write(composer(lignes))


if __name__ == '__main__':
    main()
