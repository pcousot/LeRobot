# Didacticiels et jeux

Les programmes de ce dossier ne sont pas dans les chapitres du livre. Pour
les lancer, depuis le dossier `LeRobot_Python_FR` :

```sh
./robot.sh livre/Didactitiels_et_jeux/PavageDeChapeaux.py
```

ou faire glisser le fichier sur `LeRobotPython.app`.

| Programme | Ce qu'il fait |
|---|---|
| `Addition_A_Completer.py` | un didacticiel : compléter une addition, chiffre par chiffre, en désignant une case avec la souris ou les flèches (programme Pascal de 1991) |
| `Dessiner.py` | le dessin interactif, sauvé dans `mon_dessin.py` (le programme de 1991 ; `Dessiner.py` du dossier principal fait la même chose) |
| `MontreDigitale.py` | une montre digitale (ne s'arrête jamais : Échap l'arrête) |
| `CheminementAuHasard.py` | le robot se promène au hasard |
| `Chapeau.py` | le « chapeau », tuile unique apériodique, et son image dans un miroir |
| `PavageDeChapeaux.py` | la fenêtre pavée par 181 chapeaux |
| `Spectre.py` | le « Spectre », tuile unique apériodique chirale |
| `PavageDeSpectres.py` | la fenêtre pavée par 204 Spectres |

Les quatre derniers sont nouveaux (2026). Ils montrent deux découvertes
récentes, avec seulement ce que le livre enseigne (`rt`, `tl`, `deplacerReel`, `tracerReel`, `peindre`, listes et boucles).

## Tuiles uniques apériodiques

Un *pavage* recouvre tout le plan de tuiles, sans trou ni chevauchement.
Des carrés, des triangles ou des hexagones pavent le plan de façon
*périodique* : on peut faire glisser le pavage sur lui-même. Depuis les
années 1960, on connaît des ensembles de tuiles qui ne pavent le plan que
de façon *non périodique* (Berger, puis Penrose avec deux tuiles, 1974).
Qu'une **seule** tuile y suffise est resté une question ouverte pendant
cinquante ans : le problème de l'« einstein » (de l'allemand *ein Stein*,
une pierre).

- **Le chapeau** (« hat », David Smith, novembre 2022 ; démontré avec
  Joseph Samuel Myers, Craig S. Kaplan et Chaim Goodman-Strauss, *An
  aperiodic monotile*, 2023) est la première réponse. Il est formé de 8
  cerfs-volants de la grille hexagonale de cerfs-volants (chaque hexagone
  coupé en 6 cerfs-volants par les segments qui joignent son centre aux
  milieux de ses côtés). Ses 13 côtés ont pour longueurs 1 et √3 (un côté,
  de longueur 2, est formé de deux côtés de longueur 1 alignés) ; ses coins
  tournent de 60 ou 90 degrés. Mais certains chapeaux d'un pavage doivent
  être **retournés** (images dans un miroir) : environ un sur sept.
- **Le Spectre** (mêmes auteurs, *A chiral aperiodic monotile*, 2023)
  n'a pas besoin d'image dans un miroir. Le polygone `Tile(1,1)` a les
  mêmes 14 côtés que le chapeau, dans les mêmes directions (multiples de
  30 degrés), mais tous de longueur 1. Il pave le plan sans être retourné,
  mais certains pavages pourraient encore mélanger des copies retournées.
  Remplacer **chaque côté par la même courbe en S** l'interdit : un S
  s'emboîte dans un S, mais pas un S retourné. Cette tuile courbe est le
  Spectre.

## Les programmes, un par un

### Chapeau.py

- **Le chapeau :** il est dessiné « en tortue ». Une table donne, pour
  chacun de ses 13 côtés, la rotation avant le côté et sa longueur (1 ou
  √3) ; `chapeau(u, miroir)` fait `rt` de la rotation puis `tl` de la
  longueur multipliée par `u` pour chaque côté.
- **Son image dans un miroir :** avec `miroir = -1`, toutes les rotations
  changent de signe, ce qui dessine l'image dans un miroir.
- **Peinture :** `peindreChapeau` va, crayon levé, en un point bien à
  l'intérieur de la tuile, appelle `peindre`, puis revient.

### Spectre.py

- **À gauche :** `Tile(1,1)`, dessiné en tortue comme le chapeau (14 côtés
  de longueur 1).
- **À droite :** le Spectre. Chaque côté de A à B y est remplacé par la
  courbe A + t(B − A) + 0,15 sin(2πt) n, où t va de 0 à 1 et n est le côté
  tourné d'un quart de tour à gauche. Elle est tracée en 12 segments avec
  `tracerReel`. Comme sin(2π(1 − t)) = −sin(2πt), cette courbe est la même
  qu'on la trace de A à B ou de B à A : deux Spectres voisins, qui
  parcourent leur côté commun en sens contraires, tracent la même courbe.

