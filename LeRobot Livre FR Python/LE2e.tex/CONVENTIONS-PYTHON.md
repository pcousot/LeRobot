# Conventions de la traduction Python du livre

Livre source : `../../LeRobot Livre FR OCaml/LE2e.tex/` (« Premières leçons de
programmation en OCaml »). Livre cible : ce dossier (« Premières leçons de
programmation en Python »). Les fichiers `.tex` de ce dossier sont au départ
des copies du livre OCaml ; il faut les réécrire pour Python.

Ce n'est pas une traduction mot à mot : le texte explique la syntaxe et le
comportement du langage. Partout où il parle d'OCaml (syntaxe, messages du
compilateur, `let`, `ref`, `begin … end`, `;;`, `float_of_int`…), il faut
expliquer l'équivalent Python, avec la même progression pédagogique, le même
ton, la même longueur à peu près, les mêmes exemples, figures, exercices et
corrigés. Ne pas enlever de contenu sans raison ; ne pas en ajouter beaucoup.
Les remarques historiques sur Pascal (édition de 1991) restent.

## Ce qui est déjà fait (ne pas refaire)

- Les listings : `python/*.tex`, composés par `py2tex.py` à partir des
  programmes de `../../LeRobot_Python_FR/livre/` (et des extraits `.extrait`).
  Les `\input ocaml/X.tex` sont déjà devenus `\input python/X.tex`. Ne pas
  modifier `python/*.tex` à la main. Si un listing ne convient pas au texte
  (programme à changer), le signaler dans le compte rendu, ne pas toucher
  aux programmes.
- Le titre (`\TITRE`, `\titre`) et la macro `\python` (lien Wikipédia), dans
  `LE2e.tex`. La macro `\ocaml` existe toujours : la garder seulement là où
  l'on parle vraiment d'OCaml (histoire, comparaison) ; ailleurs écrire
  `\python`.

## Fichiers

Ne modifier que les fichiers `.tex` attribués. Ne pas lancer `make` ni
`pdflatex` (une seule compilation à la fin, par la session principale :
les fichiers auxiliaires sont partagés). Garder la structure LaTeX : mêmes
`\section`, `\label`, `\ref`, `\index` (adapter l'entrée d'index si elle
nomme un mot-clé OCaml : `\index{let}` → `\index{def}` etc.), mêmes figures
(`\includePostScript…`), mêmes environnements d'exercices et de corrigés.
Encodage UTF-8, accents normaux.

## Mise en forme du code dans le texte

- Mots-clés Python en `{\mcl …}` : `def`, `return`, `for`, `in`, `while`,
  `if`, `elif`, `else`, `and`, `or`, `not`, `True`, `False`, `None`,
  `global`, `from`, `import`, `break`, `pass`, `lambda`.
- Identificateurs, appels, fonctions prédéfinies (`range`, `int`, `str`,
  `print`, `len`, `abs`…) en `{\idt …}`.
- Commentaires `{\cmt \# …}`, chaînes `{\cha "…"}`.
- Les commandes s'écrivent SANS espace avant les parenthèses : `{\idt av()}`,
  `{\idt pqtd()}`, `{\idt avf(3)}`, `{\idt deplacer(2, 3)}`,
  `{\idt rectangle(3, 4)}`, `{\idt lg(12)}`.
- Les petits encadrés de syntaxe (tabular avec minipage, `\mbox{\blc …}`)
  sont à refaire en Python, dans le même style (indentation : `\ \ \ \ `
  ou `\blk`).

## Correspondances OCaml → Python

