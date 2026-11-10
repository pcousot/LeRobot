# gen.py SOLUTION.json OUTDIR : writes SpectreTiling.py (EN), PavageDeSpectres.py (FR),
# PavageDeSpectres.ml (OCaml) and PavageDeSpectres.p (Free Pascal)
import json, sys, math, os
sol=json.load(open(sys.argv[1])); out=sys.argv[2]
n=len(sol); odd=sum(1 for t in sol if t[0]%2)
# sort from the centre outwards
R3=math.sqrt(3)
def tr(t): return ((t[1]+t[2]*R3)/2,(t[3]+t[4]*R3)/2)
sol.sort(key=lambda t: math.hypot(*tr(t)))
def rows(items, sep, width):
    rs=[];line=''
    for it in items:
        it2=it+sep
        if len(line)+len(it2)>width: rs.append(line.rstrip()); line=''
        line+=it2
    rs.append(line.rstrip().rstrip(sep.strip()))
    return rs
py_items=['(%d, %d, %d, %d, %d)'%tuple(t) for t in sol]
def neg(v): return '(%d)'%v if v<0 else '%d'%v
ml_items=['(%s)'%', '.join(neg(v) for v in t) for t in sol]
CORNERS="""[(0, 0), (-0.866, -0.5), (-0.366, -1.366), (0.634, -1.366),
           (1.634, -1.366), (2.134, -0.5), (3, -1), (3.866, -0.5),
           (3.366, 0.366), (2.366, 0.366), (2.366, 1.366), (1.5, 1.866),
           (1, 1), (0, 1)]"""
EN='''from LibRobot import *

# A patch of a tiling of the plane by the "Spectre" (see Spectre.py), the
# chiral aperiodic monotile: %(n)d Spectres, none of them turned over, cover
# the whole window without gaps or overlaps. The tiling can be continued
# forever, but never periodically. The %(odd)d Spectres in blue are turned by
# an odd multiple of 30 degrees with respect to the others.
#
# Each Spectre is given by (r, a, b, c, d): it is turned by r * 30 degrees
# (anticlockwise) about its starting corner, which is then moved to the
# point x = (a + b * sqrt(3)) / 2, y = (c + d * sqrt(3)) / 2. These
# positions were found by a program that places Spectres one after the
# other, side against side, going back when no Spectre fits.

unit = 20                  # length of a side, in points
r3 = sqrt(3)

# corners of the Spectre (sides of length 1) from its starting corner
corners = %(corners)s
# points well inside the Spectre, spread over it
inside = [(1.1, -0.1), (3.4, -0.4), (-0.4, -0.7), (1.7, 1.4), (2.3, 0.0),
          (0.4, 0.7)]
bend = 0.15                # how far the S-shaped sides bend
steps = 6                  # straight pieces to draw an S

spectres = [
%(data)s]


def place(point, r, a, b, c, d):
    # Position (in units) of a point of the Spectre put at (r, a, b, c, d)
    x, y = point
    angle = r * pi / 6
    return (x * cos(angle) - y * sin(angle) + (a + b * r3) / 2,
            x * sin(angle) + y * cos(angle) + (c + d * r3) / 2)


def curvedSide(ax, ay, bx, by):
    # S-shaped curve from (ax, ay) to (bx, by): the same whichever way it
    # is drawn, so that neighbouring Spectres fit together
    for k in range(1, steps + 1):
        t = k / steps
        s = bend * sin(2 * pi * t)
        drawToReal(ax + t * (bx - ax) - s * (by - ay),
                   ay + t * (by - ay) + s * (bx - ax))


def drawSpectre(tile):
    points = [place(p, *tile) for p in corners]
    pu(); moveToReal(points[0]); pd()
    for k in range(len(points)):
        ax, ay = points[k]
        bx, by = points[(k + 1) %% len(points)]
        curvedSide(ax, ay, bx, by)


def colourOf(r):
    # Spectres turned by an odd multiple of 30 degrees in blue, the others
    # by orientation
    if r %% 2 == 1:
        return blue
    return [yellow, green, red][r // 2 %% 3]


def paintSpectre(tile):
    # paint the Spectre from a point inside it; a Spectre cut by the edge
    # of the window is painted from each of these points in the window
    points = [place(p, *tile) for p in inside]
    visible = [(x, y) for x, y in points
               if abs(x * unit) < 397 and abs(y * unit) < 335]
    if len(visible) == len(points):
        visible = visible[:1]
    pc(colourOf(tile[0]))
    for x, y in visible:
        pu(); moveToReal(x, y); fn()
        paint()


hideRobot(); allowExits()
gs(unit); pw(1); pc(black)
for tile in spectres:
    drawSpectre(tile)
for tile in spectres:
    paintSpectre(tile)
pc(black)
message("A tiling by the Spectre: %(n)d tiles, none turned over")
st()
'''
data='\n'.join('    '+r for r in rows(py_items,', ',76))
open(os.path.join(out,'SpectreTiling.py'),'w').write(EN%dict(n=n,odd=odd,corners=CORNERS,data=data))
print(n,odd)

