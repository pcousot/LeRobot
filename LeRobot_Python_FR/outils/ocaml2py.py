#!/usr/bin/env python3
"""ocaml2py -- traduction en Python des programmes OCaml du livre
"Premieres lecons de programmation en OCaml" (LeRobot_OCaml_FR/livre).

    python3 ocaml2py.py Programme.ml > Programme.py
    python3 ocaml2py.py --dossier ../LeRobot_OCaml_FR/livre livre

Traite le sous-ensemble d'OCaml employe par les programmes du livre :
let (rec), fonctions, references (ref, !, :=, incr, decr), for, while,
if, match sur des constantes, begin ... end, sequences, chaines, tableaux
(Array.make, a.(i), a.(i) <- v), commentaires (conserves). Le resultat est
du Python idiomatique :

  - open LibRobot              -> from LibRobot import *
  - let () = ...               -> instructions au niveau du module
  - let f x y = ...            -> def f(x, y): ...
  - let x = ref e ... !x, :=   -> variable ordinaire (global / nonlocal
                                  ajoutes quand une fonction la modifie)
  - for i = a to b do ... done -> for i in range(a, b + 1):
  - float_of_int e             -> e (Python melange entiers et flottants)
  - a / b, a mod b (entiers)   -> a // b, a % b
  - deplacer (x, y)            -> deplacer(x, y)
  - write [a; b]               -> write(a, b)
Les constructions non reconnues levent une erreur (traduction a la main).
"""
import os
import re
import sys

# ===========================================================================
# Analyse lexicale

MOTS_CLES = {"let", "rec", "in", "and", "if", "then", "else", "begin", "end",
             "for", "to", "downto", "do", "done", "while", "match", "with",
             "fun", "function", "true", "false", "not", "mod", "land", "lor",
             "lxor", "lsl", "lsr", "asr", "open", "ref", "when", "of", "type",
             "or"}

SYMBOLES = sorted("""
:= <- -> <> <= >= == != && || ** +. -. *. /. :: .( .[ [| |] ;; .. ^
( ) [ ] { } ; , = < > + - * / @ ! | : _ . ' ~ ?
""".split(), key=len, reverse=True)


class Erreur(Exception):
    pass


class Tok:
    def __init__(self, sorte, val, ligne, col):
        self.sorte = sorte          # id, int, float, str, char, kw, sym, eof
        self.val = val
        self.ligne = ligne
        self.col = col

    def __repr__(self):
        return "%s:%r@%d" % (self.sorte, self.val, self.ligne)


class Commentaire:
    def __init__(self, texte, ligne, ligne_fin, code_avant, code_apres):
        self.texte = texte
        self.ligne = ligne
        self.ligne_fin = ligne_fin
        self.code_avant = code_avant
        self.code_apres = code_apres
        self.place = False


def _echappement_ocaml(s, i):
    """decode l'echappement commencant en s[i] == '\\' ; rend (car, i')"""
    c = s[i + 1]
    simples = {"n": "\n", "t": "\t", "r": "\r", "b": "\b", "\\": "\\",
               "'": "'", '"': '"', " ": " "}
    if c in simples:
        return simples[c], i + 2
    if c.isdigit():
        return chr(int(s[i + 1:i + 4])), i + 4
    if c == "x":
        return chr(int(s[i + 2:i + 4], 16)), i + 4
    if c == "\n":                   # fin de ligne echappee
        j = i + 2
        while j < len(s) and s[j] in " \t":
            j += 1
        return "", j
    raise Erreur("echappement inconnu \\" + c)


def lexer(src):
    toks = []
    coms = []
    i = 0
    ligne = 1
    col0 = 0                       # indice du debut de la ligne
    n = len(src)
    code_sur_ligne = {}            # ligne -> True si du code y figure

    def marquer(l):
        code_sur_ligne[l] = True

    while i < n:
        c = src[i]
        if c == "\n":
            ligne += 1
            i += 1
            col0 = i
            continue
        if c in " \t\r":
            i += 1
            continue
        if src.startswith("(*", i):
            # commentaire (imbrique)
            d = i
            l0 = ligne
            prof = 0
            while i < n:
                if src.startswith("(*", i):
                    prof += 1
                    i += 2
                elif src.startswith("*)", i):
                    prof -= 1
                    i += 2
                    if prof == 0:
                        break
                else:
                    if src[i] == "\n":
                        ligne += 1
                        col0 = i + 1
                    i += 1
            texte = src[d:i]
            coms.append(Commentaire(texte, l0, ligne, None, None))
            continue
        col = i - col0
        if c.isalpha() or c == "_":
            j = i
            while j < n and (src[j].isalnum() or src[j] in "_'"):
                j += 1
            mot = src[i:j]
            # Module.nom
            while j < n and src[j] == "." and j + 1 < n and src[j + 1].isalpha() and mot[0].isupper():
                k = j + 1
                while k < n and (src[k].isalnum() or src[k] in "_'"):
                    k += 1
                mot = src[i:k]
                j = k
            if mot in MOTS_CLES:
                toks.append(Tok("kw", mot, ligne, col))
            elif mot == "_":
                toks.append(Tok("sym", "_", ligne, col))
            else:
                toks.append(Tok("id", mot, ligne, col))
            marquer(ligne)
            i = j
            continue
        if c.isdigit():
            m = re.match(r"\d[\d_]*(\.[\d_]*)?([eE][+-]?\d+)?", src[i:])
            t = m.group(0)
            if m.group(1) is not None or m.group(2) is not None:
                toks.append(Tok("float", t.replace("_", ""), ligne, col))
            else:
                toks.append(Tok("int", t.replace("_", ""), ligne, col))
            marquer(ligne)
            i += len(t)
            continue
        if c == '"':
            j = i + 1
            val = ""
            l0 = ligne
            while src[j] != '"':
                if src[j] == "\\":
                    e, j = _echappement_ocaml(src, j)
                    val += e
                else:
                    if src[j] == "\n":
                        ligne += 1
                    val += src[j]
                    j += 1
            toks.append(Tok("str", val, l0, col))
            marquer(l0)
            i = j + 1
            continue
        if c == "'":
            # caractere 'a' ou '\n' ou '\027' (sinon : apostrophe de type)
            m = re.match(r"'(\\(\d\d\d|x[0-9a-fA-F]{2}|.)|[^\\'])'", src[i:])
            if m:
                t = m.group(0)
                if t[1] == "\\":
                    v, _ = _echappement_ocaml(t, 1)
                else:
                    v = t[1]
                toks.append(Tok("char", v, ligne, col))
                marquer(ligne)
                i += len(t)
                continue
            # caractere UTF-8 multi-octets ('é')
            m = re.match(r"'(.)'", src[i:])
            if m:
                toks.append(Tok("char", m.group(1), ligne, col))
                marquer(ligne)
                i += 3
                continue
        for s in SYMBOLES:
            if src.startswith(s, i):
                toks.append(Tok("sym", s, ligne, col))
                marquer(ligne)
                i += len(s)
                break
        else:
            raise Erreur("caractere inattendu %r ligne %d" % (c, ligne))
    toks.append(Tok("eof", None, ligne + 1, 0))
    # code avant / apres chaque commentaire sur la meme ligne
    for cm in coms:
        cm.code_avant = any(t.ligne == cm.ligne and t.sorte != "eof" and
                            (t.ligne, t.col) < (cm.ligne, 10 ** 6) and _avant(t, cm, src)
                            for t in toks)
        cm.code_apres = any(t.ligne == cm.ligne_fin and _apres(t, cm, src) for t in toks
                            if t.sorte != "eof")
    return toks, coms


def _position(src, ligne, col):
    return sum(len(l) + 1 for l in src.split("\n")[:ligne - 1]) + col


