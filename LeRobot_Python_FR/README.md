# LeRobot — traduction Python de la version OCaml

Traduction en Python de la bibliothèque graphique « LeRobot »
(`../LeRobot_OCaml_FR/`), du programme interactif `Dessiner` et des
programmes du livre « Premières leçons de programmation ». La version
OCaml n'est pas modifiée.

Manuels (en anglais, comme ceux de la version OCaml) :
`../LeRobot_Manual_Python/LeRobot_Install.pdf` (installation sur un autre
Mac) et `../LeRobot_Manual_Python/LeRobot_Manual.pdf` (utilisation) ;
`make` dans ce dossier les recompile.

## Lancer

```sh
cd LeRobot_Python_FR
python3 Dessiner.py                               # dessin interactif
./robot.sh livre/03_programmation/Carre.py        # un programme du livre
./robot.sh ~/ailleurs/MonProgramme.py             # un programme n'importe où
make Dessiner          # = ./robot.sh Dessiner.py
make mon_dessin        # le dessin sauvé par Dessiner
make run PROG=livre/20_grille_polaire/LimaconDePascal
make verifier          # fait défiler les programmes du livre (voir plus bas)
```

**Application `LeRobotPython.app`** (comme `LeRobotOCaml.app` de la version
OCaml) : un double-clic sur l'icône lance `Dessiner.py` ; faire glisser
l'icône d'un programme Python (`.py`) sur celle de l'application
l'exécute dans la fenêtre du robot. Le programme tourne dans une fenêtre
du Terminal, qui se ferme à la fin normale du programme (Échap) et reste
ouverte en cas d'erreur pour lire le message. L'application doit rester
dans `LeRobot_Python_FR`, à côté de `robot.sh` (le dossier `LeRobot` peut
être n'importe où : tous les chemins sont relatifs) ; on
peut en mettre un alias dans le Dock ou sur le Bureau. Elle est
construite par `outils/app/fabriquer.sh` (source
`outils/app/LeRobotPython.applescript`, icône du robot reprise de
`LeRobotOCaml.app`). Pas de XQuartz à démarrer.

`python3 Dessiner.py` marche depuis ce répertoire. Pour un programme
placé ailleurs (ou dans `livre/`), passer par `./robot.sh`, qui ajoute ce
répertoire au chemin de Python (`PYTHONPATH`) et lance le programme
depuis son répertoire.

**Python et Tk.** Il faut un Python lié à Tk 8.6 ou plus. Le `python3` de
macOS (`/usr/bin/python3`, Python 3.9) est lié à Tk 8.5, qui ne marche
plus sur les macOS récents : la fenêtre ne s'ouvre pas et le programme
reste bloqué. La bibliothèque le détecte et se relance d'elle-même avec le
premier Python correct trouvé : celui de python.org
(`/Library/Frameworks/Python.framework/...`, ici Python 3.10 avec
Tk 8.6.12), puis Homebrew (`brew install python-tk`). On peut aussi
imposer un Python : `LEROBOT_PYTHON=/chemin/python3 ./robot.sh X.py`.
La bibliothèque marche avec Python 3.9 ou plus.

## Écrire un programme

```python
from LibRobot import *      # les programmes du livre (grille de 12, noir)

# Dessiner un carré
av(); av(); pqtd(); av(); av(); pqtd()
av(); av(); pqtd(); av(); av(); pqtd()
st()
```

Les commandes gardent leurs noms français : `av`, `vd`, `vg`, `avf`,
`pqtd`, `pqtg`, `phtd`, `phtg`, `p3htd`, `pdt`, `pn` … `pnw`, `pivoter`,
`rt`, `lg`, `lgX`, `lgY`, `lgRT`, `dg`, `tl`, `ce`, `eh`, `eb`, `ad`,
`ag`, `bc`, `lc`, `dc`, `dp`, `ec`, `cc`, `cf`, `peindre`, `vt`, `pp`,
`ex`, `st`, `cacherRobot`, `montrerRobot`, `autoriserSorties`,
`ecrire`, `message`, `lireCar`, `lireEntier`, `write`, `writeln`, etc.

Différences d'écriture dues au langage :

| OCaml                             | Python                         |
|-----------------------------------|--------------------------------|
| `open LibRobot`                   | `from LibRobot import *`       |
| `av ()`                           | `av()`                         |
| `deplacer (x, y)`, `lgRT (r, t)`  | `deplacer(x, y)`, `lgRT(r, t)` |
| `lg (float_of_int (2 * y))`       | `lg(2 * y)`                    |
| `let x = ref 0 … x := !x + 1`     | `x = 0 … x += 1` (`global x` dans une fonction) |
| `for i = 1 to n do … done`        | `for i in range(1, n + 1):`    |
| `a / b`, `a mod b` (entiers)      | `a // b`, `a % b`              |
| `write ["x = "; string_of_int x]` | `write("x = ", str(x))`        |
| `heure h m s` (références)        | `h, m, s = heure()`            |
| `interactionTP x y c a b c d e`   | `x, y, c = interactionTP(a, b, c, d, e)` |
| `sortie_terminal := false`        | `sortieTerminal(False)`        |

Attention : pour un entier négatif, `//` et `%` de Python arrondissent
vers le bas (`-7 // 2 == -4`, `-7 % 2 == 1`) alors que `/` et `mod`
d'OCaml arrondissent vers zéro (`-3` et `-1`).

`LeRobot` (sans `Lib`) est l'interface d'origine (grille de 30 pixels,
couleurs données par leur valeur RGB) ; c'est celle de `mon_dessin.py`.

## Dessiner

```sh
python3 Dessiner.py
```

| touche | commande | touche | commande |
|---|---|---|---|
| `-` | pqtg | `+` | pqtd |
| `g` | phtg | `d` | phtd |
| `a` | av | `(` / `)` | vg / vd |
| `b` | bc | `l` | lc |
| `c` | dc | `.` | dg (points de la grille) |
| `p` | dp | `*` | couleur suivante (`cc N`) |
| `w` | peindre | retour arrière | annuler la dernière commande |
| flèches | déplacer le robot d'un carreau, sans tracer (`translater`) | | |
| Entrée | fin, puis `y` pour sauver dans `mon_dessin.py` | | |

Un clic (ou un déplacement bouton enfoncé) amène le robot, sans tracer,
au point de la grille le plus proche de la souris.
Si le robot sortirait du cadre, il refuse et proteste par un bip-bip
(module `Son.py`, coupé par `LEROBOT_MUET=1`).

Le dessin sauvé est un programme Python :

```python
# Mon joli dessin
from LeRobot import *

init_pict(); ce()
av(); av(); pqtd(); av(); av(); cc(0)  # blanc
av(); translater(5, 3); av(); cc(1)  # jaune
av(); vg(); av(); vd(); dg(); st()
```

À la fin d'un programme, `st()` affiche dans la barre du bas : `+` / `-`
changent la vitesse, une autre touche redessine, Échap ferme la fenêtre.
Échap (ou `§`, `#`) pendant le dessin l'arrête.

## Programmes du livre

`livre/NN_xxx/*.py` : les 406 programmes de `../LeRobot_OCaml_FR/livre`,
un sous-répertoire par chapitre. 401 ont été traduits automatiquement par
`outils/ocaml2py.py` (traducteur du sous-ensemble d'OCaml employé par le
livre, qui garde les commentaires et la disposition des lignes) ; les
autres, ou ceux dont un commentaire parlait d'OCaml, ont été traduits ou
corrigés à la main (liste dans `outils/manuels.txt`, que la retraduction
n'écrase pas) :

- `Apprendre_Repere`, `Apprendre_Translation`, `Addition_A_Completer` :
  une procédure modifiait un paramètre passé par référence (paramètre
  `var` de Pascal) ; en Python elle rend la valeur
  (`xmax = tracerUnAxe(1)`).
- `PavageDuTriangleAlaEscherPt` : `List.fold_left` → `sum(...)`.
- `CocotteErronee` : les erreurs volontaires sont des erreurs Python de
  débutant (import oublié, chaîne de documentation `"""` non fermée, faute
  de frappe `pgtg`, parenthèse de `st(` non fermée) ; Python signale
  d'abord `unterminated triple-quoted string literal`.

```sh
make traduire     # retraduit depuis ../LeRobot_OCaml_FR/livre
make verifier                      # tous les programmes, un par un
make verifier DIR=02_interaction   # un seul chapitre
make verifier DEPUIS=Chiffre4      # reprendre à un programme
make capturer     # exécute tout sans fenêtre, dessins dans captures/
```

Pour `make verifier`, on répond dans la fenêtre du robot quand le dessin
est fini : Entrée = correct, `r` = relancer, `q` ou Échap = arrêter, une
autre touche commence une remarque (finie par Entrée) notée dans
`verification.txt`. Les programmes qui posent des questions les posent
dans la barre du bas de la fenêtre et dans le terminal ; on répond dans
l'un ou l'autre. `LEROBOT_MUET=1` coupe le son.

`make capturer` (mode capture : `LEROBOT_CAPTURE=fichier.png`) exécute
chaque programme sans montrer de fenêtre ni attendre, et enregistre le
dessin en PNG (sans les textes). Les réponses aux questions sont dans
`outils/reponses/`. Programmes qui ne finissent pas, volontairement :
`Boucle1`, `Boucle2` (boucles sans fin), `NonTerminaison` (récursivité
sans fin : « Erreur ligne 6 : récursivité sans fin »), `MontreDigitale`
(horloge).

## Choix de la bibliothèque graphique : tkinter

- **Disponible sans rien installer** avec le Python de python.org (et
  avec Homebrew `python-tk`) ; aucun serveur X : la fenêtre est une vraie
  fenêtre macOS (Aqua), plus besoin de XQuartz ni de `/tmp/.X11-unix`.
- **Pas de dépendance** : ni Pillow, ni pygame, ni Qt. pygame et PyQt
  auraient demandé `pip install` ; turtle (fondé sur tkinter) ne permet
  pas de lire la couleur d'un pixel, indispensable pour `peindre`, ni de
  dessiner le crayon carré du Macintosh.
- **Fidélité au comportement OCaml** : le module `Graphics.py` émule le
  module `Graphics` d'OCaml sur tkinter, avec les mêmes conventions
  (origine en bas à gauche, point courant, `point_color`, `draw_arc`,
  `fill_poly`, `wait_next_event`…). Le dessin est fait dans une image en
  mémoire (pixels RGB) recopiée dans une `PhotoImage` ; `peindre` lit les
  pixels de cette image. Les modules du robot sont ainsi traduits presque
  ligne à ligne et donnent les mêmes pixels (positions en flottants
  arrondies au pixel, traits épais tracés par l'enveloppe du crayon carré,
  remplissage par lignes).

Différences avec la version OCaml :

- le robot est une petite image posée sur le dessin (objet du canevas),
  et non dessiné dans l'image avec sauvegarde du fond ; le résultat est le
  même (le robot n'est jamais pris pour un trait par `peindre`) ;
- le texte (`ecrire`, barre du bas) est un objet texte de tkinter
  (Helvetica 13) posé sur le dessin : `peindre` ne le voit pas, et il
  disparaît quand un rectangle plein le recouvre (barre du bas) ;
- la fenêtre est rafraîchie au plus 30 fois par seconde à la vitesse 10
  (et à chaque commande aux vitesses inférieures) ;
- les arcs (`vd`, `vg`) sont calculés point par point : ils diffèrent
  d'un pixel par endroits de ceux de X11, et les arcs épais (`ec` > 1)
  sont tracés en posant le crayon carré le long de l'arc ;
- `fill_rect x y w h` peint, comme Graphics sous X11, (w+1)×(h+1)
  pixels (un point de grille de `cotePointGrille = 2` fait donc 3×3
  pixels, comme dans la version OCaml) ; `fill_poly` peint les pixels
  dont le centre est dans le polygone, comme X11 ;
- fermer la fenêtre (bouton rouge) termine le programme.
- les touches flèches sont vues (Graphics sous X11 ne les voyait pas) :
  dans Dessiner et dans `interactionTP` (`Addition_A_Completer`,
  `Apprendre_Repere`…), elles déplacent le robot d'un carreau, comme la
  souris (la version OCaml fait de même depuis le 9 novembre 2026) ; `lireCar`
  les rend comme les caractères 28 à 31 du Macintosh (gauche, droite,
  haut, bas).

## Fichiers

| Python | OCaml | contenu |
|---|---|---|
| `Graphics.py` | (bibliothèque Graphics) | émulation de Graphics sur tkinter |
| `Utile.py` | `utile.ml` | pi, degrés, exception `Stop` |
| `Grille.py` | `Grille.ml` | la grille (lX, lY) |
| `Graph.py` | `Graph.ml` | la fenêtre 800×700, la barre du bas |
| `Dessin.py` | `Dessin.ml` | couleurs, dessins du robot (×3) |
| `Robot.py` | `Robot.ml` | position, orientation, crayon, tests de bord |
| `Principal.py` | `Principal.ml` | les commandes, `st`, `peindre` |
| `Peinture.py` | `Peinture.ml` | remplissage par lignes (`remplir`) |
| `Ecriture.py` | `Ecriture.ml` | message, lireCar |
| `Interaction.py` | `Interaction.ml` | clavier et souris de Dessiner |
| `LeRobot.py` | `LeRobot.ml(i)` | l'interface de la bibliothèque |
| `LibRobot.py` | `LibRobot.ml` | compléments Turbo Pascal (sons, lectures…) |
| `Dessiner.py` | `Dessiner.ml` | le dessin interactif |
| `robot.sh`, `lancer.sh` | idem | lancement |
| `verifier.sh`, `Makefile` | idem | vérification, raccourcis |
| `outils/ocaml2py.py` | — | traducteur des programmes du livre |
| `outils/tout_capturer.py` | — | exécution de tous les programmes en PNG |

Le remplissage par germes de `Peinture.ml` (fonction `peindre`, que
`Principal` n'utilise plus depuis `remplir`) et les types de
l'interprète de `utile.ml` (inutilisés) n'ont pas été repris.

`Didactitiels_et_jeux/Chapeau` et `PavageDeChapeaux` (hors du livre) : le « chapeau » de David Smith (2022), tuile unique apériodique, et un pavage de la fenêtre par 181 chapeaux (versions anglaises : `../LeRobot_Python_EN/book/tutorials_and_games/HatTile.py`, `HatTiling.py`).

`Spectre` et `PavageDeSpectres` : le Spectre (2023), tuile unique apériodique qu'il n'est jamais nécessaire de retourner, et un pavage de la fenêtre par 204 Spectres.