HEAD_FR='''Un morceau d'un pavage du plan par le « Spectre » (voir Spectre%(ext)s), la
tuile unique apériodique chirale : %(n)d Spectres, dont aucun n'est retourné,
recouvrent toute la fenêtre sans trou ni chevauchement. Le pavage peut être
continué indéfiniment, mais jamais de façon périodique. Les %(odd)d Spectres en
bleu sont tournés d'un multiple impair de 30 degrés par rapport aux autres.

Chaque Spectre est donné par (r, a, b, c, d) : il est tourné de r * 30
degrés (sens direct) autour de son coin de départ, qui est ensuite amené
au point x = (a + b * racine de 3) / 2, y = (c + d * racine de 3) / 2. Ces
positions ont été trouvées par un programme qui pose les Spectres l'un
après l'autre, côté contre côté, en revenant en arrière quand aucun ne
convient.'''
INSIDE=[(1.1, -0.1), (3.4, -0.4), (-0.4, -0.7), (1.7, 1.4), (2.3, 0.0), (0.4, 0.7)]
FR='''from LibRobot import *

%(head)s

unite = 20                 # longueur d'un côté, en points
r3 = sqrt(3)

# coins du Spectre (côtés de longueur 1) depuis son coin de départ
coins = %(corners)s
# points bien à l'intérieur du Spectre, répartis sur toute la tuile
interieur = [(1.1, -0.1), (3.4, -0.4), (-0.4, -0.7), (1.7, 1.4), (2.3, 0.0),
             (0.4, 0.7)]
courbure = 0.15            # écart des côtés en S à la ligne droite
pas = 6                    # segments droits pour dessiner un S

spectres = [
%(data)s]


def placer(point, r, a, b, c, d):
    # Position (en unités) d'un point du Spectre placé en (r, a, b, c, d)
    x, y = point
    angle = r * pi / 6
    return (x * cos(angle) - y * sin(angle) + (a + b * r3) / 2,
            x * sin(angle) + y * cos(angle) + (c + d * r3) / 2)


def coteCourbe(ax, ay, bx, by):
    # Courbe en S de (ax, ay) à (bx, by) : la même dans un sens ou dans
    # l'autre, pour que les Spectres voisins s'emboîtent
    for k in range(1, pas + 1):
        t = k / pas
        s = courbure * sin(2 * pi * t)
        tracerReel(ax + t * (bx - ax) - s * (by - ay),
                   ay + t * (by - ay) + s * (bx - ax))


def tracerSpectre(tuile):
    points = [placer(p, *tuile) for p in coins]
    lc(); deplacerReel(points[0]); bc()
    for k in range(len(points)):
        ax, ay = points[k]
        bx, by = points[(k + 1) %% len(points)]
        coteCourbe(ax, ay, bx, by)


def couleurDe(r):
    # les Spectres tournés d'un multiple impair de 30 degrés en bleu, les
    # autres selon leur orientation
    if r %% 2 == 1:
        return bleu
    return [jaune, vert, rouge][r // 2 %% 3]


def peindreSpectre(tuile):
    # peindre le Spectre depuis un point intérieur ; un Spectre coupé par le
    # bord de la fenêtre est peint depuis chacun de ces points qui sont dans
    # la fenêtre
    points = [placer(p, *tuile) for p in interieur]
    visibles = [(x, y) for x, y in points
                if abs(x * unite) < 397 and abs(y * unite) < 335]
    if len(visibles) == len(points):
        visibles = visibles[:1]
    cc(couleurDe(tuile[0]))
    for x, y in visibles:
        lc(); deplacerReel(x, y); pn()
        peindre()


cacherRobot(); autoriserSorties()
lg(unite); ec(1); cc(noir)
for tuile in spectres:
    tracerSpectre(tuile)
for tuile in spectres:
    peindreSpectre(tuile)
cc(noir)
message("Un pavage par le Spectre : %(n)d tuiles, dont aucune n'est retournée")
st()
'''
headfr='\n'.join(('# '+l).rstrip() for l in (HEAD_FR%dict(n=n,odd=odd,ext='.py')).split('\n'))
open(os.path.join(sys.argv[3],'PavageDeSpectres.py'),'w').write(FR%dict(head=headfr,n=n,corners=CORNERS.replace('\n           ','\n         '),data=data))