def _avant(t, cm, src):
    # le jeton est-il avant le commentaire ? (comparaison des positions)
    p_t = _position(src, t.ligne, t.col)
    p_c = src.find(cm.texte, _position(src, cm.ligne, 0))
    return p_t < p_c


def _apres(t, cm, src):
    p_t = _position(src, t.ligne, t.col)
    p_c = src.find(cm.texte, _position(src, cm.ligne, 0)) + len(cm.texte)
    return p_t >= p_c

# ===========================================================================
# Arbre syntaxique


class N:
    """noeud : sorte + champs"""

    def __init__(self, sorte, ligne, **champs):
        self.sorte = sorte
        self.ligne = ligne
        self.fin = ligne
        self.__dict__.update(champs)

    def __repr__(self):
        d = {k: v for k, v in self.__dict__.items() if k not in ("sorte", "ligne", "fin")}
        return "%s%r" % (self.sorte, d)


# ===========================================================================
# Analyse syntaxique (descente recursive, precedences d'OCaml)

class Analyseur:
    def __init__(self, toks):
        self.toks = toks
        self.i = 0

    def t(self, k=0):
        return self.toks[self.i + k]

    def voir(self, val, sorte=None, k=0):
        t = self.t(k)
        return t.val == val and (sorte is None or t.sorte == sorte) and t.sorte in ("kw", "sym")

    def prendre(self):
        t = self.toks[self.i]
        self.i += 1
        return t

    def attendre(self, val):
        t = self.prendre()
        if t.val != val or t.sorte not in ("kw", "sym"):
            raise Erreur("attendu %r, trouve %r ligne %d" % (val, t.val, t.ligne))
        return t

    def derniere_ligne(self):
        return self.toks[self.i - 1].ligne

    # --- programme -------------------------------------------------------
    def programme(self):
        items = []
        while self.t().sorte != "eof":
            if self.voir(";;"):
                self.prendre()
                continue
            if self.voir("open"):
                l = self.prendre().ligne
                m = self.prendre().val
                items.append(N("open", l, module=m))
                continue
            if self.voir("let"):
                l = self.t().ligne
                self.prendre()
                rec = False
                if self.voir("rec"):
                    self.prendre()
                    rec = True
                liaisons = self.liaisons()
                if self.voir("in"):
                    self.prendre()
                    corps = self.expr()
                    e = N("let", l, rec=rec, liaisons=liaisons, corps=corps)
                    e.fin = self.derniere_ligne()
                    items.append(N("expr", l, e=e))
                    continue
                it = N("def", l, rec=rec, liaisons=liaisons)
                it.fin = self.derniere_ligne()
                items.append(it)
                continue
            l = self.t().ligne
            e = self.expr()
            items.append(N("expr", l, e=e))
        return items

    def liaisons(self):
        ls = [self.liaison()]
        while self.voir("and"):
            self.prendre()
            ls.append(self.liaison())
        return ls

    def liaison(self):
        l = self.t().ligne
        motif = self.motif_simple()
        params = []
        while not self.voir("=") and not self.voir(":"):
            params.append(self.motif_simple())
        if self.voir(":"):                     # type du resultat
            self.prendre()
            self.sauter_type()
        self.attendre("=")
        corps = self.expr()
        n = N("liaison", l, motif=motif, params=params, corps=corps)
        n.fin = self.derniere_ligne()
        return n

    def sauter_type(self):
        while not (self.voir("=") or self.voir(")") or self.voir("->", "sym")):
            self.prendre()

    # --- motifs ----------------------------------------------------------
    def motif_simple(self):
        t = self.t()
        if self.voir("("):
            self.prendre()
            if self.voir(")"):
                self.prendre()
                return N("unit", t.ligne)
            m = self.motif()
            if self.voir(":"):
                self.prendre()
                self.sauter_type()
            self.attendre(")")
            return m
        if self.voir("_"):
            self.prendre()
            return N("joker", t.ligne)
        if t.sorte == "id":
            self.prendre()
            return N("var", t.ligne, nom=t.val)
        if t.sorte in ("int", "float", "str", "char"):
            self.prendre()
            return N("cst", t.ligne, sorte_cst=t.sorte, val=t.val)
        if self.voir("true") or self.voir("false"):
            self.prendre()
            return N("cst", t.ligne, sorte_cst="bool", val=t.val == "true")
        if self.voir("-") and self.t(1).sorte in ("int", "float"):
            self.prendre()
            t2 = self.prendre()
            return N("cst", t.ligne, sorte_cst=t2.sorte, val="-" + t2.val)
        if self.voir("["):
            self.prendre()
            elts = []
            while not self.voir("]"):
                elts.append(self.motif())
                if self.voir(";"):
                    self.prendre()
            self.attendre("]")
            return N("motif_liste", t.ligne, elts=elts)
        raise Erreur("motif inattendu %r ligne %d" % (t.val, t.ligne))

    def motif(self):
        """motif complet : alternatives | et n-uplets"""
        alts = [self.motif_tuple()]
        while self.voir("|"):
            self.prendre()
            alts.append(self.motif_tuple())
        if len(alts) == 1:
            return alts[0]
        return N("ou", alts[0].ligne, alts=alts)

    def motif_tuple(self):
        m = self.motif_intervalle()
        if self.voir(","):
            elts = [m]
            while self.voir(","):
                self.prendre()
                elts.append(self.motif_intervalle())
            return N("motif_tuple", m.ligne, elts=elts)
        return m

    def motif_intervalle(self):
        m = self.motif_simple()
        if self.voir(".."):
            self.prendre()
            m2 = self.motif_simple()
            return N("intervalle", m.ligne, a=m, b=m2)
        if self.voir("::"):
            self.prendre()
            m2 = self.motif_intervalle()
            return N("motif_cons", m.ligne, tete=m, queue=m2)
        return m

    # --- expressions -----------------------------------------------------
    def expr(self):
        """expression complete, avec sequence ;"""
        l = self.t().ligne
        e = self.expr_sans_seq()
        if self.voir(";"):
            elts = [e]
            while self.voir(";"):
                self.prendre()
                if self.fin_de_seq():
                    break
                elts.append(self.expr_sans_seq())
            if len(elts) == 1:
                return e
            s = N("seq", l, elts=elts)
            s.fin = self.derniere_ligne()
            return s
        return e

    def fin_de_seq(self):
        t = self.t()
        if t.sorte == "kw" and t.val == "let" and t.col == 0:
            return True             # definition suivante du programme
        return t.sorte == "eof" or (t.sorte in ("kw", "sym") and t.val in
                                    ("end", "done", ")", "in", "|", "]", "with", "and",
                                     "else", "then", ";;", "|]"))

    def expr_sans_seq(self):
        t = self.t()
        if self.voir("let"):
            return self.expr_let()
        if self.voir("if"):
            return self.expr_if()
        if self.voir("match"):
            return self.expr_match()
        if self.voir("fun"):
            self.prendre()
            params = []
            while not self.voir("->"):
                params.append(self.motif_simple())
            self.attendre("->")
            corps = self.expr()
            return N("fun", t.ligne, params=params, corps=corps)
        if self.voir("function"):
            self.prendre()
            cas = self.cas()
            return N("function", t.ligne, cas=cas)
        return self.expr_affect()

    def expr_let(self):
        l = self.prendre().ligne
        rec = False
        if self.voir("rec"):
            self.prendre()
            rec = True
        liaisons = self.liaisons()
        self.attendre("in")
        corps = self.expr()
        n = N("let", l, rec=rec, liaisons=liaisons, corps=corps)
        n.fin = self.derniere_ligne()
        return n

    def expr_if(self):
        l = self.prendre().ligne
        c = self.expr()
        self.attendre("then")
        a = self.expr_niveau_if()
        b = None
        if self.voir("else"):
            self.prendre()
            b = self.expr_niveau_if()
        n = N("if", l, cond=c, alors=a, sinon=b)
        n.fin = self.derniere_ligne()
        return n

    def expr_niveau_if(self):
        """branche d'un if : pas de sequence (sauf let, match, fun...)"""
        return self.expr_sans_seq()

    def expr_match(self):
        l = self.prendre().ligne
        e = self.expr()
        self.attendre("with")
        cas = self.cas()
        n = N("match", l, e=e, cas=cas)
        n.fin = self.derniere_ligne()
        return n

    def cas(self):
        cas = []
        if self.voir("|"):
            self.prendre()
        while True:
            l = self.t().ligne
            m = self.motif()
            garde = None
            if self.voir("when"):
                self.prendre()
                garde = self.expr_affect()
            self.attendre("->")
            corps = self.expr()
            cas.append(N("cas", l, motif=m, garde=garde, corps=corps))
            if self.voir("|"):
                self.prendre()
                continue
            break
        return cas

    def expr_affect(self):
        e = self.expr_tuple()
        if self.voir(":=") or self.voir("<-"):
            op = self.prendre()
            v = self.expr_affect_droite()
            return N("affect", op.ligne, cible=e, val=v, op=op.val)
        return e

    def expr_affect_droite(self):
        if self.voir("if") or self.voir("match") or self.voir("let"):
            return self.expr_sans_seq()
        return self.expr_affect()

    def expr_tuple(self):
        e = self.expr_bin(0)
        if self.voir(","):
            elts = [e]
            while self.voir(","):
                self.prendre()
                elts.append(self.expr_bin(0))
            return N("tuple", e.ligne, elts=elts)
        return e

    # niveaux binaires (du plus faible au plus fort)
    NIVEAUX = [
        (["||", "or"], "droite"),
        (["&&", "&"], "droite"),
        (["=", "<", ">", "<>", "<=", ">=", "==", "!=", "|>"], "gauche"),
        (["^", "@"], "droite"),
        (["::"], "droite"),
        (["+", "-", "+.", "-."], "gauche"),
        (["*", "/", "mod", "land", "lor", "lxor", "*.", "/."], "gauche"),
        (["**", "lsl", "lsr", "asr"], "droite"),
    ]

    def expr_bin(self, niv):
        if niv == len(self.NIVEAUX):
            return self.expr_unaire()
        ops, assoc = self.NIVEAUX[niv]
        g = self.expr_bin(niv + 1)
        while self.t().sorte in ("sym", "kw") and self.t().val in ops:
            op = self.prendre()
            if self.voir("if") or self.voir("match") or self.voir("let") or self.voir("fun"):
                d = self.expr_sans_seq()
            elif assoc == "droite":
                d = self.expr_bin(niv)
            else:
                d = self.expr_bin(niv + 1)
            g = N("bin", op.ligne, op=op.val, g=g, d=d)
            if assoc == "droite":
                break
        return g

    def expr_unaire(self):
        t = self.t()
        if self.voir("-") or self.voir("-."):
            self.prendre()
            e = self.expr_unaire()
            if e.sorte == "cst" and e.sorte_cst in ("int", "float") and not e.val.startswith("-"):
                return N("cst", t.ligne, sorte_cst=e.sorte_cst, val="-" + e.val)
            return N("neg", t.ligne, e=e)
        if self.voir("not"):
            self.prendre()
            e = self.expr_app()
            return N("not", t.ligne, e=e)
        return self.expr_app()

    def debut_atome(self):
        t = self.t()
        if t.sorte in ("id", "int", "float", "str", "char"):
            return True
        if t.sorte == "kw" and t.val in ("true", "false", "begin", "for", "while"):
            return True
        if t.sorte == "sym" and t.val in ("(", "[", "[|", "!"):
            return True
        return False

    def expr_app(self):
        t = self.t()
        if self.voir("ref"):
            self.prendre()
            e = self.atome()
            return N("ref", t.ligne, e=e)
        f = self.atome()
        args = []
        while self.debut_atome():
            args.append(self.atome())
        if args:
            n = N("app", t.ligne, f=f, args=args)
            n.fin = self.derniere_ligne()
            return n
        return f

    def atome(self):
        e = self.atome_simple()
        # acces a.(i) et s.[i]
        while self.voir(".(") or self.voir(".["):
            o = self.prendre()
            i = self.expr()
            self.attendre(")" if o.val == ".(" else "]")
            e = N("index", e.ligne, e=e, i=i)
        return e

    def atome_simple(self):
        t = self.t()
        if self.voir("for"):
            self.prendre()
            v = self.prendre()
            self.attendre("=")
            a = self.expr()
            sens = self.prendre().val
            b = self.expr()
            self.attendre("do")
            corps = self.expr() if not self.voir("done") else N("cst", t.ligne, sorte_cst="unit", val=None)
            self.attendre("done")
            n = N("for", t.ligne, var=v.val, a=a, b=b, sens=sens, corps=corps)
            n.fin = self.derniere_ligne()
            return n
        if self.voir("while"):
            self.prendre()
            c = self.expr()
            self.attendre("do")
            corps = self.expr() if not self.voir("done") else N("cst", t.ligne, sorte_cst="unit", val=None)
            self.attendre("done")
            n = N("while", t.ligne, cond=c, corps=corps)
            n.fin = self.derniere_ligne()
            return n
        if self.voir("!"):
            self.prendre()
            e = self.atome()
            return N("deref", t.ligne, e=e)
        if t.sorte == "id":
            self.prendre()
            return N("var", t.ligne, nom=t.val)
        if t.sorte in ("int", "float", "str", "char"):
            self.prendre()
            return N("cst", t.ligne, sorte_cst=t.sorte, val=t.val)
        if self.voir("true") or self.voir("false"):
            self.prendre()
            return N("cst", t.ligne, sorte_cst="bool", val=t.val == "true")
        if self.voir("begin"):
            self.prendre()
            if self.voir("end"):
                self.prendre()
                return N("cst", t.ligne, sorte_cst="unit", val=None)
            e = self.expr()
            self.attendre("end")
            e.bloc = True
            return e
        if self.voir("("):
            self.prendre()
            if self.voir(")"):
                self.prendre()
                return N("cst", t.ligne, sorte_cst="unit", val=None)
            # operateur en fonction : ( + )
            e = self.expr()
            if self.voir(":"):
                self.prendre()
                self.sauter_type()
            self.attendre(")")
            n = N("paren", t.ligne, e=e)
            return n
        if self.voir("[") or self.voir("[|"):
            o = self.prendre()
            elts = []
            ferme = "]" if o.val == "[" else "|]"
            while not self.voir(ferme):
                elts.append(self.expr_sans_seq())
                if self.voir(";"):
                    self.prendre()
            self.attendre(ferme)
            return N("liste", t.ligne, elts=elts)
        raise Erreur("expression inattendue %r ligne %d" % (t.val, t.ligne))