### PavageDeChapeaux.py et PavageDeSpectres.py

Les deux programmes contiennent une liste de positions de tuiles, puis :

1. tracent tous les contours en noir (`deplacerReel`, `tracerReel`) ;
2. peignent chaque tuile depuis un point intérieur. Une tuile coupée par
   le bord de la fenêtre est peinte depuis chacun de ses points intérieurs
   qui sont dans la fenêtre, pour que tous ses morceaux visibles soient
   peints.

**Positions.** Un chapeau est donné par `(o, i, j)` :
- `o` est son orientation :
  - pour `o < 6`, il est tourné de `o * 60` degrés ;
  - pour `o >= 6`, il est retourné, puis tourné de `(o - 6) * 60` degrés ;
- `(i, j)` est l'hexagone de la grille de cerfs-volants où est amené son
  coin.

Un Spectre est donné par `(r, a, b, c, d)` : il est tourné de `r * 30`
degrés, et son coin est amené au point x = (a + b√3)/2,
y = (c + d√3)/2. Ces coordonnées exactes viennent de la recherche.

**Couleurs.**
- **Bleu :** les tuiles « particulières » — les chapeaux retournés (23
  sur 181), et les Spectres tournés d'un multiple impair de 30 degrés (25
  sur 204, tous non retournés).
- **Jaune, vert, rouge :** les autres tuiles, selon leur orientation.

### Comment les positions ont été trouvées

Un pavage apériodique n'a pas de règle simple qui se répète. Les positions
ont été calculées par un programme de recherche qui pose les tuiles l'une
après l'autre et revient en arrière quand aucune ne convient (retour
arrière). Ces programmes, en Python, sont dans
`LeRobot_Python_EN/tools` :

- **`tools/hat/search.py`** (chapeaux) : chaque chapeau couvre 8
  cerfs-volants de la grille. Le programme couvre tous les cerfs-volants de
  la fenêtre : il remplit toujours le cerf-volant non couvert qui a le
  moins de chapeaux possibles (toute rotation, retourné ou non), et revient
  en arrière quand un cerf-volant ne peut plus être couvert. Environ 7
  minutes.
- **`tools/spectre/search.py`** (Spectres) : les coins du Spectre ne sont
  pas sur une grille fixe, donc le programme calcule exactement dans les
  nombres (a + b√3)/2 et retient, autour de chaque coin, lesquels des
  douze secteurs de 30 degrés sont déjà couverts. Il pose les Spectres côté
  contre côté, seulement tournés (jamais retournés), au coin le plus proche
  du centre qui a le moins de possibilités, et vérifie que la nouvelle
  tuile n'en chevauche aucune autre. Environ 30 minutes pour la fenêtre.
  `tools/spectre/gen.py` écrit le programme du pavage en Python (anglais et
  français), en OCaml et en Free Pascal.

Ce sont de vrais morceaux de pavages par le chapeau et par le Spectre,
trouvés par recherche. L'article construit les pavages infinis
autrement, par substitution : des groupes de tuiles (« métatuiles ») sont
à leur tour groupés en copies plus grandes d'eux-mêmes, indéfiniment.

## Références

- D. Smith, J. S. Myers, C. S. Kaplan, C. Goodman-Strauss, *An aperiodic
  monotile*, Combinatorial Theory 4 (2), 2024 (arXiv:2303.10798).
- D. Smith, J. S. Myers, C. S. Kaplan, C. Goodman-Strauss, *A chiral
  aperiodic monotile*, Combinatorial Theory 4 (2), 2024
  (arXiv:2305.17743).

## Les mêmes programmes dans les autres versions

Les mêmes programmes existent, sous les mêmes noms, dans
`LeRobot_Python_FR`, `LeRobot_OCaml_FR` et `LeRobot_FreePascal_FR`
(dossier `livre/Didactitiels_et_jeux`), et en anglais dans
`LeRobot_Python_EN/book/tutorials_and_games` : `Chapeau` = `HatTile`,
`PavageDeChapeaux` = `HatTiling`, `Spectre` = `Spectre`,
`PavageDeSpectres` = `SpectreTiling`, `Addition_A_Completer` =
`AdditionToComplete`, `Dessiner` = `FreeDrawing`, `MontreDigitale` =
`DigitalClock`, `CheminementAuHasard` = `RandomWalk`. Les dessins sont
identiques dans toutes les versions.