ML='''open LibRobot

(* %(head)s *)

let unite = 20.                 (* longueur d'un côté, en points *)
let r3 = sqrt 3.

(* coins du Spectre (côtés de longueur 1) depuis son coin de départ *)
let coins = [ (0., 0.); (-0.866, -0.5); (-0.366, -1.366); (0.634, -1.366);
              (1.634, -1.366); (2.134, -0.5); (3., -1.); (3.866, -0.5);
              (3.366, 0.366); (2.366, 0.366); (2.366, 1.366); (1.5, 1.866);
              (1., 1.); (0., 1.) ]
(* points bien à l'intérieur du Spectre, répartis sur toute la tuile *)
let interieur = [ (1.1, -0.1); (3.4, -0.4); (-0.4, -0.7); (1.7, 1.4);
                  (2.3, 0.0); (0.4, 0.7) ]
let courbure = 0.15             (* écart des côtés en S à la ligne droite *)
let pas = 6                     (* segments droits pour dessiner un S *)

let spectres = [
%(data)s ]

(* Position (en unités) d'un point du Spectre placé en (r, a, b, c, d) *)
let placer (x, y) (r, a, b, c, d) =
  let angle = float_of_int r *. pi /. 6. in
  (x *. cos angle -. y *. sin angle
   +. (float_of_int a +. float_of_int b *. r3) /. 2.,
   x *. sin angle +. y *. cos angle
   +. (float_of_int c +. float_of_int d *. r3) /. 2.)

(* Courbe en S de (ax, ay) à (bx, by) : la même dans un sens ou dans
   l'autre, pour que les Spectres voisins s'emboîtent *)
let coteCourbe (ax, ay) (bx, by) =
  for k = 1 to pas do
    let t = float_of_int k /. float_of_int pas in
    let s = courbure *. sin (2. *. pi *. t) in
    tracerReel (ax +. t *. (bx -. ax) -. s *. (by -. ay),
                ay +. t *. (by -. ay) +. s *. (bx -. ax))
  done

let tracerSpectre tuile =
  let points = Array.of_list (List.map (fun p -> placer p tuile) coins) in
  let n = Array.length points in
  lc (); deplacerReel points.(0); bc ();
  for k = 0 to n - 1 do
    coteCourbe points.(k) points.((k + 1) mod n)
  done

(* les Spectres tournés d'un multiple impair de 30 degrés en bleu, les
   autres selon leur orientation *)
let couleurDe r =
  if r mod 2 = 1 then bleu else [| jaune; vert; rouge |].(r / 2 mod 3)

(* peindre le Spectre depuis un point intérieur ; un Spectre coupé par le
   bord de la fenêtre est peint depuis chacun de ces points qui sont dans
   la fenêtre *)
let peindreSpectre ((r, _, _, _, _) as tuile) =
  let points = List.map (fun p -> placer p tuile) interieur in
  let visibles = List.filter (fun (x, y) ->
      abs_float (x *. unite) < 397. && abs_float (y *. unite) < 335.) points in
  let visibles =
    if List.length visibles = List.length points then [List.hd visibles]
    else visibles in
  cc (couleurDe r);
  List.iter (fun p -> lc (); deplacerReel p; pn (); peindre ()) visibles

let () =
  cacherRobot (); autoriserSorties ();
  lg unite; ec 1; cc noir;
  List.iter tracerSpectre spectres;
  List.iter peindreSpectre spectres;
  cc noir;
  message "Un pavage par le Spectre : %(n)d tuiles, dont aucune n'est retournée";
  st ()
'''
headml='\n   '.join((HEAD_FR%dict(n=n,odd=odd,ext='.ml')).split('\n')).replace('\n   \n','\n\n')
mldata='\n'.join('  '+r for r in rows(ml_items,'; ',74))
open(os.path.join(sys.argv[4],'PavageDeSpectres.ml'),'w').write(ML%dict(head=headml,n=n,data=mldata))