# ===========================================================================
# Generation de Python

PY_MOTS = {"False", "None", "True", "and", "as", "assert", "async", "await",
           "break", "class", "continue", "def", "del", "elif", "else",
           "except", "finally", "for", "from", "global", "if", "import", "in",
           "is", "lambda", "nonlocal", "not", "or", "pass", "raise", "return",
           "try", "while", "with", "yield", "print", "exit", "input"}

# fonctions de bibliotheque qui ne rendent rien (procedures)
PROCEDURES = set("""
av vd vg avf pqtd pqtg phtd phtg p3htd p3htg pdt pn pne pe pse ps psw pw pnw
pivoter rt lg lgX lgY lgRT dg tracer translater deplacer tl ce eh eb ad ag bc
lc dc dp ec cc cf montrerRobot cacherRobot autoriserSorties interdireSorties
pp ex vt st peindre init_pict message effacerMessage ecrire policeTexte
tailleTexte styleTexte bip biiip delai marquerUnePause note silence
metronome nuance write writeln readln modeTexte modeDessin effacerTexte
deplacerReel tracerReel print_string print_int print_float print_newline
print_endline print_char ignore sortieTerminal heure date interactionTP
exit incr decr enreg Principal.wait Principal.draw Graphics.moveto
Graphics.draw_string Graphics.lineto Graphics.plot Graphics.set_color
Graphics.fill_rect Peinture.remplir Dessin.cc
""".split())

