# LeRobot

*Version française plus bas.*

LeRobot is a drawing robot for learning to program, from the book
*Premières leçons de programmation en Turbo Pascal* (Patrick, Laurent,
Radhia and Thibault Cousot, McGraw-Hill, 1991). The robot moves on a grid
in a window and draws; children steer it live with the keyboard and the
mouse, then write programs of robot commands. This repository holds the
robot in four programming languages, the book in four editions, and the
manuals.

| Folder | Contents |
|---|---|
| `LeRobot_Python_EN` | the robot in Python, with **English** command names (`fd()`, `qtr()`, `pd()`…), and the 406 programs of the English book |
| `LeRobot_Python_FR` | the robot in Python, French command names (`av()`, `pqtd()`, `bc()`…), and the programs of the French book |
| `LeRobot_OCaml_FR` | the robot in OCaml (French names), and the programs of the OCaml book |
| `LeRobot_FreePascal_FR` | the 1991 Turbo Pascal programs, compiled by Free Pascal, drawn by the Python robot |
| `LeRobot Livre EN Python` | the book *First Programming Lessons in Python* (LaTeX, PDF `LE2e.tex/LE2e.pdf`) |
| `LeRobot Livre FR Python` | the book *Premières leçons de programmation en Python* |
| `LeRobot Livre FR OCaml` | the book *Premières leçons de programmation en OCaml* |
| `LeRobot Livre FR Pascal` | the 1991 book (scan) and its LaTeX sources |
| `LeRobot_Manual_Python_EN`, `LeRobot_Manual_Python`, `LeRobot_Manual_Ocaml`, `LeRobot_Manual_FreePascal` | installation and user manuals (PDF, in English) for each version |
| `web` | the robot in the browser, for the iPad (English names): <https://pcousot.github.io/LeRobot/web/> |

The folders `tutorials_and_games` / `Didactitiels_et_jeux` also contain
the "hat" and the "Spectre", the aperiodic monotiles discovered in 2023,
with tilings of the window (see their README).

**Try it in the browser** (iPad, tablet or computer, nothing to install):
<https://pcousot.github.io/LeRobot/web/> (prototype, English names).

## On an iPad (web version)

Open <https://pcousot.github.io/LeRobot/web/> in Safari (iPadOS 15.2 or
later; Chrome, Firefox and Edge also work, on any tablet or computer).
Nothing is installed: the robot's Python library runs inside the page
(Pyodide). The first visit downloads Python (about 10 MB, a few seconds);
the browser then keeps it. Safari's *Share* → *Add to Home Screen* gives
it an icon like an app.

- **Draw**: interactive drawing, with large on-screen keys labelled with
  their commands (`f fd`, `+ qtr`, `- qtl`, `d pd`, `u pu`, `* pc`,
  `w paint`…), arrows, ⏎ (end), Esc, y and n. Touching the grid moves
  the robot there, as a click does on a Mac. At the end, the drawing is
  saved as a program (`my_drawing.py`) that appears in the editor; *Run*
  replays it.
- **Programs**: the menu lists all the programs of the English book,
  chapter by chapter, with the hat and Spectre tilings. Choose one, change it in the editor if you like, then *Run*; *Stop*
  interrupts it.
- **Questions** asked by a program (`readInt()`…) are answered in the
  typing field, which brings up the iPad's keyboard; an external keyboard
  works too.
- **Messages and errors** (for example "the robot would leave the frame")
  appear in the console under the editor. Sounds play after the first
  touch of the page.

It is a prototype: English command names only, a plain-text editor, and
nothing is saved between visits (copy your programs elsewhere). How it
works: [`web/README.md`](web/README.md).

## Installing (macOS)

1. Get the repository: with git,
   ```sh
   git clone https://github.com/pcousot/LeRobot.git
   ```
   or on the GitHub page, *Code* → *Download ZIP*, then unzip it. The
   `LeRobot` folder can be put anywhere (for example on the Desktop):
   nothing in it depends on where it is.
