"""noms -- the English names of the robot's commands (English edition).

The robot's library is the French one (LeRobotFR.py, LibRobotFR.py and the
modules they use); LeRobot.py and LibRobot.py give it English names, built
from the table NOMS below (French name -> English name). Messages that name
a command (``the robot would leave the frame (fd)'') use ANGLAIS.
"""

NOMS = {
    # moving
    "av": "fd", "avf": "fdn", "tl": "fdl", "vd": "cr", "vg": "cl",
    # turning on the spot
    "phtd": "etr", "phtg": "etl", "pqtd": "qtr", "pqtg": "qtl",
    "p3htd": "tetr", "p3htg": "tetl", "pdt": "ht", "rt": "rot",
    "pivoter": "face",
    "pn": "fn", "pne": "fne", "pe": "fe", "pse": "fse", "ps": "fs",
    "psw": "fsw", "pw": "fw", "pnw": "fnw",
    # tests (the French names read in English: test north, test border)
    "tn": "tn", "tne": "tne", "te": "te", "tse": "tse", "ts": "ts",
    "tsw": "tsw", "tw": "tw", "tnw": "tnw", "tb": "tb",
    # pen, colours, painting
    "bc": "pd", "lc": "pu", "dp": "dp", "dc": "dc", "dg": "dg",
    "cc": "pc", "ec": "pw", "cf": "bg", "peindre": "paint",
    # jumps and moves without drawing
    "ce": "gc", "eh": "gt", "eb": "gb", "ad": "gr", "ag": "gl",
    "translater": "translate", "deplacer": "moveTo", "tracer": "drawTo",
    "deplacerReel": "moveToReal", "tracerReel": "drawToReal",
    # grid
    "lg": "gs", "lgX": "gsX", "lgY": "gsY", "lgRT": "gsRT",
    # speed, end
    "vt": "sp", "pp": "ss", "ex": "ex", "st": "st",
    # robot, frame
    "montrerRobot": "showRobot", "cacherRobot": "hideRobot",
    "autoriserSorties": "allowExits", "interdireSorties": "forbidExits",
    # values
    "valX": "valX", "valY": "valY", "valOrientation": "valOrientation",
    "valLgX": "valGsX", "valLgY": "valGsY", "valLgR": "valGsR",
    "valLgT": "valGsT", "valLgTl": "valFdl", "valBc": "valPd",
    "valCc": "valPc", "valCf": "valBg", "valEc": "valPw", "valVt": "valSp",
    "valVisible": "valVisible", "valAutoriserSorties": "valAllowExits",
    "valMessage": "valMessage", "valPoliceTexte": "valTextFont",
    "valTailleTexte": "valTextSize",
    # texts
    "message": "message", "effacerMessage": "clearMessage", "ecrire": "label",
    "policeTexte": "textFont", "tailleTexte": "textSize",
    "styleTexte": "textStyle",
    "entierEnChaine": "intToString", "reelEnChaine": "realToString",
    "booleenEnChaine": "boolToString", "concat": "concat",
    "copy": "copy", "pos": "pos", "delete": "delete", "insert": "insert",
    "sprintf": "sprintf",
    # terminal input and output
    "write": "write", "writeln": "writeln", "readln": "readln",
    "lireEntier": "readInt", "lireReel": "readReal",
    "lireChaine": "readString", "lireCar": "readChar",
    "lireCaractere": "readCharacter",
    "modeTexte": "textMode", "modeDessin": "drawingMode",
    "effacerTexte": "clearText", "sortieTerminal": "terminalOutput",
    "ecranNoirEtBlanc": "blackAndWhiteScreen",
    # interaction
    "interaction": "interaction", "interactionTP": "interactionTP",
    "init_pict": "init_pict", "enreg": "record",
    # time and sound
    "heure": "clock", "date": "date", "tickCount": "tickCount",
    "delai": "delay", "marquerUnePause": "markPause",
    "bip": "beep", "biiip": "longBeep", "note": "note", "silence": "rest",
    "metronome": "metronome", "nuance": "dynamics",
    "vider_sons": "flushSounds",
    # numbers
    "odd": "odd", "sqr": "sqr", "sqr_reel": "sqr_real", "round": "round",
    "trunc": "trunc", "random": "random", "intervalle": "interval",
    # constants: colours
    "blanc": "white", "jaune": "yellow", "bleu": "blue", "violet": "violet",
    "vert": "green", "rouge": "red", "indigo": "indigo", "noir": "black",
    "gris": "grey",
    # constants: directions
    "nord": "north", "nordEst": "northEast", "est": "east",
    "sudEst": "southEast", "sud": "south", "sudOuest": "southWest",
    "ouest": "west", "nordOuest": "northWest",
    # constants: text styles and fonts
    "normal": "normal", "gras": "bold", "italique": "italic",
    "souligne": "underline", "contour": "outline", "ombre": "shadow",
    "condense": "condensed", "etendu": "extended",
    "courier": "courier", "geneva": "geneva", "monaco": "monaco",
    "chicago": "chicago", "newYork": "newYork", "times": "times",
    "helvetica": "helvetica",
    # constants: notes (do re mi ... = C D E ...)
    "do0": "C", "d0": "C", "ut": "C", "re": "D", "mi": "E", "fa": "F",
    "sol": "G", "la": "A", "si": "B", "octave": "octave",
    "diese": "sharp", "bemol": "flat", "becarre": "natural",
    # constants: note values and rests
    "ronde": "whole", "blanche": "half", "noire": "quarter",
    "croche": "eighth", "double_croche": "sixteenth",
    "triple_croche": "thirty_second",
    "ronde_pointee": "dotted_whole", "blanche_pointee": "dotted_half",
    "noire_pointee": "dotted_quarter", "croche_pointee": "dotted_eighth",
    "double_croche_pointee": "dotted_sixteenth",
    "noire_en_triolet": "quarter_triplet",
    "croche_en_triolet": "eighth_triplet",
    "blanche_en_triolet": "half_triplet",
    "pause": "whole_rest", "demi_pause": "half_rest",
    "soupir": "quarter_rest", "demi_soupir": "eighth_rest",
    "quart_de_soupir": "sixteenth_rest",
    "huitieme_de_soupir": "thirty_second_rest",
    "soupir_pointe": "dotted_quarter_rest",
    "demi_soupir_pointe": "dotted_eighth_rest",
    "demi_pause_pointee": "dotted_half_rest",
    # constants: tempo and dynamics (Italian, as in music)
    "largo": "largo", "larghetto": "larghetto", "lento": "lento",
    "adagio": "adagio", "andante": "andante", "andantino": "andantino",
    "moderato": "moderato", "allegretto": "allegretto", "allegro": "allegro",
    "vivace": "vivace", "presto": "presto", "prestissimo": "prestissimo",
    "pianississimo": "pianississimo", "pianissimo": "pianissimo",
    "piano": "piano", "mezza_voce": "mezza_voce", "mezzo_piano": "mezzo_piano",
    "mezzo_forte": "mezzo_forte", "forte": "forte", "fortissimo": "fortissimo",
    "fortississimo": "fortississimo",
    # other constants
    "maxInt": "maxInt", "maxLongint": "maxLongint", "pi": "pi",
    "lgDefaut": "defaultGridSize",
    "mementoCommandesClavier": "keyboardCommandsMemento",
}