# conversions supprimees : Python melange entiers et flottants
IDENTITE = {"float_of_int", "float", "Float.of_int"}

RENOMMER = {
    "int_of_float": "int", "truncate": "int", "Float.to_int": "int",
    "float_of_string": "float", "int_of_string": "int",
    "string_of_int": "str", "string_of_float": "str", "Int.to_string": "str",
    "string_of_bool": "str",
    "abs_float": "abs", "Float.abs": "abs",
    "int_of_char": "ord", "Char.code": "ord", "char_of_int": "chr",
    "Char.chr": "chr",
    "String.length": "len", "List.length": "len", "Array.length": "len",
    "Random.int": "randrange", "Float.round": "round",
    "sqrt": "sqrt", "Float.sqrt": "sqrt",
    "Float.pi": "pi", "max_int": "maxsize",
    "read_line": "input",
    "Printf.sprintf": "sprintf",
}

OPS = {"+": "+", "-": "-", "+.": "+", "-.": "-", "*": "*", "*.": "*",
       "/.": "/", "/": "//", "mod": "%", "**": "**", "land": "&",
       "lor": "|", "lxor": "^", "lsl": "<<", "lsr": ">>", "asr": ">>",
       "=": "==", "==": "is", "<>": "!=", "!=": "is not", "<": "<", ">": ">",
       "<=": "<=", ">=": ">=", "&&": "and", "&": "and", "||": "or", "or": "or",
       "^": "+", "@": "+"}

# precedences Python (plus grand = plus fort)
PREC = {"if": 1, "lambda": 0, "or": 2, "and": 3, "not": 4, "cmp": 5,
        "|": 6, "^": 7, "&": 8, "<<": 9, ">>": 9, "+": 10, "-": 10,
        "*": 11, "/": 11, "//": 11, "%": 11, "neg": 12, "**": 13, "atome": 20}


def prec_op(op):
    if op in ("==", "!=", "<", ">", "<=", ">=", "is", "is not", "in"):
        return PREC["cmp"]
    return PREC[op]


def noms_bibliotheque():
    """noms definis par LeRobot.py et LibRobot.py (lus dans les sources)"""
    ici = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    noms = set()
    for f in ("LeRobot.py", "LibRobot.py"):
        with open(os.path.join(ici, f), encoding="utf-8") as fp:
            for l in fp:
                m = re.match(r"def (\w+)", l)
                if m:
                    noms.add(m.group(1))
                m = re.match(r"([A-Za-z]\w*(?:\s*,\s*\w+)*)\s*=[^=]", l)
                if m:
                    noms.update(x.strip() for x in m.group(1).split(","))
    return noms


LIB_NOMS = noms_bibliotheque()


class Portee:
    def __init__(self, parent, nom):
        self.parent = parent
        self.nom = nom
        self.refs = set()          # variables (references) definies ici
        self.locales = set()       # noms definis ici
        self.globaux = set()
        self.non_locaux = set()


