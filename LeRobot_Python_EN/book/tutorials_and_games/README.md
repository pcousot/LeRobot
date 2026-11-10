# Tutorials and games

The programs of this folder are not in the chapters of the book. Run them
from the folder `LeRobot_Python_EN`:

```sh
./robot.sh book/tutorials_and_games/HatTiling.py
```

or drop the file on `LeRobotPythonEN.app`.

| Program | What it does |
|---|---|
| `AdditionToComplete.py` | a tutorial: complete an addition, digit by digit, choosing a box with the mouse or the arrow keys (1991 Pascal program) |
| `FreeDrawing.py` | interactive drawing, saved in `my_drawing.py` (the 1991 program; `Draw.py` in the main folder does the same) |
| `DigitalClock.py` | a digital clock (never ends: Esc stops it) |
| `RandomWalk.py` | the robot walks at random |
| `HatTile.py` | the "hat", an aperiodic monotile, and its mirror image |
| `HatTiling.py` | the window tiled by 181 hats |
| `Spectre.py` | the "Spectre", a chiral aperiodic monotile |
| `SpectreTiling.py` | the window tiled by 204 Spectres |

The last four are new (2026). They show two recent discoveries; they use
only what the book teaches (`rot`, `fdl`, `moveToReal`, `drawToReal`,
`paint`, lists and loops).

## Aperiodic monotiles

A *tiling* covers the whole plane with tiles, without gaps or overlaps.
Squares, triangles or hexagons tile the plane *periodically*: the tiling
can be shifted onto itself. Since the 1960s, sets of tiles have been
known that tile the plane only *non-periodically* (Berger, then Penrose
with two tiles, 1974). Whether a **single** tile could do it was an open
question for fifty years: the "einstein" problem (from German *ein
Stein*, one stone).

- **The hat** (David Smith, November 2022; proved with Joseph Samuel
  Myers, Craig S. Kaplan and Chaim Goodman-Strauss, *An aperiodic
  monotile*, 2023) is the first answer. It is made of 8 kites of the
  hexagonal kite grid (each hexagon cut into 6 kites by the lines joining
  its centre to the middles of its sides). Its 13 sides have lengths 1 and
  √3 (one side, of length 2, is two sides of length 1 in line); its
  corners turn by 60 or 90 degrees. But some hats of a tiling must be
  **turned over** (mirror images): about one in seven.
- **The Spectre** (same authors, *A chiral aperiodic monotile*, 2023)
  needs no mirror image. The polygon `Tile(1,1)` has the same 14 sides as
  the hat, in the same directions (multiples of 30 degrees), but all of
  length 1. It tiles the plane with unflipped copies only, but some
  tilings could still mix in flipped copies. Replacing **every side by
  the same S-shaped curve** forbids that: an S fits an S, but a flipped S
  does not. That curved tile is the Spectre.

## The programs, one by one

### HatTile.py

- **The hat:** it is drawn turtle-style. A table `sides` gives, for each of
  its 13 sides, the turn before the side and its length (1 or √3);
  `hat(u, mirror)` does `rot(turn)` then `fdl(length * u)` for each side.
- **Its mirror image:** with `mirror = -1` every turn changes sign, which
  draws the mirror image.
- **Painting:** `paintHat` goes, pen up, to a point well inside the
  tile, calls `paint()`, and comes back.

### Spectre.py

- **On the left:** `Tile(1,1)`, drawn turtle-style like the hat (14 sides
  of length 1).
- **On the right:** the Spectre. Each side from A to B is replaced by the
  curve A + t(B − A) + 0.15 sin(2πt) n, where t goes from 0 to 1 and n is
  the side turned a quarter turn to the left. It is drawn in 12 straight
  pieces with `drawToReal`. Because sin(2π(1 − t)) = −sin(2πt), this
  curve is the same whether it is drawn from A to B or from B to A: two
  neighbouring Spectres, which go along their common side in opposite
  directions, draw the same curve.

### HatTiling.py and SpectreTiling.py

Both programs contain a list of tile positions, then:

1. draw every outline in black (`moveToReal`, `drawToReal`);
2. paint every tile from a point inside it. A tile cut by the edge of the
   window is painted from each of its inside points that is in the
   window, so that all its visible pieces are painted.

**Positions.** A hat is given by `(o, i, j)`:
- `o` is its orientation:
  - for `o < 6`, it is turned by `o * 60` degrees;
  - for `o >= 6`, it is turned over, then turned by `(o - 6) * 60` degrees;
- `(i, j)` is the hexagon of the kite grid its corner is moved to.

A Spectre is given by `(r, a, b, c, d)`: it is turned by `r * 30`
degrees, and its corner is moved to the point
x = (a + b√3)/2, y = (c + d√3)/2. These exact coordinates come from the
search.

**Colours.**
- **Blue:** the "special" tiles — the turned-over hats (23 of the
  181), and the Spectres turned by an odd multiple of 30 degrees (25 of
  the 204, which are all unflipped).
- **Yellow, green, red:** the other tiles, according to their orientation.

### How the positions were found

An aperiodic tiling has no simple repeating rule. The positions were
computed by a search program that places tiles one after the other and
goes back when no tile fits (backtracking):

- **`../../tools/hat/search.py`** (hats): every hat covers 8 kites of the
  kite grid. The program covers all the kites of the window: it always
  fills the uncovered kite that has the fewest possible hats (any rotation,
  turned over or not), and goes back when a kite can no longer be covered.
  About 7 minutes.
- **`../../tools/spectre/search.py`** (Spectres): the corners of the
  Spectre are not on a fixed grid, so the program computes exactly in the
  numbers (a + b√3)/2 and keeps, around each corner, which of the twelve
  30-degree sectors are already covered. It places Spectres side against
  side, only turned (never flipped), at the corner nearest to the centre
  that has the fewest possibilities, and checks that the new tile overlaps
  no other. About 30 minutes for the window. `../../tools/spectre/gen.py`
  writes the tiling program in Python (English and French), OCaml and Free
  Pascal.

These are genuine patches of hat and Spectre tilings, found by search.
The paper builds infinite tilings differently, by substitution: groups of
tiles ("metatiles") are grouped again into larger copies of themselves,
forever.

## References

- D. Smith, J. S. Myers, C. S. Kaplan, C. Goodman-Strauss, *An aperiodic
  monotile*, Combinatorial Theory 4 (2), 2024 (arXiv:2303.10798).
- D. Smith, J. S. Myers, C. S. Kaplan, C. Goodman-Strauss, *A chiral
  aperiodic monotile*, Combinatorial Theory 4 (2), 2024
  (arXiv:2305.17743).

## The same programs in French

| English (`LeRobot_Python_EN`) | French (`LeRobot_Python_FR`, `LeRobot_OCaml_FR`, `LeRobot_FreePascal_FR`, folder `livre/Didactitiels_et_jeux`) |
|---|---|
| `HatTile` | `Chapeau` |
| `HatTiling` | `PavageDeChapeaux` |
| `Spectre` | `Spectre` |
| `SpectreTiling` | `PavageDeSpectres` |
| `AdditionToComplete` | `Addition_A_Completer` |
| `FreeDrawing` | `Dessiner` |
| `DigitalClock` | `MontreDigitale` |
| `RandomWalk` | `CheminementAuHasard` |