# names of the parameters (they appear in Python's error messages)
PARAMETRES = {
    "hauteur": "pitch", "duree": "duration", "secondes": "seconds",
    "chaine": "string", "taille": "size", "liste": "items",
    "valeurs": "values", "textes": "texts",
    "coordonnees": "coordinates", "pivotements": "turns",
    "dessin": "drawing", "finsouris": "mouseEnds", "sauver": "save",
}

ANGLAIS = dict(NOMS)


def anglais(nom):
    """English name of a French command (or the name itself)"""
    return ANGLAIS.get(nom, nom)


def exporter(module, espace):
    """met dans le dictionnaire espace (les globales d'un module) les noms
    anglais des commandes et constantes de module (LeRobotFR ou LibRobotFR) :
    une fonction anglaise de meme signature appelle la fonction francaise,
    pour que les messages d'erreur de Python citent le nom anglais"""
    import inspect
    for fr, en in NOMS.items():
        if not hasattr(module, fr):
            continue
        v = getattr(module, fr)
        if not callable(v) or isinstance(v, type):
            espace[en] = v
            continue
        try:
            sig = inspect.signature(v)
        except (TypeError, ValueError):
            espace[en] = v
            continue
        params, appel, defauts = [], [], {}
        for p in sig.parameters.values():
            n = PARAMETRES.get(p.name, p.name)
            if p.kind == p.VAR_POSITIONAL:
                params.append("*" + n); appel.append("*" + n)
            elif p.kind == p.VAR_KEYWORD:
                params.append("**" + n); appel.append("**" + n)
            elif p.default is not p.empty:
                defauts["_d_" + n] = p.default
                params.append("%s=_d_%s" % (n, n)); appel.append(n)
            else:
                params.append(n); appel.append(n)
        source = "def %s(%s):\n    return _f(%s)\n" % (en, ", ".join(params), ", ".join(appel))
        local = dict(defauts, _f=v)
        exec(source, local)
        g = local[en]
        g.__module__ = espace.get("__name__", g.__module__)
        g.__doc__ = v.__doc__
        espace[en] = g