class Generateur:
    def __init__(self, coms, fichier="", vides=()):
        self.vides = set(vides)    # lignes vides du source
        self.coms = coms
        self.fichier = fichier
        self.lignes = []           # (indentation, texte, ligne source, joignable)
        self.fonctions = {}        # nom -> True si procedure
        self.portee = Portee(None, "<module>")
        self.temp = 0
        self.ind_courante = 0
        self.tableaux = set()

    # --- sortie -----------------------------------------------------------
    def emettre(self, ind, texte, ligne, joignable=False):
        if (joignable and self.lignes and self.lignes[-1][3] and
                self.lignes[-1][0] == ind and self.lignes[-1][2] == ligne and
                len(self.lignes[-1][1]) + len(texte) < 76):
            i, t, l, j = self.lignes[-1]
            self.lignes[-1] = (i, t + "; " + texte, l, True)
        else:
            self.lignes.append((ind, texte, ligne, joignable))

    # --- noms -------------------------------------------------------------
    def nom(self, n):
        n = n.replace("'", "_")
        if n in PY_MOTS:
            return n + "_"
        return n

    def definir(self, nom):
        self.portee.locales.add(nom)

    def trouver(self, nom):
        p = self.portee
        while p is not None:
            if nom in p.locales:
                return p
            p = p.parent
        return None

    def affecter(self, nom):
        """affectation de nom (reference) : global / nonlocal si besoin"""
        p = self.trouver(nom)
        if p is None or p is self.portee:
            return
        if p.parent is None:
            self.portee.globaux.add(self.nom(nom))
        else:
            self.portee.non_locaux.add(self.nom(nom))

    # --- analyse : procedures ou fonctions -------------------------------
    def est_unit(self, e):
        """True : e ne rend rien (procedure) ; False : e rend une valeur ;
        None : on ne sait pas encore (fonction pas encore analysee)"""
        s = e.sorte
        if s == "cst":
            return e.sorte_cst == "unit"
        if s in ("for", "while", "affect"):
            return True
        if s == "seq":
            return self.est_unit(e.elts[-1])
        if s == "paren":
            return self.est_unit(e.e)
        if s == "let":
            return self.est_unit(e.corps)
        if s == "if":
            if e.sinon is None:
                return True
            return self.combiner([self.est_unit(e.alors), self.est_unit(e.sinon)])
        if s == "match":
            return self.combiner([self.est_unit(c.corps) for c in e.cas])
        if s == "app" and e.f.sorte == "var":
            f = e.f.nom
            if f in self.fonctions:
                return self.fonctions[f]
            return f in PROCEDURES
        return False

    def combiner(self, vs):
        if False in vs:
            return False
        if True in vs:
            return True
        return None

    def analyser_fonctions(self, items):
        defs = []

        def collecter(e):
            if isinstance(e, N):
                if e.sorte in ("def", "let"):
                    for l in e.liaisons:
                        if l.params and l.motif.sorte == "var":
                            defs.append(l)
                for v in e.__dict__.values():
                    if isinstance(v, N):
                        collecter(v)
                    elif isinstance(v, list):
                        for x in v:
                            collecter(x)
        for it in items:
            collecter(it)
        for l in defs:
            self.fonctions[l.motif.nom] = None
        for _ in range(8):
            for l in defs:
                v = self.est_unit(l.corps)
                if v is not None:
                    self.fonctions[l.motif.nom] = v
        for k, v in self.fonctions.items():
            if v is None:
                self.fonctions[k] = True

    # --- programme --------------------------------------------------------
    def masquages(self, items):
        """un nom de la bibliotheque redefini par le programme et employe
        avant sa definition (TelegrapheDeChappe : cf blanc, puis
        let blanc () = ...) : la definition du programme est renommee"""
        utilisations = {}

        def voir(e):
            if isinstance(e, N):
                if e.sorte == "var":
                    utilisations.setdefault(e.nom, []).append(e.ligne)
                for v in e.__dict__.values():
                    if isinstance(v, N):
                        voir(v)
                    elif isinstance(v, list):
                        for x in v:
                            voir(x)
        for it in items:
            voir(it)
        for it in items:
            if it.sorte == "def":
                for l in it.liaisons:
                    if l.motif.sorte == "var" and l.motif.nom in LIB_NOMS and l.params:
                        n = l.motif.nom
                        if any(x < l.ligne for x in utilisations.get(n, [])):
                            self.renommes[n] = (l.ligne, n + "_")

    def programme(self, items):
        self.renommes = {}
        self.masquages(items)
        self.analyser_fonctions(items)
        prec_fin = None
        for it in items:
            if it.ligne - 1 in self.vides:
                self.lignes.append((0, "", it.ligne - 1, False))
            if prec_fin is not None and it.sorte == "def" and self.est_def_fonction(it):
                self.lignes.append((0, "", it.ligne - 1, False))
            if it.sorte == "open":
                m = it.module
                if m in ("LibRobot", "LeRobot"):
                    self.emettre(0, "from %s import *" % m, it.ligne)
                else:
                    self.emettre(0, "from %s import *" % m, it.ligne)
            elif it.sorte == "def":
                self.definition(it.liaisons, 0, it.rec, toplevel=True)
            elif it.sorte == "expr":
                self.instr(it.e, 0, None)
            prec_fin = getattr(it, "fin", it.ligne)
            prec_fin = max(prec_fin, self.fin_noeud(it))
        return self.texte()

    def est_def_fonction(self, it):
        return any(l.params for l in it.liaisons)

    def fin_noeud(self, n):
        m = n.ligne
        for v in n.__dict__.values():
            if isinstance(v, N):
                m = max(m, self.fin_noeud(v))
            elif isinstance(v, list):
                for x in v:
                    if isinstance(x, N):
                        m = max(m, self.fin_noeud(x))
        return max(m, getattr(n, "fin", m))

    # --- definitions ------------------------------------------------------
    def definition(self, liaisons, ind, rec, toplevel=False):
        for l in liaisons:
            if l.motif.sorte == "var" and l.params:
                self.definir(l.motif.nom)
        for l in liaisons:
            self.liaison(l, ind)

    def params_py(self, params):
        noms = []
        for p in params:
            if p.sorte == "unit":
                continue
            if p.sorte == "var":
                noms.append(self.nom(p.nom))
            elif p.sorte == "joker":
                noms.append("_")
            elif p.sorte == "motif_tuple":
                noms.extend(self.motif_py(x) for x in p.elts)
            else:
                raise Erreur("parametre non traite ligne %d" % p.ligne)
        return noms

    def liaison(self, l, ind):
        m = l.motif
        if l.params:
            if m.sorte != "var":
                raise Erreur("definition non traitee ligne %d" % l.ligne)
            self.definir(m.nom)
            for p in l.params:
                for n in self.noms_motif(p):
                    if self.param_reference(l.corps, n) and not os.environ.get("SANS_VERIF_REF"):
                        raise Erreur("parametre reference %s de %s ligne %d" % (n, m.nom, l.ligne))
            nom_def = self.nom(m.nom)
            if m.nom in self.renommes and ind == 0:
                nom_def = self.renommes[m.nom][1]
            self.emettre(ind, "def %s(%s):" % (nom_def, ", ".join(self.params_py(l.params))), l.ligne)
            debut = len(self.lignes)
            ancienne = self.portee
            self.portee = Portee(ancienne, m.nom)
            for p in l.params:
                for n in self.noms_motif(p):
                    self.definir(n)
            proc = self.fonctions.get(m.nom, True)
            self.instr(l.corps, ind + 1, None if proc else "return")
            decl = []
            if self.portee.globaux:
                decl.append("global " + ", ".join(sorted(self.portee.globaux)))
            if self.portee.non_locaux:
                decl.append("nonlocal " + ", ".join(sorted(self.portee.non_locaux)))
            self.portee = ancienne
            for k, d in enumerate(decl):
                self.lignes.insert(debut + k, (ind + 1, d, l.ligne, False))
            if len(self.lignes) == debut + len(decl):
                self.emettre(ind + 1, "pass", l.ligne)
            return
        # valeur
        if m.sorte == "unit" or m.sorte == "joker":
            self.instr(l.corps, ind, None)
            return
        if m.sorte == "var":
            corps = l.corps
            if corps.sorte == "ref":
                self.portee.refs.add(m.nom)
                corps = corps.e
            self.definir(m.nom)
            self.affectation(self.nom(m.nom), corps, ind, l.ligne)
            return
        if m.sorte == "motif_tuple":
            for n in self.noms_motif(m):
                self.definir(n)
            self.affectation(self.motif_py(m), l.corps, ind, l.ligne)
            return
        raise Erreur("liaison non traitee ligne %d" % l.ligne)

    def affectation(self, cible, e, ind, ligne):
        if self.est_expr(e):
            self.emettre(ind, "%s = %s" % (cible, self.expr(e)), ligne, joignable=True)
        else:
            self.instr(e, ind, ("assign", cible))

    def noms_motif(self, m):
        if m.sorte == "var":
            return [m.nom]
        if m.sorte == "motif_tuple":
            r = []
            for x in m.elts:
                r += self.noms_motif(x)
            return r
        return []

    def motif_py(self, m):
        if m.sorte == "var":
            return self.nom(m.nom)
        if m.sorte == "joker":
            return "_"
        if m.sorte == "motif_tuple":
            return ", ".join(self.motif_py(x) for x in m.elts)
        raise Erreur("motif non traite ligne %d" % m.ligne)

    # --- instructions -----------------------------------------------------
    def est_expr(self, e):
        """peut-on ecrire e comme une expression Python ?"""
        s = e.sorte
        if s in ("seq", "let", "for", "while", "affect", "match"):
            return False
        if s == "paren":
            return self.est_expr(e.e)
        if s == "if":
            return (e.sinon is not None and self.est_expr(e.cond) and
                    self.est_expr(e.alors) and self.est_expr(e.sinon))
        if s == "app":
            if e.f.sorte == "var" and e.f.nom in ("incr", "decr", "heure", "date", "interactionTP"):
                return False
            return all(self.est_expr(a) for a in [e.f] + e.args)
        for v in e.__dict__.values():
            if isinstance(v, N) and not self.est_expr(v):
                return False
            if isinstance(v, list):
                for x in v:
                    if isinstance(x, N) and not self.est_expr(x):
                        return False
        return True

    def instr(self, e, ind, mode):
        """mode : None (valeur ignoree), "return", ("assign", cible)"""
        s = e.sorte
        self.ind_courante = ind
        if s == "paren":
            return self.instr(e.e, ind, mode)
        if s == "seq":
            for x in e.elts[:-1]:
                self.instr(x, ind, None)
            return self.instr(e.elts[-1], ind, mode)
        if s == "let":
            for l in e.liaisons:
                if l.motif.sorte == "var" and l.params:
                    self.definir(l.motif.nom)
            for l in e.liaisons:
                self.liaison(l, ind)
            return self.instr(e.corps, ind, mode)
        if s == "if":
            return self.instr_if(e, ind, mode, "if")
        if s == "match":
            return self.instr_match(e, ind, mode)
        if s == "for":
            return self.instr_for(e, ind)
        if s == "while":
            c = e.cond.e if e.cond.sorte == "paren" else e.cond
            if c.sorte == "seq" and e.corps.sorte == "cst":
                # while begin corps; not c end do () done : repeat ... until c
                self.emettre(ind, "while True:", e.ligne)
                for x in c.elts[:-1]:
                    self.instr(x, ind + 1, None)
                fin = c.elts[-1]
                # let ... in (...; condition) : instructions puis condition
                while fin.sorte in ("let", "seq", "paren"):
                    if fin.sorte == "paren":
                        fin = fin.e
                    elif fin.sorte == "let":
                        for l in fin.liaisons:
                            self.liaison(l, ind + 1)
                        fin = fin.corps
                    else:
                        for x in fin.elts[:-1]:
                            self.instr(x, ind + 1, None)
                        fin = fin.elts[-1]
                if fin.sorte == "not":
                    t = self.expr(fin.e)
                else:
                    t = "not " + self.expr(fin, PREC["not"])
                self.emettre(ind + 1, "if %s:" % t, fin.ligne)
                self.emettre(ind + 2, "break", fin.ligne)
                return
            self.emettre(ind, "while %s:" % self.expr(e.cond), e.ligne)
            self.bloc(e.corps, ind + 1, None)
            return
        if s == "affect":
            return self.instr_affect(e, ind)
        if s == "cst" and e.sorte_cst == "unit":
            if mode == "return":
                return
            if mode is None:
                self.emettre(ind, "pass", e.ligne)
                return
        if s == "app" and e.f.sorte == "var":
            if self.instr_speciale(e, ind):
                return
        # expression
        if mode is None:
            if s == "app" and e.f.sorte == "var" and e.f.nom == "ignore":
                e = e.args[0]
            self.emettre(ind, self.expr(e), e.ligne, joignable=True)
        elif mode == "return":
            if self.est_unit(e):
                self.emettre(ind, self.expr(e), e.ligne, joignable=True)
            else:
                self.emettre(ind, "return " + self.expr(e), e.ligne, joignable=True)
        else:
            self.emettre(ind, "%s = %s" % (mode[1], self.expr(e)), e.ligne, joignable=True)

    def instr_speciale(self, e, ind):
        f = e.f.nom
        a = e.args
        if f in ("incr", "decr"):
            c = self.cible(a[0])
            self.emettre(ind, "%s %s= 1" % (c, "+" if f == "incr" else "-"), e.ligne, joignable=True)
            return True
        if f in ("heure", "date") and len(a) == 3:
            cs = [self.cible(x) for x in a]
            self.emettre(ind, "%s = %s()" % (", ".join(cs), f), e.ligne, joignable=True)
            return True
        if f == "interactionTP" and len(a) == 8:
            cs = [self.cible(x) for x in a[:3]]
            self.emettre(ind, "%s = interactionTP(%s)" % (
                ", ".join(cs), ", ".join(self.expr(x) for x in a[3:])), e.ligne, joignable=True)
            return True
        return False

    def cible(self, x):
        """une reference passee a incr, heure, := ... : son nom"""
        if x.sorte == "paren":
            x = x.e
        if x.sorte == "var":
            self.affecter(x.nom)
            return self.expr(x)
        if x.sorte == "index":
            return self.expr(x)
        raise Erreur("reference non traitee ligne %d" % x.ligne)

    def instr_affect(self, e, ind):
        c = e.cible
        if e.op == ":=":
            if c.sorte == "var" and c.nom == "sortie_terminal":
                self.emettre(ind, "sortieTerminal(%s)" % self.expr(e.val), e.ligne, joignable=True)
                return
            cible = self.cible(c)
        else:
            cible = self.expr(c)
        v = e.val
        # x := !x + 1  ->  x += 1
        if v.sorte == "bin" and v.op in ("+", "-", "+.", "-.", "^") and \
                self.expr(v.g) == cible and v.d.sorte != "bin":
            self.emettre(ind, "%s %s= %s" % (cible, OPS[v.op], self.expr(v.d, PREC["+"] + 1)),
                         e.ligne, joignable=True)
            return
        if self.est_expr(v):
            self.emettre(ind, "%s = %s" % (cible, self.expr(v)), e.ligne, joignable=True)
        else:
            self.instr(v, ind, ("assign", cible))

    def param_reference(self, e, nom):
        """le parametre nom est-il une reference (!nom, nom := ..., incr nom) ?"""
        if isinstance(e, N):
            if e.sorte == "deref" and e.e.sorte == "var" and e.e.nom == nom:
                return True
            if e.sorte == "affect" and e.op == ":=" and e.cible.sorte == "var" and e.cible.nom == nom:
                return True
            if (e.sorte == "app" and e.f.sorte == "var" and e.f.nom in ("incr", "decr")
                    and e.args[0].sorte == "var" and e.args[0].nom == nom):
                return True
            if e.sorte in ("let", "fun") or (e.sorte == "def"):
                # nom redefini plus bas : on s'arrete la
                pass
            for v in e.__dict__.values():
                if isinstance(v, N) and self.param_reference(v, nom):
                    return True
                if isinstance(v, list) and any(self.param_reference(x, nom) for x in v):
                    return True
        return False

    def utilise(self, e, nom):
        if isinstance(e, N):
            if e.sorte == "var" and e.nom == nom:
                return True
            for v in e.__dict__.values():
                if isinstance(v, N) and self.utilise(v, nom):
                    return True
                if isinstance(v, list) and any(self.utilise(x, nom) for x in v):
                    return True
        return False

    def plus_un(self, b):
        """texte de b + 1 (simplifie : n - 1 + 1 -> n, 3 + 1 -> 4)"""
        if b.sorte == "paren":
            b = b.e
        if b.sorte == "cst" and b.sorte_cst == "int":
            return str(int(b.val) + 1)
        if b.sorte == "bin" and b.op == "-" and b.d.sorte == "cst" and b.d.val == "1":
            return self.expr(b.g, 1)
        if b.sorte == "bin" and b.op == "+" and b.d.sorte == "cst" and b.d.sorte_cst == "int":
            k = int(b.d.val) + 1
            return "%s + %d" % (self.expr(b.g, PREC["+"]), k)
        return self.expr(b, PREC["+"]) + " + 1"

    def moins_un(self, b):
        if b.sorte == "paren":
            b = b.e
        if b.sorte == "cst" and b.sorte_cst == "int":
            return str(int(b.val) - 1)
        if b.sorte == "bin" and b.op == "+" and b.d.sorte == "cst" and b.d.val == "1":
            return self.expr(b.g, 1)
        return self.expr(b, PREC["+"]) + " - 1"

    def instr_for(self, e, ind):
        v = self.nom(e.var)
        self.definir(e.var)
        a = e.a.e if e.a.sorte == "paren" else e.a
        if e.sens == "to":
            if not self.utilise(e.corps, e.var) and a.sorte == "cst" and a.val == "1":
                r = "range(%s)" % self.expr(e.b, 1)
                v = "_" if False else v
            elif a.sorte == "cst" and a.val == "0":
                r = "range(%s)" % self.plus_un(e.b)
            else:
                r = "range(%s, %s)" % (self.expr(e.a, 1), self.plus_un(e.b))
        else:
            r = "range(%s, %s, -1)" % (self.expr(e.a, 1), self.moins_un(e.b))
        self.emettre(ind, "for %s in %s:" % (v, r), e.ligne)
        self.bloc(e.corps, ind + 1, None)

    def bloc(self, e, ind, mode):
        n = len(self.lignes)
        self.instr(e, ind, mode)
        if len(self.lignes) == n:
            self.emettre(ind, "pass", e.ligne)

    def instr_if(self, e, ind, mode, mot):
        self.emettre(ind, "%s %s:" % (mot, self.expr(e.cond)), e.ligne)
        self.bloc(e.alors, ind + 1, mode)
        sinon = e.sinon
        if sinon is not None and sinon.sorte == "paren":
            sinon = sinon.e
        if sinon is None:
            if mode is not None and mode != "return":
                raise Erreur("if sans else ligne %d" % e.ligne)
            return
        if sinon.sorte == "cst" and sinon.sorte_cst == "unit" and mode != "return":
            return
        if sinon.sorte == "if" and not getattr(sinon, "bloc", False):
            return self.instr_if(sinon, ind, mode, "elif")
        self.emettre(ind, "else:", sinon.ligne if sinon.ligne > e.ligne else e.ligne)
        self.bloc(sinon, ind + 1, mode)

    def test_motif(self, m, sujet):
        s = m.sorte
        if isinstance(sujet, list):
            if s in ("joker", "var"):
                return None
            if s != "motif_tuple" or len(m.elts) != len(sujet):
                raise Erreur("motif de match non traite ligne %d" % m.ligne)
            tests = []
            for mm, ss in zip(m.elts, sujet):
                t = self.test_motif(mm, ss)
                if t is not None:
                    tests.append(t if " or " not in t else "(%s)" % t)
            return " and ".join(tests) if tests else None
        if s == "cst":
            return "%s == %s" % (sujet, self.cst(m))
        if s == "ou":
            if all(a.sorte == "cst" for a in m.alts):
                return "%s in (%s)" % (sujet, ", ".join(self.cst(a) for a in m.alts))
            return " or ".join("(%s)" % self.test_motif(a, sujet) for a in m.alts)
        if s == "intervalle":
            return "%s <= %s <= %s" % (self.cst(m.a), sujet, self.cst(m.b))
        if s in ("joker", "var"):
            return None
        if s == "motif_liste" and not m.elts:
            return "%s == []" % sujet
        raise Erreur("motif de match non traite ligne %d" % m.ligne)

    def instr_match(self, e, ind, mode):
        sujet = e.e
        if sujet.sorte == "paren":
            sujet = sujet.e
        if sujet.sorte == "tuple" and all(x.sorte in ("var", "deref") for x in sujet.elts):
            s = [self.expr(x) for x in sujet.elts]
        elif sujet.sorte == "var":
            s = self.expr(sujet)
        else:
            s = self.expr(sujet)
            if not re.fullmatch(r"[A-Za-z_][A-Za-z_0-9]*(\[[^\]]*\])?", s):
                self.temp += 1
                v = "choix" if self.temp == 1 else "choix%d" % self.temp
                self.emettre(ind, "%s = %s" % (v, s), e.ligne)
                s = v
        premier = True
        for c in e.cas:
            test = self.test_motif(c.motif, s)
            if c.motif.sorte == "var":
                self.definir(c.motif.nom)
            if c.garde is not None:
                g = self.expr(c.garde, PREC["and"] + 1)
                test = g if test is None else "%s and %s" % (
                    test if c.motif.sorte != "ou" or " in " in test else "(%s)" % test, g)
            if test is not None and c.garde is not None and " or " in test.split(" and ")[0] and not test.startswith("("):
                pass
            if test is None:
                if premier:
                    if c.motif.sorte == "var":
                        self.emettre(ind, "%s = %s" % (self.nom(c.motif.nom), s), c.ligne)
                    self.instr(c.corps, ind, mode)
                    return
                self.emettre(ind, "else:", c.ligne)
                if c.motif.sorte == "var":
                    self.emettre(ind + 1, "%s = %s" % (self.nom(c.motif.nom), s), c.ligne)
                self.bloc(c.corps, ind + 1, mode)
                return
            self.emettre(ind, "%s %s:" % ("if" if premier else "elif", test), c.ligne)
            self.bloc(c.corps, ind + 1, mode)
            premier = False

    # --- expressions ------------------------------------------------------
    def cst(self, e):
        k = e.sorte_cst
        v = e.val
        if k == "int":
            return v
        if k == "float":
            if re.fullmatch(r"-?\d+\.0*", v):
                return v.split(".")[0]
            if v.endswith("."):
                return v + "0"
            return v
        if k in ("str", "char"):
            return chaine_py(v)
        if k == "bool":
            return "True" if v else "False"
        if k == "unit":
            return "None"
        raise Erreur("constante")

    def expr(self, e, p=0):
        """texte Python de e, parenthese si sa precedence est < p"""
        t, q = self.expr_p(e)
        if q < p:
            return "(" + t + ")"
        return t

    def expr_p(self, e):
        s = e.sorte
        A = PREC["atome"]
        if s == "cst":
            t = self.cst(e)
            return t, (PREC["neg"] if t.startswith("-") else A)
        if s == "var":
            n = e.nom
            if n in RENOMMER:
                return RENOMMER[n], A
            if n == "pi":
                return "pi", A
            if n in self.renommes and e.ligne >= self.renommes[n][0]:
                return self.renommes[n][1], A
            return self.nom(n), A
        if s == "deref":
            return self.expr_p(e.e)
        if s == "paren":
            return self.expr_p(e.e)
        if s == "neg":
            return "-" + self.expr(e.e, PREC["neg"]), PREC["neg"]
        if s == "not":
            return "not " + self.expr(e.e, PREC["not"]), PREC["not"]
        if s == "tuple":
            return ", ".join(self.expr(x, 1) for x in e.elts), 0
        if s == "liste":
            return "[" + ", ".join(self.expr(x, 1) for x in e.elts) + "]", A
        if s == "index":
            return self.expr(e.e, A) + "[" + self.expr(e.i) + "]", A
        if s == "bin":
            return self.expr_bin(e)
        if s == "if" and e.sinon is not None:
            return "%s if %s else %s" % (self.expr(e.alors, 2), self.expr(e.cond, 2),
                                         self.expr(e.sinon, 1)), PREC["if"]
        if s == "app":
            return self.expr_app(e)
        if s == "fun":
            ps = self.params_py(e.params)
            if self.est_expr(e.corps):
                return "lambda %s: %s" % (", ".join(ps), self.expr(e.corps, 1)), 0
            # corps fait d'instructions : fonction locale, definie avant
            self.temp += 1
            nom = "faire" if self.temp == 1 else "faire%d" % self.temp
            ind = self.ind_courante
            self.emettre(ind, "def %s(%s):" % (nom, ", ".join(ps)), e.ligne)
            ancienne = self.portee
            self.portee = Portee(ancienne, nom)
            debut = len(self.lignes)
            self.bloc(e.corps, ind + 1, None if self.est_unit(e.corps) else "return")
            decl = []
            if self.portee.globaux:
                decl.append("global " + ", ".join(sorted(self.portee.globaux)))
            if self.portee.non_locaux:
                decl.append("nonlocal " + ", ".join(sorted(self.portee.non_locaux)))
            self.portee = ancienne
            for k, d in enumerate(decl):
                self.lignes.insert(debut + k, (ind + 1, d, e.ligne, False))
            return nom, PREC["atome"]
        if s == "ref":
            return self.expr_p(e.e)
        raise Erreur("expression non traitee (%s) ligne %d" % (s, e.ligne))

    def expr_bin(self, e):
        if e.op == "::":
            return "[%s] + %s" % (self.expr(e.g, 1), self.expr(e.d, PREC["+"] + 1)), PREC["+"]
        op = OPS[e.op]
        p = prec_op(op)
        if p == PREC["cmp"]:
            return "%s %s %s" % (self.expr(e.g, p + 1), op, self.expr(e.d, p + 1)), p
        if op == "**":
            return "%s ** %s" % (self.expr(e.g, p + 1), self.expr(e.d, p)), p
        if e.op in ("^", "@", "||", "or", "&&", "&"):
            # associatifs : a ^ (b ^ c) == (a ^ b) ^ c
            return "%s %s %s" % (self.expr(e.g, p), op, self.expr(e.d, p)), p
        return "%s %s %s" % (self.expr(e.g, p), op, self.expr(e.d, p + 1)), p

    def expr_app(self, e):
        A = PREC["atome"]
        f = e.f
        args = e.args
        if f.sorte == "var":
            n = f.nom
            if n in IDENTITE and len(args) == 1:
                return self.expr_p(args[0])
            if n == "ignore" and len(args) == 1:
                return self.expr_p(args[0])
            if n in ("print_string", "print_int", "print_float", "print_char") and len(args) == 1:
                return 'print(%s, end="")' % self.expr(args[0], 1), A
            if n == "print_newline":
                return "print()", A
            if n == "print_endline":
                return "print(%s)" % self.expr(args[0], 1), A
            if n in ("write", "writeln") and len(args) == 1 and args[0].sorte == "liste":
                return "%s(%s)" % (n, ", ".join(self.expr(x, 1) for x in args[0].elts)), A
            if n == "fst" and len(args) == 1:
                return self.expr(args[0], A) + "[0]", A
            if n == "snd" and len(args) == 1:
                return self.expr(args[0], A) + "[1]", A
            if n == "succ" and len(args) == 1:
                return self.expr(args[0], PREC["+"]) + " + 1", PREC["+"]
            if n == "pred" and len(args) == 1:
                return self.expr(args[0], PREC["+"]) + " - 1", PREC["+"]
            if n == "String.make" and len(args) == 2 and args[0].sorte == "cst" and args[0].val == "1":
                return self.expr_p(args[1])
            if n == "String.make" and len(args) == 2:
                return "%s * %s" % (self.expr(args[1], PREC["*"]), self.expr(args[0], PREC["*"] + 1)), PREC["*"]
            if n == "String.sub" and len(args) == 3:
                s_, i_, n_ = (self.expr(x, PREC["+"]) for x in args)
                if i_ == "0":
                    return "%s[:%s]" % (self.expr(args[0], A), self.expr(args[2], 1)), A
                return "%s[%s:%s + %s]" % (self.expr(args[0], A), i_, i_, n_), A
            if n == "List.mem" and len(args) == 2:
                return "%s in %s" % (self.expr(args[0], PREC["cmp"] + 1),
                                     self.expr(args[1], PREC["cmp"] + 1)), PREC["cmp"]
            if n == "Array.make" and len(args) == 2:
                return "[%s] * %s" % (self.expr(args[1], 1), self.expr(args[0], PREC["*"] + 1)), PREC["*"]
            if n == "Random.int" and len(args) == 1:
                return "randrange(%s)" % self.expr(args[0], 1), A
            if n == "abs" and len(args) == 1:
                return "abs(%s)" % self.expr(args[0], 1), A
        fn = self.expr(f, A)
        ps = []
        for a in args:
            if a.sorte == "cst" and a.sorte_cst == "unit":
                continue
            x = a.e if a.sorte == "paren" else a
            if x.sorte == "tuple":
                ps.extend(self.expr(y, 1) for y in x.elts)
            else:
                ps.append(self.expr(a, 1))
        return "%s(%s)" % (fn, ", ".join(ps)), A

    # --- texte final avec les commentaires -------------------------------
    def texte(self):
        sortie = []                # (ind, texte, ligne source)
        coms = [c for c in self.coms if not re.fullmatch(r"\(\*[<>]\*\)", c.texte)]
        for (ind, t, l, _) in self.lignes:
            sortie.append([ind, t, l, []])
        # commentaires en fin de ligne (du code avant) ou en debut d'une
        # ligne de code (du code apres) : sur la ligne Python correspondante
        res = []
        for c in coms:
            if c.code_avant or c.code_apres:
                cibles = [s for s in sortie if s[2] == (c.ligne if c.code_avant else c.ligne_fin) and s[1]]
                if not cibles and c.code_apres:
                    cibles = [s for s in sortie if s[2] > c.ligne_fin and s[1]][:1]
                if not cibles:
                    cibles = [s for s in sortie if s[2] <= c.ligne and s[1]][-1:]
                if cibles:
                    if c.code_avant:
                        cibles[-1][3].append(c)
                    else:
                        cibles[0][3].append(c)
                    continue
            res.append(c)
        # commentaires seuls sur leur ligne : avant la premiere ligne Python
        # qui suit
        avant = {}
        fin = []
        for c in res:
            k = None
            for idx, s in enumerate(sortie):
                if s[2] > c.ligne and s[1]:
                    k = idx
                    break
            if k is None:
                fin.append(c)
            else:
                avant.setdefault(k, []).append(c)
        out = []
        for idx, (ind, t, l, trailing) in enumerate(sortie):
            for c in avant.get(idx, []):
                # un commentaire precede d'une ligne vide dans le source
                if c.ligne - 1 in self.vides:
                    out.append("")
                for ligne in commentaire_py(c.texte):
                    out.append("    " * ind + ligne)
            if (t and l - 1 in self.vides and not avant.get(idx)
                    and not t.startswith(("global ", "nonlocal "))):
                out.append("")
            if t == "":
                if out and out[-1] != "":
                    out.append("")
                continue
            ligne = "    " * ind + t
            for c in trailing:
                ligne += "  " + " ".join(commentaire_py(c.texte, une_ligne=True))
            out.append(ligne)
        for c in fin:
            for ligne in commentaire_py(c.texte):
                out.append(ligne)
        # pas de ligne vide en double, ni au debut
        res = []
        for l in out:
            if l == "" and (not res or res[-1] == ""):
                continue
            res.append(l.rstrip())
        while res and res[-1] == "":
            res.pop()
        return "\n".join(res) + "\n"


