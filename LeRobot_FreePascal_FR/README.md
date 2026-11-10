# LeRobot en Free Pascal

Les programmes Turbo Pascal du livre de 1991 (« Premières leçons de
programmation en Turbo Pascal », P., L., R. et T. Cousot, McGraw-Hill),
compilés tels quels par **Free Pascal** (`fpc`, 3.2.2) sur un Mac
d'aujourd'hui. Les 407 programmes du Macintosh (ancien dossier
`LeRobot_TurboPascal`) ont été convertis une fois pour toutes dans
`livre/` ; seules les lignes `uses` et l'encodage ont changé.

## Utilisation

```
cd LeRobot_FreePascal_FR        # depuis le dossier LeRobot, où qu'il soit
./robot.sh livre/03_programmation/Carre.p
```

`robot.sh` compile les unités du robot (la première fois), compile le
programme (les erreurs de compilation s'affichent), puis le lance dans la
fenêtre du robot. Le programme peut être n'importe où (`./robot.sh
~/mon_programme.p`). Les entrées-sorties Pascal (`write`, `writeln`,
`readln`) se font dans le terminal ; le dessin, les messages et
l'interaction dans la fenêtre du robot, avec le même comportement que les
versions OCaml et Python : `st` (vitesse `+`/`-`, autre touche : redessiner,
Échap : quitter), Échap pour arrêter le robot, bip-bip et arrêt quand le
robot sortirait du cadre, flèches dans `interaction`.

**Application** : déposer un programme `.p` sur l'icône de
`LeRobotFreePascal.app` (dans ce dossier) le compile et l'exécute dans une
fenêtre du Terminal, comme `LeRobotOCaml.app` et `LeRobotPython.app`. Un
double-clic sur l'icône lance **Dessiner** (voir plus bas).
La fenêtre du Terminal se ferme à la fin normale du programme et reste
ouverte en cas d'erreur (de compilation ou d'exécution). L'application est
construite par `outils/app/fabriquer.sh`.

Les programmes d'origine du Macintosh (MacRoman, unités du Macintosh)
peuvent aussi être donnés directement à `robot.sh` ou à
l'application : un programme sans `{$mode macpas}` est d'abord converti
dans `_build/convertis/` (voir plus bas), sans toucher à l'original.

**Dessiner** (`livre/Didactitiels_et_jeux/Dessiner.p`, le programme de
1991) : dessin interactif au clavier et à la souris, avec les mêmes touches
que dans les versions OCaml et Python (rappelées en bas de la fenêtre ;
`*` couleur suivante, `w` peindre, retour arrière pour annuler, flèches,
Entrée pour finir). À la fin, `y` sauve le dessin dans le programme Pascal
`Dessin_du_Robot.p` (dans ce dossier), comme en 1991. Pour le reproduire :
`./robot.sh Dessin_du_Robot.p`, ou le déposer sur l'icône.

Il faut :

- Free Pascal : `brew install fpc` ;
- le dossier `../LeRobot_Python_FR` (la fenêtre du robot) et un Python avec
  Tk 8.6 (voir `../LeRobot_Python_FR/README.md`).

## Pourquoi pas l'unité `graph` de Free Pascal

Les programmes de 1991 utilisaient les unités `Robot1`, `Robot2`,
`Robot3` écrites pour le Macintosh (QuickDraw). Free Pascal pour macOS
sur processeur Apple (aarch64-darwin) n'a ni QuickDraw ni l'unité `graph`.
Plutôt que de réécrire une troisième fois la bibliothèque du robot, les
unités `Robot1` à `Robot3` de ce dossier sont de minces unités Pascal qui
envoient chaque commande à la bibliothèque `LeRobot_Python_FR`, déjà fidèle à
la version OCaml (grille, crayon carré, peinture, sons, textes,
interaction) :

```
programme Pascal  --(descripteur 3 : "av", "lg\t12", ...)-->  serveur.py
                  <--(descripteur 4 : "ok", valeur, "stop")--  (LibRobot.py, tkinter)
```

- `serveur.py` crée deux tuyaux, lance l'exécutable Pascal avec ces tuyaux
  sur ses descripteurs 3 et 4, exécute chaque commande avec `LibRobot` et
  répond (`ok` pour une procédure, la valeur pour une fonction, `stop` si le
  programme doit s'arrêter : Échap, fenêtre fermée, sortie du cadre).
- `unites/Robot1.pas` est engendrée par `outils/genere_unite.py` (table des
  procédures et fonctions, constantes des couleurs, orientations et notes).
  Toutes les commandes sont dans `Robot1` ; `Robot2` et `Robot3` sont vides
  et existent pour que les clauses `uses` des programmes restent valides.
- Un programme lancé sans `robot.sh` (sans les descripteurs 3 et 4) le dit
  et s'arrête.

## Conversion des programmes (`outils/convertir.py`)

`python3 outils/convertir.py` a fait `livre/` à partir du dossier
`../LeRobot_TurboPascal` (programmes du Macintosh, supprimé depuis) ;
`python3 outils/convertir.py Source.p Destination.p` convertit un seul
programme (c'est ce que fait `robot.sh` pour un programme d'origine) :

- MacRoman → UTF-8, fins de ligne Mac (CR) → LF ;
- `{$mode macpas}` (le dialecte Pascal du Macintosh, accepté par Free
  Pascal) au début de la première ligne : les messages d'erreur gardent
  les numéros de ligne de l'original (et du livre) ; pas de `{$codepage utf8}`, qui ferait écrire les accents
  en Latin-1 : les chaînes restent en octets UTF-8, comme le terminal ;
- la clause `uses` (unités du Macintosh, directives `{$S}`) réduite aux
  unités `Robot1`, `Robot2`, `Robot3` du programme ;
- un caractère accentué affecté à une variable `char` (`Equ[2] := 'é'`)
  écrit par son code (`#233`), qui est le code rendu par `lireCar` ;
- les dossiers prennent les noms de ceux de `../LeRobot_OCaml_FR/livre`
  (sans accents ni espaces).

Les programmes eux-mêmes ne sont pas modifiés.

## Vérification

**Un par un, à l'œil** : `verifier.sh` compile et lance les programmes du
livre l'un après l'autre (comme dans les versions OCaml et Python) :

```
./verifier.sh                         # tous les programmes
./verifier.sh 20_grille_polaire       # un seul chapitre
./verifier.sh '' Chiffre4             # reprendre à un programme
```

Quand le dessin est fini, on répond dans la fenêtre du robot : Entrée =
correct, `r` = relancer, `q` ou Échap = arrêter (la commande pour reprendre
est affichée), autre touche = remarque (terminée par Entrée), notée dans
`verification.txt`. Les erreurs de compilation et les arrêts anormaux y
sont notés aussi. Les programmes qui posent des questions (`readln`) les
posent dans le terminal : cliquer dans le terminal pour répondre.

**Tous, automatiquement** (sans fenêtre) :

```
zsh outils/compiler_tout.sh          # compile tout dans _build/
python3 outils/tout_capturer.py /tmp/captures   # exécute tout, sans fenêtre
```

`compiler_tout.sh` résume les échecs dans `_build/erreurs.txt` ;
`tout_capturer.py` exécute chaque programme en mode capture (fenêtre cachée,
dessin enregistré en PNG, réponses aux questions prises dans
`../LeRobot_Python_FR/outils/reponses/`).

État : 406 programmes sur 407 compilent. `Cocotte-errone.p` contient
volontairement une erreur (chapitre 4). 403 programmes s'exécutent jusqu'au
bout. `Boucle1`, `Boucle2` et `MontreDigitale` ne s'arrêtent pas, et c'est
voulu. Sur les 396 dessins comparables, 383 sont identiques au pixel près à
ceux de la version Python. Les 13 autres viennent de programmes que les
éditions OCaml et Python ont modifiés depuis 1991 (positions, tailles,
couleurs, didacticiels réécrits), ou du hasard (`CheminementAuHasard`).

## Fichiers

| fichier | rôle |
|---|---|
| `robot.sh` | compiler et lancer un programme |
| `LeRobotFreePascal.app` | l'application (déposer un `.p` sur l'icône) |
| `outils/app/` | `fabriquer.sh` construit l'application |
| `serveur.py` | la fenêtre du robot pour un programme Pascal |
| `unites/Robot1.pas`, `Robot2.pas`, `Robot3.pas` | les unités du robot |
| `livre/` | les programmes du livre convertis |
| `outils/genere_unite.py` | engendre `unites/*.pas` |
| `outils/convertir.py` | conversion des programmes du Macintosh |
| `verifier.sh` | faire défiler les programmes du livre, un par un |
| `outils/compiler_tout.sh`, `outils/tout_capturer.py` | vérification automatique |
| `_build/` | unités compilées, exécutables (peut être effacé) |

`Didactitiels_et_jeux/Chapeau` et `PavageDeChapeaux` (hors du livre) : le « chapeau » de David Smith (2022), tuile unique apériodique, et un pavage de la fenêtre par 181 chapeaux (versions anglaises : `../LeRobot_Python_EN/book/tutorials_and_games/HatTile.py`, `HatTiling.py`).

`Spectre` et `PavageDeSpectres` : le Spectre (2023), tuile unique apériodique qu'il n'est jamais nécessaire de retourner, et un pavage de la fenêtre par 204 Spectres.
