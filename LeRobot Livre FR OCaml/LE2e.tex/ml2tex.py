#!/usr/bin/env python3
# ml2tex.py -- compose un programme OCaml (.ml) pour le livre, dans le style
# des programmes Pascal de la premiere edition :
#   mots-cles en gras (\mcl), identificateurs en machine a ecrire (\idt),
#   commentaires dans la police des commentaires (\cmt), chaines (\cha),
#   indentation en debut de ligne (\blk pour deux blancs).
# Le code compris entre les commentaires (*<*) et (*>*) est souligne
# (corrections montrees dans les corriges).
#
#   python3 ml2tex.py Programme.ml > Programme.tex

import re
import sys

MOTS_CLES = set("""and as assert begin do done downto else end exception external
false for fun function if in include let match method mod module mutable new not
of open or rec sig struct then to true try type val when while with land lor lxor
lsl lsr asr""".split())

# caracteres speciaux de TeX, dans une police machine a ecrire
SPECIAUX = {
    '\\': r'\char92{}', '{': r'\{', '}': r'\}', '$': r'\$', '&': r'\&',
    '#': r'\#', '^': r'\char94{}', '_': r'\_', '%': r'\%', '~': r'\char126{}',
    ' ': r'\ ', '<': r'\char60{}', '>': r'\char62{}', '|': r'\char124{}',
    '"': r'\char34{}', '-': r'{-}', "'": r'\textquotesingle{}',
}


def echapper(t):
    return ''.join(SPECIAUX.get(c, c) for c in t)


def lexemes(ligne, dans_commentaire):
    """Decoupe une ligne en (genre, texte) ; genre : mcl, idt, cmt, cha,
    sou+ / sou- (debut / fin du soulignement). Rend aussi l'etat
    'dans un commentaire' a la fin de la ligne (commentaires sur plusieurs
    lignes)."""
    res = []
    i = 0
    n = len(ligne)
    while i < n:
        if dans_commentaire:
            j = ligne.find('*)', i)
            if j < 0:
                res.append(('cmt', ligne[i:]))
                return res, True
            res.append(('cmt', ligne[i:j + 2]))
            i = j + 2
            dans_commentaire = False
            continue
        if ligne.startswith('(*<*)', i):
            res.append(('sou+', ''))
            i += 5
            continue
        if ligne.startswith('(*>*)', i):
            res.append(('sou-', ''))
            i += 5
            continue
        if ligne.startswith('(*', i):
            dans_commentaire = True
            continue
        c = ligne[i]
        if c == '"':
            j = i + 1
            while j < n and ligne[j] != '"':
                j += 2 if ligne[j] == '\\' else 1
            res.append(('cha', ligne[i:j + 1]))
            i = j + 1
            continue
        if c == "'" and i + 2 < n and ligne[i + 2] == "'":
            res.append(('cha', ligne[i:i + 3]))
            i += 3
            continue
        m = re.match(r"[A-Za-z_][A-Za-z0-9_']*", ligne[i:])
        if m:
            mot = m.group(0)
            res.append(('mcl' if mot in MOTS_CLES else 'idt', mot))
            i += len(mot)
            continue
        res.append(('idt', c))
        i += 1
    return res, dans_commentaire


def composer(lignes):
    sortie = ['{', r'\parindent \parindentprog', r'\medskip', '', r'\carrenoir']
    dans_commentaire = False
    for ligne in lignes:
        ligne = ligne.rstrip('\n').rstrip()
        if not ligne.strip():
            # ligne vide : un petit espace, comme entre deux paragraphes
            sortie.append(r'\vspace{0.3\baselineskip}')
            continue
        blancs = len(ligne) - len(ligne.lstrip(' '))
        retrait = r'\blk' * ((blancs + 1) // 2)
        morceaux, dans_commentaire = lexemes(ligne.lstrip(' '), dans_commentaire)
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
    sortie += ['', r'\medskip }', '']
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