def commentaire_py(texte, une_ligne=False):
    """(* ... *) -> lignes # ... (une banniere (** ... **) garde ses
    etoiles : # * ... *)"""
    lignes = [l.strip() for l in texte[2:-2].split("\n")]
    while lignes and not lignes[-1]:
        lignes.pop()
    while lignes and not lignes[0]:
        lignes.pop(0)
    if une_ligne:
        return ["# " + " ".join(l for l in lignes if l)]
    return [("# " + l) if l else "#" for l in lignes]


def chaine_py(v):
    """litteral Python (guillemets doubles)"""
    r = []
    for ch in v:
        o = ord(ch)
        if ch == "\\":
            r.append("\\\\")
        elif ch == '"':
            r.append('\\"')
        elif ch == "\n":
            r.append("\\n")
        elif ch == "\r":
            r.append("\\r")
        elif ch == "\t":
            r.append("\\t")
        elif ch == "\b":
            r.append("\\b")
        elif o < 32 or o == 127:
            r.append("\\x%02x" % o)
        elif 128 <= o < 256 and False:
            r.append(ch)
        else:
            r.append(ch)
    return '"' + "".join(r) + '"'


# ===========================================================================

def traduire(src, fichier=""):
    toks, coms = lexer(src)
    a = Analyseur(toks)
    items = a.programme()
    vides = [k + 1 for k, l in enumerate(src.split("\n")) if not l.strip()]
    g = Generateur(coms, fichier, vides)
    return g.programme(items)