2. Install what the version you want needs, then follow its installation
   manual:
   - **Python** (simplest, English or French names): Python 3 from
     <https://www.python.org/downloads/macos/> (it includes Tk, which draws
     the window). Manual: `LeRobot_Manual_Python_EN/LeRobot_Install.pdf`
     (English names) or `LeRobot_Manual_Python/LeRobot_Install.pdf`.
   - **Free Pascal**: the Python above, plus `brew install fpc`
     (Homebrew, <https://brew.sh>) and Apple's Command Line Tools
     (`xcode-select --install`). Manual:
     `LeRobot_Manual_FreePascal/LeRobot_Install.pdf`.
   - **OCaml**: XQuartz, opam and OCaml; follow
     `LeRobot_Manual_Ocaml/LeRobot_Install.pdf`, then build the library
     with `cd LeRobot_OCaml_FR && eval $(opam env) && dune build`.
3. A copy downloaded from the Internet may lose the executable mark of the
   scripts and be blocked by macOS; in the folder of the version:
   ```sh
   chmod +x robot.sh *.sh tools/app/*.sh outils/app/*.sh 2>/dev/null
   ```
   and open the application (`LeRobotPythonEN.app`, `LeRobotPython.app`,
   `LeRobotOCaml.app`, `LeRobotFreePascal.app`) the first time with a
   right-click → *Open*. If it still refuses, rebuild it with
   `tools/app/build.sh` (Python EN) or `outils/app/fabriquer.sh` (Python
   FR, Free Pascal).

## First steps

```sh
cd LeRobot_Python_EN
python3 Draw.py                            # interactive drawing
./robot.sh book/03_programming/Square.py   # a program of the book
```

or double-click `LeRobotPythonEN.app` (it runs Draw), or drop a program on
it. The robot's window is an ordinary macOS window; Esc closes it. The
user manuals (`LeRobot_Manual.pdf` in each manual folder) explain the
commands, the keys and the programs.

## Building the books

Each book folder `LE2e.tex` has a `Makefile`: `make` rebuilds `LE2e.pdf`
with pdflatex (TeX Live, <https://tug.org/mactex/>).

---

# LeRobot (version française)

LeRobot est un robot dessinateur pour apprendre à programmer, tiré du
livre *Premières leçons de programmation en Turbo Pascal* (Patrick,
Laurent, Radhia et Thibault Cousot, McGraw-Hill, 1991). Le robot se
déplace sur une grille dans une fenêtre et dessine ; on le pilote d'abord
au clavier et à la souris, puis on écrit des programmes de commandes du
robot. Ce dépôt contient le robot en quatre langages (Python avec noms
anglais ou français, OCaml, Free Pascal), le livre en quatre éditions et
les manuels (voir le tableau ci-dessus).

**Essayer dans le navigateur** (iPad, tablette ou ordinateur, rien à
installer) : <https://pcousot.github.io/LeRobot/web/> (prototype, noms
anglais).

## Sur un iPad (version web)

Ouvrir <https://pcousot.github.io/LeRobot/web/> dans Safari (iPadOS 15.2
ou plus récent ; Chrome, Firefox et Edge conviennent aussi, sur toute
tablette ou ordinateur). Rien à installer : la bibliothèque Python du
robot s'exécute dans la page (Pyodide). La première visite télécharge
Python (environ 10 Mo, quelques secondes), que le navigateur garde
ensuite. *Partager* → *Sur l'écran d'accueil* lui donne une icône comme
une application.

- **Draw** : le dessin interactif, avec de grandes touches à l'écran
  marquées de leur commande (`f fd`, `+ qtr`, `- qtl`, `d pd`, `u pu`,
  `* pc`, `w paint`…), les flèches, ⏎ (fin), Esc, y et n. Toucher la
  grille y amène le robot, comme un clic sur Mac. À la fin, le dessin est
  enregistré comme programme (`my_drawing.py`), qui apparaît dans
  l'éditeur ; *Run* le rejoue.
- **Programmes** : le menu donne tous les programmes du livre anglais,
  chapitre par chapitre, avec les pavages du chapeau et du Spectre. En
  choisir un, le modifier dans l'éditeur si on veut, puis *Run* ; *Stop*
  l'interrompt.
- **Questions** posées par un programme (`readInt()`…) : on répond dans
  le champ de saisie, qui fait apparaître le clavier de l'iPad ; un
  clavier externe marche aussi.
- **Messages et erreurs** (en anglais, par exemple « the robot would
  leave the frame ») s'affichent dans la console sous l'éditeur. Les sons sont joués après
  le premier toucher de la page.

C'est un prototype : noms anglais seulement, éditeur en texte simple, et
rien n'est conservé d'une visite à l'autre (copier ses programmes
ailleurs). Fonctionnement : [`web/README.md`](web/README.md).

## Installation (macOS)

1. Récupérer le dépôt : `git clone https://github.com/pcousot/LeRobot.git`,
   ou, sur la page GitHub, *Code* → *Download ZIP*, puis décompresser. Le
   dossier `LeRobot` peut être mis n'importe où (par exemple sur le
   Bureau).
2. Installer ce que demande la version choisie, puis suivre son manuel
   d'installation :
   - **Python** (le plus simple) : Python 3 de
     <https://www.python.org/downloads/macos/> (avec Tk, qui dessine la
     fenêtre). Manuel : `LeRobot_Manual_Python/LeRobot_Install.pdf` (noms
     français) ou `LeRobot_Manual_Python_EN/LeRobot_Install.pdf`.
   - **Free Pascal** : le Python ci-dessus, plus `brew install fpc`
     (Homebrew) et les Command Line Tools (`xcode-select --install`).
     Manuel : `LeRobot_Manual_FreePascal/LeRobot_Install.pdf`.
   - **OCaml** : XQuartz, opam et OCaml ; suivre
     `LeRobot_Manual_Ocaml/LeRobot_Install.pdf`, puis compiler la
     bibliothèque : `cd LeRobot_OCaml_FR && eval $(opam env) && dune build`.
3. Une copie téléchargée peut perdre la marque « exécutable » des scripts
   et être bloquée par macOS : dans le dossier de la version,
   `chmod +x robot.sh *.sh outils/app/*.sh tools/app/*.sh 2>/dev/null`,
   et ouvrir l'application la première fois par clic droit → *Ouvrir*.

## Premiers pas

```sh
cd LeRobot_Python_FR
python3 Dessiner.py                              # dessin interactif
./robot.sh livre/03_programmation/Carre.py       # un programme du livre
```

ou double-cliquer sur `LeRobotPython.app`. Les manuels d'utilisation
(`LeRobot_Manual.pdf`) expliquent les commandes, les touches et les
programmes ; les livres sont dans les dossiers `LeRobot Livre …`
(`LE2e.tex/LE2e.pdf`, refait par `make`).