PAS='''{$mode macpas} program PavageDeSpectres;
 uses Robot1;
%(head)s
 const
  Unite = 20.0;                 { longueur d'un côté, en points }
  R3 = 1.7320508075688772;      { racine de 3 }
  { Coins du Spectre (côtés de longueur 1) depuis son coin de départ }
  CoinsX: array[0..13] of real = (0, -0.866, -0.366, 0.634, 1.634, 2.134, 3,
                                  3.866, 3.366, 2.366, 2.366, 1.5, 1, 0);
  CoinsY: array[0..13] of real = (0, -0.5, -1.366, -1.366, -1.366, -0.5, -1,
                                  -0.5, 0.366, 0.366, 1.366, 1.866, 1, 1);
  { Points bien à l'intérieur du Spectre, répartis sur toute la tuile }
  InterieurX: array[1..6] of real = (1.1, 3.4, -0.4, 1.7, 2.3, 0.4);
  InterieurY: array[1..6] of real = (-0.1, -0.4, -0.7, 1.4, 0.0, 0.7);
  Courbure = 0.15;              { écart des côtés en S à la ligne droite }
  Pas = 6;                      { segments droits pour dessiner un S }
  NombreDeSpectres = %(n)d;
  Spectres: array[1..NombreDeSpectres, 1..5] of integer = (
%(data)s);

 procedure Placer (PX, PY : real; T : integer; var X, Y : real);
  { Position (en unités) du point (PX, PY) du Spectre numéro T }
  var Angle : real;
 begin
  Angle := Spectres[T, 1] * pi / 6;
  X := PX * cos(Angle) - PY * sin(Angle) + (Spectres[T, 2] + Spectres[T, 3] * R3) / 2;
  Y := PX * sin(Angle) + PY * cos(Angle) + (Spectres[T, 4] + Spectres[T, 5] * R3) / 2;
 end;

 procedure CoteCourbe (AX, AY, BX, BY : real);
  { Courbe en S de (AX, AY) à (BX, BY) : la même dans un sens ou dans }
  { l'autre, pour que les Spectres voisins s'emboîtent.                }
  var K : integer; T, S : real;
 begin
  for K := 1 to Pas do
   begin
    T := K / Pas;
    S := Courbure * sin(2 * pi * T);
    tracer(AX + T * (BX - AX) - S * (BY - AY), AY + T * (BY - AY) + S * (BX - AX));
   end;
 end;

 procedure TracerSpectre (T : integer);
  var K, L : integer; AX, AY, BX, BY : real;
 begin
  Placer(CoinsX[0], CoinsY[0], T, AX, AY);
  lc; deplacerReel(AX, AY); bc;
  for K := 0 to 13 do
   begin
    L := (K + 1) mod 14;
    Placer(CoinsX[K], CoinsY[K], T, AX, AY);
    Placer(CoinsX[L], CoinsY[L], T, BX, BY);
    CoteCourbe(AX, AY, BX, BY);
   end;
 end;

 function CouleurDe (R : integer) : integer;
  { Les Spectres tournés d'un multiple impair de 30 degrés en bleu, les }
  { autres selon leur orientation.                                      }
 begin
  if odd(R) then
   CouleurDe := bleu
  else if (R div 2) mod 3 = 0 then
   CouleurDe := jaune
  else if (R div 2) mod 3 = 1 then
   CouleurDe := vert
  else
   CouleurDe := rouge;
 end;

 procedure PeindreSpectre (T : integer);
  { Peindre le Spectre depuis un point intérieur ; un Spectre coupé par  }
  { le bord de la fenêtre est peint depuis chacun de ces points qui sont }
  { dans la fenêtre.                                                     }
  var K, NombreVisibles : integer; X, Y : real;
   Visible : array[1..6] of boolean;
 begin
  NombreVisibles := 0;
  for K := 1 to 6 do
   begin
    Placer(InterieurX[K], InterieurY[K], T, X, Y);
    Visible[K] := (abs(X * Unite) < 397) and (abs(Y * Unite) < 335);
    if Visible[K] then NombreVisibles := NombreVisibles + 1;
   end;
  cc(CouleurDe(Spectres[T, 1]));
  for K := 1 to 6 do
   if Visible[K] then
    begin
     Placer(InterieurX[K], InterieurY[K], T, X, Y);
     lc; deplacerReel(X, Y); pn;
     peindre;
     if NombreVisibles = 6 then
      exit;               { Spectre entier : une seule fois suffit }
    end;
 end;

 var T : integer;
begin
 cacherRobot; autoriserSorties;
 lg(Unite); ec(1); cc(noir);
 for T := 1 to NombreDeSpectres do
  TracerSpectre(T);
 for T := 1 to NombreDeSpectres do
  PeindreSpectre(T);
 cc(noir);
 message('Un pavage par le Spectre : %(n)d tuiles, dont aucune n''est retournée');
 st;
end.
'''
lines=(HEAD_FR%dict(n=n,odd=odd,ext='.p')).split('\n')
headp='\n'.join(' { %-70s }'%l for l in lines)
pdata='\n'.join('   '+r for r in rows(py_items,', ',72))
open(os.path.join(sys.argv[5],'PavageDeSpectres.p'),'w').write(PAS%dict(head=headp,n=n,data=pdata))