def main():
    args = sys.argv[1:]
    if args and args[0] == "--dossier":
        src, dst = args[1], args[2]
        ok = 0
        echecs = []
        # programmes traduits (ou corriges) a la main : pas ecrases
        mf = os.path.join(os.path.dirname(os.path.abspath(__file__)), "manuels.txt")
        manuels = set()
        if os.path.exists(mf):
            with open(mf) as fm:
                manuels = {l.split("#")[0].strip() for l in fm if l.split("#")[0].strip()}
        for d, _, fs in sorted(os.walk(src)):
            for f in sorted(fs):
                if not f.endswith(".ml"):
                    continue
                p = os.path.join(d, f)
                rel = os.path.relpath(p, src)
                q = os.path.join(dst, rel[:-3] + ".py")
                if rel[:-3] in manuels:
                    continue        # traduction corrigee a la main
                try:
                    with open(p, encoding="utf-8") as fp:
                        py = traduire(fp.read(), p)
                    compile(py, q, "exec")
                except Exception as e:
                    echecs.append((rel, e))
                    continue
                os.makedirs(os.path.dirname(q), exist_ok=True)
                with open(q, "w", encoding="utf-8") as fq:
                    fq.write(py)
                ok += 1
        print("%d programmes traduits" % ok)
        for rel, e in echecs:
            print("ECHEC %s : %s" % (rel, e))
        return
    for p in args:
        with open(p, encoding="utf-8") as fp:
            sys.stdout.write(traduire(fp.read(), p))


if __name__ == "__main__":
    main()
