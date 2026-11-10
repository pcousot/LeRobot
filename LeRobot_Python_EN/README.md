# LeRobot — Python, English names

The drawing robot of the book *First Programming Lessons in Python*
(`../LeRobot Livre EN Python`), with English command names. It is the same
robot as `../LeRobot_Python_FR` (the French edition, translated from the
OCaml version): same window, same drawings, same behaviour; only the names
of the commands, the keys of the interactive drawing, the messages and the
programs of the book are in English.

Manuals: `../LeRobot_Manual_Python_EN/LeRobot_Install.pdf` (installing on
another Mac) and `../LeRobot_Manual_Python_EN/LeRobot_Manual.pdf` (use);
`make` in that folder rebuilds them.

## Running

```sh
cd LeRobot_Python_EN
python3 Draw.py                            # interactive drawing
./robot.sh book/03_programming/Square.py   # a program of the book
./robot.sh ~/elsewhere/MyProgram.py        # a program anywhere
make draw                                  # = ./robot.sh Draw.py
make my_drawing                            # replays the drawing saved by Draw
make run PROG=book/20_polar_grid/LimaconOfPascal
make check                                 # shows the book's programs one by one
```

**Application `LeRobotPythonEN.app`**: double-click it to run `Draw.py`;
drop a Python program (`.py`) on its icon to run it. The program runs in a
Terminal window, which closes when the program ends normally (Esc) and
stays open after an error. The application must stay in this folder, next
to `robot.sh` (the `LeRobot` folder itself can be anywhere: all paths are
relative). It is built by `tools/app/build.sh`.

**Python and Tk.** A Python linked to Tk 8.6 or later is needed (for
example the one from python.org). macOS's `/usr/bin/python3` is linked to
Tk 8.5, which no longer works: the library notices it and restarts itself
with a suitable Python. `LEROBOT_PYTHON=/path/python3 ./robot.sh X.py`
forces a given Python.

## Writing a program

```python
from LibRobot import *      # the programs of the book (grid of 12, black pen)

# Draw a square
fd(); fd(); qtr(); fd(); fd(); qtr()
fd(); fd(); qtr(); fd(); fd(); qtr()
st()
```

`from LeRobot import *` gives the original interface (grid of 30 points;
the program starts with `init_pict(); gc()`), used by `my_drawing.py`.

Errors name the English commands, e.g.
`TypeError: fd() takes 0 positional arguments but 1 was given` or
`Error line 2 of Out.py: the robot would leave the frame (fd)`.

## Draw (interactive drawing)

Keys (recalled in the bottom bar): `f` fd, `+`/`-` qtr/qtl, `r`/`l`
etr/etl, `(`/`)` cl/cr, `d`/`u` pd/pu, `p` dp, `c` dc, `.` dg, `*` next pen
colour (pc), `w` paint, arrow keys: one step without drawing, backspace:
undo, Return: end, then `y` saves the drawing in `my_drawing.py`.

## The programs of the book

