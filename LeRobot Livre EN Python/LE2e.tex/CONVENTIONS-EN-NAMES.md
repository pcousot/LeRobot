# Fully English programs and robot names for the English book

The English book (this folder) was translated from the French one, but it
still used the French robot commands (`av()`, `pqtd()`…) and the French
programs (`carre`, `traitPointille`, French comments). It now uses the
English edition of the library, `../../LeRobot_Python_EN`, where everything is
in English. Read also `CONVENTIONS-EN.md` (style of the translation) — but
its rules "keep the French command names / identifiers / messages" are now
REPLACED by the rules below.

## The English library (already done, do not modify it)

- `../../LeRobot_Python_EN/noms.py`: table `NOMS` French name -> English
  name of every robot command and constant (av -> fd, pqtd -> qtr,
  bc -> pd, lc -> pu, cc -> pc, ec -> pw, cf -> bg, peindre -> paint,
  ce/eh/eb/ad/ag -> gc/gt/gb/gr/gl, lg -> gs, vt -> sp, pp -> ss,
  translater -> translate, deplacer -> moveTo, ecrire -> label,
  lireEntier -> readInt, couleurs blanc… -> white…, nord… -> north…,
  musical notes do re mi -> C D E, ronde/blanche/noire -> whole/half/quarter…).
  Names that read in English are unchanged: `dp` (draw point), `dc` (draw
  cross), `dg` (draw grid), `st` (stop), `ex` (execution), `tn` … `tnw`
  (test north …), `tb` (test border), `val…` (value of …: `valX`, `valGsX`,
  `valPc`, `valOrientation`…).
- `Draw.py` (was Dessiner.py), interactive drawing; keys: `f` fd, `r`/`l`
  etr/etl (eighth turn right/left), `+`/`-` qtr/qtl, `(`/`)` cl/cr,
  `d`/`u` pd/pu (pen down/up), `p` dp, `c` dc, `.` dg, `*` next pen colour
  (pc), `w` paint, backspace undo, Return end; it saves `my_drawing.py`
  (was mon_dessin.py), whose first lines are `# My lovely drawing`,
  `from LeRobot import *`, `init_pict(); gc()`.
- The application is `LeRobotPythonEN.app`; the folder of the book's
  programs is `book/` (was `livre/`), chapters `book/03_programming`,
  `book/20_polar_grid`… (already replaced in the .tex files); tools:
  `robot.sh`, `check.sh` (was verifier.sh), `tools/capture_all.py`.
- Messages are now English: `Error line 8 of LeaveTheFrame.py: the robot
  would leave the frame (fd)`, `Error line N of X.py: endless recursion
  (stack full)`, `** EXIT FORBIDDEN ** translate`, `Do you want to save in
  my_drawing.py? (y/n)`, st bar `+: faster   -: slower   speed: N     other
  key: redraw   Esc: quit`, `End of the program: press a key or click`,
  `Enter an integer: `, boolToString gives `True`/`False`.

## Mnemonics in the text

Where the book explained a French abbreviation (« av, from the French
avancer, "move forward" »), explain the English one instead, underlining the
letters as the French book did: `{\idt fd()} (\underline{f}orwar\underline{d})`,
`{\idt qtr()} (\underline{q}uarter \underline{t}urn \underline{r}ight)`,
`{\idt pd()} (\underline{p}en \underline{d}own)`. Remove the French glosses
of commands and identifiers: the reader no longer needs French. Historical
remarks about the 1991 Pascal and the OCaml editions stay.

## Your job, for your chapters

1. Programs in `../../LeRobot_Python_EN/book/<chapter folder>/` (including
   subfolders) — `.py` and `.extrait` (book excerpts: `«…»` marks underlined
   code; keep the marks). The robot commands are ALREADY English
   (mechanical replacement). Translate the rest:
   - the program's own names (functions, parameters, variables, constants):
     `carre` -> `square`, `traitPointille` -> `dottedLine`, keeping the
     book's camelCase style; NEVER use a name that is an English robot name
     (any value of `NOMS` in noms.py, e.g. `face`, `paint`, `label`,
     `delay`, `rest`, `record`, `interval`, `clock`, `white`, `north`, `C`)
     or a Python builtin used by the program;
   - comments (`traductions-commentaires.tsv` in this folder has an English
     translation of every French comment line: reuse it, adjusting names);
   - strings shown to the user (`write`, `writeln`, `message`, `label`,
     questions) -> English;
   - the file name: `Carre.py` -> `Square.py` (English CamelCase, unique in
     the whole `book/` folder: check with `find`); rename the `.extrait`
     twin the same way, and `../../LeRobot_Python_EN/tools/answers/<Old>.txt`
     / `.touches` if it exists (keys in `.touches` for programs using
     `interactionTP` are now the English keys: f, r, l, d, u…).
   - `CocotteErronee.py` and other programs with intentional errors must keep
     their error (same kind, same place).
   The drawing must stay EXACTLY the same. Check every program:
   ```
   cd ../../LeRobot_Python_EN
   python3 tools/capture_all.py /private/tmp/claude-501/-Users-cousot1-PB-Cousot-Publications-Publications-LeRobot-2026-11-09/444d8025-6c48-4bb5-9885-e67c97f3b703/scratchpad/en_<you> <chapter folder name>
   ```
   then compare each PNG with the French one in
   `/private/tmp/claude-501/-Users-cousot1-PB-Cousot-Publications-Publications-LeRobot-2026-11-09/444d8025-6c48-4bb5-9885-e67c97f3b703/scratchpad/cap-fr/`
   (named `<french folder>__<subfolder>__<FrenchName>.png`, e.g.
   `03_programmation__Carre.png`) with `cmp`. Identical bytes expected,
   except programs drawing random things (CheminementAuHasard) and text
   (texts are not in the PNG).
2. Write `../../LeRobot_Python_EN/tools/renames/<chapter folder>.tsv`: one
   line `FrenchFileName<TAB>EnglishFileName` (without .py) per renamed
   program.
3. The book file(s) of your chapters (in this folder): replace every French
   robot command, program name, identifier, key, message, file and folder
   name by the English one; `\input python/Old.tex` -> `\input python/New.tex`
   (the listings `python/*.tex` will be regenerated from the programs by the
   main session — do not edit them, do not run make/pdflatex/listings.sh);
   index entries naming commands (`\index{av}`) -> English names.
   Python's error messages quoted in the text must be the real ones with the
   English names: check them by running small programs:
   ```
   cd ../../LeRobot_Python_EN
   LEROBOT_CAPTURE=/private/tmp/claude-501/-Users-cousot1-PB-Cousot-Publications-Publications-LeRobot-2026-11-09/444d8025-6c48-4bb5-9885-e67c97f3b703/scratchpad/x_<you>.png LEROBOT_MUET=1 PYTHONPATH=$PWD \
     /Library/Frameworks/Python.framework/Versions/3.10/bin/python3 prog.py
   ```
   Keep the LaTeX structure, labels, layout commands.
4. Report: programs renamed (count), any program whose drawing differs,
   delicate passages in the text.

Only touch your chapter folders, your .tex files, your renames file and the
answers files of your programs.
