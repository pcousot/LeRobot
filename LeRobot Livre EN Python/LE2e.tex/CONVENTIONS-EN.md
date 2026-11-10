# Conventions for the English translation of the Python book

Source book: `../../LeRobot Livre FR Python/LE2e.tex/` (« Premières leçons de
programmation en Python »). Target: this folder, *First Programming Lessons
in Python*. The `.tex` files here start as copies of the French ones; each
translator rewrites the files assigned to them, in place, in English.

Translate the whole text faithfully: same structure, same examples,
figures, exercises and solutions, same tone (a book for schoolchildren and
beginners, clear and friendly, precise). Do not summarise, do not add
material, do not drop sentences. Natural English, not word-for-word.
Historical remarks (Pascal 1991 edition, OCaml, Caml Light) stay.

## What must NOT change

- LaTeX structure: same `\section`, `\subsection`, `\label`, `\ref`,
  `\pageref`, `\input`, figures (`\includePostScript…`,
  `\includevspacePostScript…`), `\vspace`, `\newpage`, `\vfill`,
  `\enlargethispage`, minipages, boxes (`\framebox`, `\parbox`),
  environments `exemple`, `exercice`, `exercices`, `corrige`, `corriges`
  (keep these environment names; their printed names become Example,
  Exercise, Solution in the preamble). Layout commands stay where they are
  even if English text is shorter: the layout is fixed afterwards.
- `\input python/X.tex` (program listings): never edit `python/*.tex` (the
  comments of the listings are translated separately).
- Robot commands and program identifiers keep their (French) names:
  `{\idt av()}`, `{\idt pqtd()}`, `{\idt carre}`, `{\idt traitPointille}`.
  The programs are the same as in the French edition.
- Strings displayed by the programs and messages printed by LeRobot stay
  in French, verbatim, because that is what the reader sees on the screen;
  give the English meaning after them in parentheses the first time, e.g.
  `Erreur ligne 3 de Carre.py : le robot sortirait du cadre (av)` ("the
  robot would leave the frame"). Python's own messages (`NameError: …`,
  `SyntaxError: …`) are English already: keep them exactly.
- Keys of the keyboard: keep them (French AZERTY keyboard remarks stay,
  translated).

## Robot commands: explain the French names

The command names are abbreviations of French words, and the French book
explains them that way (e.g. « av pour AVancer »). Keep that explanation,
with the French word in italics and its English meaning, e.g.:
`{\idt av()} (from the French {\em avancer}, ``move forward'')`,
`{\idt pqtd()} ({\em pivoter d'un quart de tour à droite}, ``turn a
quarter turn to the right'')`, `{\idt bc()} ({\em baisser le crayon},
``pen down'')`. Do it at the place where the French text explains the
abbreviation; elsewhere just use the command. Likewise, the first time a
French identifier of a program matters to the explanation, gloss it once:
`{\idt carre} (``square'')`.

## Vocabulary

| French | English |
|---|---|
| le robot (il) | the robot (it) |
| le cadre | the frame |
| la grille, les points de la grille | the grid, the grid points |
| le crayon (baissé / levé) | the pen (down / up) |
| pivoter, pivotement | turn (pivot), turn |
| quart de tour, huitième de tour, demi-tour | quarter turn, eighth turn, half turn |
| à droite / à gauche | to the right / to the left |
| nord, sud, est, ouest | north, south, east, west |
| programme, procédure, fonction | program, procedure, function |
| paramètre, argument | parameter, argument |
| boucle « for » / « while » | ``for'' loop / ``while'' loop |
| test « if » | ``if'' statement (test) |
| expression entière / booléenne / rationnelle | integer / boolean / rational expression |
| variable, constante | variable, constant |
| récursivité, récursif | recursion, recursive |
| exemple, exercice, corrigé | example, exercise, solution |
| addendum, addenda | addendum, addenda |
| exécuter, interpréter | run (execute), interpret |
| pavage | tiling |
| frise | frieze |
| dessin | drawing |
| peindre, peinture | paint, painting |
| écolier, collégien, lycéen | primary-school pupil, middle-school pupil, high-school pupil |

## Typography

- Remove French spacing before punctuation: `\:`, `\,`, `~` before `;` `:`
  `!` `?` and inside « ». French quotes « … » become ``…''.
- Decimal comma → decimal point in prose (`4,5` → `4.5`).
- Ordinals: `1er`, `2e` → `1st`, `2nd`.
- Accents disappear with the French words; keep UTF-8 for names and for the
  French words you quote.
- Index: translate the index entries (`\index{boucle}` → `\index{loop}`),
  keep entries that are command or keyword names as they are
  (`\index{av}`, `\index{def}`).
- Captions and `\section` titles translated; `\label` unchanged.

## Files

Edit only the files assigned to you. Do not run `make` or `pdflatex` (one
compilation at the end, by the main session). Encoding UTF-8.

## Report

List of files translated, delicate passages (puns, wordplay on French
words, AZERTY remarks, cultural references, figures whose pictures contain
French words), and anything you could not translate faithfully.
