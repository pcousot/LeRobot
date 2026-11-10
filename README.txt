In 1991, the Cousot's family published the book ``Premières leçons de
programmation en Turbo Pascal'' (First programming lessons in Turbo Pascal).
Laurent, Patrick, Radhia et Thibault Cousot (McGraw Hill, 1991, ISBN
2-7042-1239-2). The idea is based on a graphical approach using a programmable
robot to draw pictures (and was very successfuk with Laurent and Thibault).

In 2016, Thibault asked me to implement it in Python for his children. In 2.5
days (sleeping late), I used Claude to get a pdflatex version of the book (from
an old LaTeX2e version), a FreePascal version of the robot (from the old Turbo
Pascal version) with a user manual, an OCaml version of the robot, user manual
and book, a Python version of the robot, user manual and book, all in French,
and finally an English version of the robot, user manual, and book for Python
(with english mnemonics for the robot commands). Unconsciously my prompts were
indifferently in French and English and Claude switched as well. For the fun, I
also asked Claude to produce a tiling of the plane with the "hat tile" of David
Smith and then "The Spectre". Then I asked Claude to install the robot on Github 
to make it public. Finally, before going to sleep (late), I asked for
an iPad version, that I found in the morning (in web). It runs in the
browser (Safari on an iPad, or any tablet or computer), with nothing to
install:

    https://pcousot.github.io/LeRobot/web/

I think doing that without Claude would have taken me up to 6 months.

*******************************************************************************

Objet : LeRobot est sur GitHub

LeRobot, le robot dessinateur de « Premières leçons de programmation »,
est maintenant public sur GitHub :

    https://github.com/pcousot/LeRobot

Vous y trouverez le robot en Python (commandes en anglais ou en français),
en OCaml et en Free Pascal, les quatre éditions du livre (Pascal 1991,
OCaml, Python français et anglais) et les manuels d'installation et
d'utilisation.

Sur un iPad (ou toute tablette, tout ordinateur), sans rien installer :
ouvrir dans Safari

    https://pcousot.github.io/LeRobot/web/

(version prototype, commandes en anglais). « Draw » lance le dessin
interactif avec des touches à l'écran ; toucher la grille y amène le
robot. Le menu donne tous les programmes du livre anglais : en choisir
un, le modifier si on veut, puis « Run ». Le premier chargement prend
quelques secondes (téléchargement de Python). « Partager » puis « Sur
l'écran d'accueil » lui donne une icône comme une application.

Installation sur un Mac :

1. Récupérer le dépôt :
       git clone https://github.com/pcousot/LeRobot.git
   ou, sur la page GitHub, « Code » puis « Download ZIP », et décompresser.
   Le dossier LeRobot peut être mis n'importe où.

2. Installer Python 3 depuis https://www.python.org/downloads/macos/
   (il contient Tk, qui dessine la fenêtre du robot). C'est tout ce qu'il
   faut pour les versions Python.
   - Pour Free Pascal, en plus : les Command Line Tools
     (xcode-select --install), Homebrew (https://brew.sh) et
     brew install fpc.
   - Pour OCaml : XQuartz, opam et OCaml, comme l'explique
     LeRobot_Manual_Ocaml/LeRobot_Install.pdf.

3. Essayer, dans un Terminal ouvert dans le dossier LeRobot :
       cd LeRobot_Python_FR
       python3 Dessiner.py
   (dessin interactif ; Entrée pour finir), ou
       ./robot.sh livre/03_programmation/Carre.py
   ou double-cliquer sur l'application LeRobotPython.app (la première
   fois : clic droit, « Ouvrir »). Version anglaise : dossier
   LeRobot_Python_EN, python3 Draw.py.
   
Le fichier README.md, à la racine du dépôt, décrit le contenu de chaque
dossier ; chaque version a son manuel d'installation et son manuel
d'utilisation (dossiers LeRobot_Manual_…).

*******************************************************************************