| OCaml | Python |
|---|---|
| `open LibRobot` | `from LibRobot import *` |
| `let () = …` (instructions du programme) | les instructions au niveau du programme (pas d'en-tête), après les définitions |
| `(* commentaire *)` | `# commentaire` (jusqu'à la fin de la ligne) |
| `av (); av ()` | `av(); av()` sur une ligne, ou une instruction par ligne |
| séparateur `;`, pas de `;` après la dernière | une instruction par ligne (ou `;` entre deux instructions d'une même ligne) ; pas de `;` final |
| `let nom () = corps` (procédure) | `def nom():` puis le corps indenté (4 espaces) |
| `begin … end` | l'indentation (bloc) |
| `;;` | (sans objet : supprimer le passage) |
| `let f x y = …` ; appel `f 3 4` | `def f(x, y):` ; appel `f(3, 4)` |
| `deplacer (x, y)` | `deplacer(x, y)` |
| `let n = 12` (constante) | `n = 12` |
| `let x = e in …` (dans une procédure) | `x = e` (variable locale) |
| `let x = ref 0` ; `!x` ; `x := !x + 1` | `x = 0` ; `x` ; `x = x + 1` ou `x += 1` ; dans une procédure qui modifie une variable du programme : `global x` |
| `incr x` | `x += 1` |
| `for i = 1 to n do … done` | `for i in range(1, n + 1):` ; si `i` ne sert pas : `for i in range(n):` |
| `for i = n downto 1 do` | `for i in range(n, 0, -1):` |
| `while c do … done` | `while c:` |
| repeat … until (`while begin …; not c end do () done`) | `while True:` … `if c: break` |
| `if c then a else b` | `if c:` / `elif …:` / `else:` |
| `match x with \| 1 -> … \| _ -> …` | `if x == 1: … elif …: … else: …` |
| `=` , `<>` (comparaison) | `==`, `!=` |
| `&&`, `\|\|`, `not` | `and`, `or`, `not` |
| `true`, `false` | `True`, `False` |
| `a / b`, `a mod b` (entiers) | `a // b`, `a % b` (attention : arrondis vers le bas pour les négatifs : `-7 // 2 == -4`, alors qu'OCaml donne `-3`) |
| `a /. b`, `+.`, `*.` (réels) | `/`, `+`, `*` (mêmes opérateurs pour entiers et réels ; `/` donne toujours un réel : `7 / 2 == 3.5`) |
| `float_of_int n` | inutile : `lg(2 * y)` (Python convertit tout seul) ; `float(n)` existe |
| `int_of_float x`, `truncate` | `int(x)` (tronque) ; `round(x)` arrondit |
| `string_of_int n` | `str(n)` |
| `"a" ^ "b"` | `"a" + "b"` |
| `write ["x = "; string_of_int x]` | `write("x = ", x)` |
| fonction : la valeur est la dernière expression | `return expression` |
| `let rec f n = …` | `def f(n):` (la récursivité ne demande rien de spécial) |
| `heure h m s` (références) | `h, m, s = heure()` |
| `interactionTP x y c a b c d e` | `x, y, c = interactionTP(a, b, c, d, e)` |
| paramètre `var` de Pascal / référence passée en paramètre | la procédure rend la valeur : `xmax = tracerUnAxe(1)` |
| `lireEntier ()`, `lireCar ()` | `lireEntier()`, `lireCar()` |

Règles des identificateurs en Python : lettres, chiffres et soulignés `_`,
ne commençant pas par un chiffre, différents des mots réservés (`def`, `for`,
`in`, `if`, `while`, `return`, `True`…). Majuscules et minuscules sont
distinguées (`Carre` et `carre` sont deux noms différents) ; une majuscule
initiale est permise (contrairement à OCaml), mais l'usage est de commencer
par une minuscule. Le livre garde le style `croixDeSaintAndre`. Python accepte
les lettres accentuées dans les noms, mais le livre les évite.

## Exécution, erreurs

- Python est interprété : pas de compilation séparée. `./robot.sh
  livre/03_programmation/Carre.py` (dans `LeRobot_Python_FR`) ou glisser le
  fichier sur l'application `LeRobotPython.app`. Python lit tout le
  programme et vérifie sa syntaxe (`SyntaxError`, `IndentationError`) avant
  d'exécuter la première instruction ; les autres erreurs (nom inconnu
  `NameError`, mauvais nombre de paramètres `TypeError`, sortie du cadre)
  apparaissent pendant l'exécution, quand le robot arrive à l'instruction
  fautive : le dessin est alors fait jusque-là.
- Les messages cités doivent être les vrais messages de Python 3.10, celui
  qu'utilise LeRobot. Les vérifier en exécutant de petits programmes avec
  `/Library/Frameworks/Python.framework/Versions/3.10/bin/python3`
  (pour un programme qui utilise le robot : voir plus bas). Exemples :
  `NameError: name 'pgtg' is not defined. Did you mean: 'phtg'?`,
  `SyntaxError: unterminated triple-quoted string literal`,
  `IndentationError: expected an indented block after function definition on line 3`,
  `TypeError: av() takes 0 positional arguments but 1 was given`.
- Sortie du cadre : le programme s'arrête avec
  `Erreur ligne N de Programme.py : le robot sortirait du cadre (av)` et la
  fenêtre reste ouverte. Récursivité sans fin :
  `Erreur ligne N de Programme.py : recursivite sans fin (pile pleine)`.
- Dessiner : `python3 Dessiner.py` ou double-clic sur `LeRobotPython.app` ;
  sauvegarde dans `mon_dessin.py`, rejouée par `make mon_dessin` ou en le
  glissant sur l'application.
- Fin d'un programme : `st()` (vitesse `+`/`-`, autre touche : redessiner,
  Échap : quitter). Échap (ou `§`, `#`) arrête le robot pendant le dessin.
- Les entrées-sorties : `write`, `writeln`, `lireEntier`, `lireCar`… (voir
  `../../LeRobot_Python_FR/LibRobot.py`).

Pour exécuter un programme du robot sans ouvrir de fenêtre (vérifier un
comportement) :

```
cd ../../LeRobot_Python_FR    # depuis ce dossier LE2e.tex
LEROBOT_CAPTURE=/tmp/x.png LEROBOT_MUET=1 PYTHONPATH=$PWD \
  /Library/Frameworks/Python.framework/Versions/3.10/bin/python3 programme.py
```

(le dessin est enregistré dans le PNG ; ne jamais envoyer de touches ni de
clics aux fenêtres ouvertes sur l'écran.)

## Références

- Programmes : `../../LeRobot_Python_FR/livre/NN_xxx/*.py` (traduits des
  programmes OCaml `../../LeRobot_OCaml_FR/livre/`).
- Bibliothèque : `../../LeRobot_Python_FR/LibRobot.py`, `LeRobot.py`,
  `README.md` (différences avec OCaml).
- Manuel : `../../LeRobot_Manual_Python/LeRobot_Manual.tex`.

## Compte rendu attendu de chaque traducteur

Liste des fichiers modifiés, des passages délicats (ce qui a été réécrit
plutôt que traduit), des messages d'erreur vérifiés, et des listings ou
programmes qui ne collent pas au texte.