`book/NN_chapter/*.py`: the 406 programs of the book, translated from
`../LeRobot_Python_FR/livre` (robot names by `tools/fr2en.py`, the
programs' own names, comments and texts by hand). Their drawings are
identical, pixel for pixel, to those of the French programs
(`python3 tools/capture_all.py DIR` runs all of them without a window and
saves the drawings; answers to their questions are in `tools/answers/`).
`tools/renames/*.tsv` gives the French name of each program.
`Loop1`, `Loop2` and `DigitalClock` never end (Esc stops them);
`WrongPaperHen` has an error on purpose.
`book/tutorials_and_games/HatTile.py` (not in the book) draws the "hat",
the aperiodic monotile of David Smith (2022), and its mirror image.
`book/tutorials_and_games/HatTiling.py` covers the window with 181 hats
(23 turned over), positions found by `tools/hat/search.py`.
`Spectre.py` and `SpectreTiling.py`: the Spectre (2023), the chiral
aperiodic monotile that never needs turning over, and a tiling of the
window by 204 Spectres (positions found by `tools/spectre/search.py`).

## How it is made

The robot is the French library: `LibRobotFR.py`, `LeRobotFR.py` and the
modules they use (`Principal`, `Robot`, `Grille`, `Dessin`, `Interaction`,
`Graphics`…, whose internal names stay French). `LibRobot.py` and
`LeRobot.py` export only English names: for each command,
`noms.exporter` makes an English function with the same parameters that
calls the French one, so that Python's messages name the English command.
The table of names is `noms.py` (`NOMS`, French -> English); messages of
the window and of the terminal were translated in the modules.

## Command names

| English | French |
|---|---|
| `fd` | `av` |
| `fdn` | `avf` |
| `fdl` | `tl` |
| `cr` | `vd` |
| `cl` | `vg` |
| `etr` | `phtd` |
| `etl` | `phtg` |
| `qtr` | `pqtd` |
| `qtl` | `pqtg` |
| `tetr` | `p3htd` |
| `tetl` | `p3htg` |
| `ht` | `pdt` |
| `rot` | `rt` |
| `face` | `pivoter` |
| `fn` | `pn` |
| `fne` | `pne` |
| `fe` | `pe` |
| `fse` | `pse` |
| `fs` | `ps` |
| `fsw` | `psw` |
| `fw` | `pw` |
| `fnw` | `pnw` |
| `pd` | `bc` |
| `pu` | `lc` |
| `pc` | `cc` |
| `pw` | `ec` |
| `bg` | `cf` |
| `paint` | `peindre` |
| `gc` | `ce` |
| `gt` | `eh` |
| `gb` | `eb` |
| `gr` | `ad` |
| `gl` | `ag` |
| `translate` | `translater` |
| `moveTo` | `deplacer` |
| `drawTo` | `tracer` |
| `moveToReal` | `deplacerReel` |
| `drawToReal` | `tracerReel` |
| `gs` | `lg` |
| `gsX` | `lgX` |
| `gsY` | `lgY` |
| `gsRT` | `lgRT` |
| `sp` | `vt` |
| `ss` | `pp` |
| `showRobot` | `montrerRobot` |
| `hideRobot` | `cacherRobot` |
| `allowExits` | `autoriserSorties` |
| `forbidExits` | `interdireSorties` |
| `valGsX` | `valLgX` |
| `valGsY` | `valLgY` |
| `valGsR` | `valLgR` |
| `valGsT` | `valLgT` |
| `valFdl` | `valLgTl` |
| `valPd` | `valBc` |
| `valPc` | `valCc` |
| `valBg` | `valCf` |
| `valPw` | `valEc` |
| `valSp` | `valVt` |
| `valAllowExits` | `valAutoriserSorties` |
| `valTextFont` | `valPoliceTexte` |
| `valTextSize` | `valTailleTexte` |
| `clearMessage` | `effacerMessage` |
| `label` | `ecrire` |
| `textFont` | `policeTexte` |
| `textSize` | `tailleTexte` |
| `textStyle` | `styleTexte` |
| `intToString` | `entierEnChaine` |
| `realToString` | `reelEnChaine` |
| `boolToString` | `booleenEnChaine` |
| `readInt` | `lireEntier` |
| `readReal` | `lireReel` |
| `readString` | `lireChaine` |
| `readChar` | `lireCar` |
| `readCharacter` | `lireCaractere` |
| `textMode` | `modeTexte` |
| `drawingMode` | `modeDessin` |
| `clearText` | `effacerTexte` |
| `terminalOutput` | `sortieTerminal` |
| `blackAndWhiteScreen` | `ecranNoirEtBlanc` |
| `record` | `enreg` |
| `clock` | `heure` |
| `delay` | `delai` |
| `markPause` | `marquerUnePause` |
| `beep` | `bip` |
| `longBeep` | `biiip` |
| `rest` | `silence` |
| `dynamics` | `nuance` |
| `flushSounds` | `vider_sons` |
| `sqr_real` | `sqr_reel` |
| `interval` | `intervalle` |
| `white` | `blanc` |
| `yellow` | `jaune` |
| `blue` | `bleu` |
| `green` | `vert` |
| `red` | `rouge` |
| `black` | `noir` |
| `grey` | `gris` |
| `north` | `nord` |
| `northEast` | `nordEst` |
| `east` | `est` |
| `southEast` | `sudEst` |
| `south` | `sud` |
| `southWest` | `sudOuest` |
| `west` | `ouest` |
| `northWest` | `nordOuest` |
| `bold` | `gras` |
| `italic` | `italique` |
| `underline` | `souligne` |
| `outline` | `contour` |
| `shadow` | `ombre` |
| `condensed` | `condense` |
| `extended` | `etendu` |
| `C` | `do0` |
| `C` | `d0` |
| `C` | `ut` |
| `D` | `re` |
| `E` | `mi` |
| `F` | `fa` |
| `G` | `sol` |
| `A` | `la` |
| `B` | `si` |
| `sharp` | `diese` |
| `flat` | `bemol` |
| `natural` | `becarre` |
| `whole` | `ronde` |
| `half` | `blanche` |
| `quarter` | `noire` |
| `eighth` | `croche` |
| `sixteenth` | `double_croche` |
| `thirty_second` | `triple_croche` |
| `dotted_whole` | `ronde_pointee` |
| `dotted_half` | `blanche_pointee` |
| `dotted_quarter` | `noire_pointee` |
| `dotted_eighth` | `croche_pointee` |
| `dotted_sixteenth` | `double_croche_pointee` |
| `quarter_triplet` | `noire_en_triolet` |
| `eighth_triplet` | `croche_en_triolet` |
| `half_triplet` | `blanche_en_triolet` |
| `whole_rest` | `pause` |
| `half_rest` | `demi_pause` |
| `quarter_rest` | `soupir` |
| `eighth_rest` | `demi_soupir` |
| `sixteenth_rest` | `quart_de_soupir` |
| `thirty_second_rest` | `huitieme_de_soupir` |
| `dotted_quarter_rest` | `soupir_pointe` |
| `dotted_eighth_rest` | `demi_soupir_pointe` |
| `dotted_half_rest` | `demi_pause_pointee` |
| `defaultGridSize` | `lgDefaut` |
| `keyboardCommandsMemento` | `mementoCommandesClavier` |
