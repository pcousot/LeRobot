{$mode macpas} program PavageDeChapeaux;
 uses Robot1;
 { Un morceau du pavage du plan par le « chapeau » de David Smith      }
 { (2022), la tuile unique apériodique (voir Chapeau.p) : 181          }
 { chapeaux, dont 23 retournés (en bleu), recouvrent toute la fenêtre  }
 { sans trou ni chevauchement. Le pavage peut être continué            }
 { indéfiniment, mais jamais de façon périodique.                      }
 {                                                                      }
 { Chaque chapeau est donné par sa position dans la grille hexagonale  }
 { de cerfs-volants : (O, I, J) où O est son orientation (rotation de  }
 { O * 60 degrés pour O < 6 ; retourné, puis tourné de (O - 6) * 60    }
 { degrés pour O >= 6) et (I, J) l'hexagone de la grille où est amené  }
 { son coin (0, 0). Ces positions ont été trouvées par un programme    }
 { qui pose les chapeaux l'un après l'autre, en revenant en arrière    }
 { quand aucun ne convient.                                             }
 const
  Unite = 16.0;           { longueur 1 (le petit côté d'un cerf-volant) }
  R3 = 1.7320508075688772;
  { Coins du chapeau, dans les coordonnées de la grille de cerfs-volants }
  ContourX: array[1..13] of real = (0, -1.5, -1, 1, 1.5, 3, 4.5, 4, 3, 3, 1.5, 1, 0);
  ContourY: array[1..13] of real = (0, -R3 / 2, -R3, -R3, -R3 / 2, -R3, -R3 / 2,
                                    0, 0, R3, 3 * R3 / 2, R3, R3);
  { Centres des 8 cerfs-volants du chapeau (points intérieurs au chapeau) }
  CerfsVolantsX: array[1..8] of real = (1.25, 0.625, -0.625, 0.625, 3.625, 2.375, 1.75, 2.375);
  CerfsVolantsY: array[1..8] of real = (0.0, 1.083, -1.083, -1.083, -0.65, -0.65, 1.732, 0.65);
  NombreDeTuiles = 181;
  Tuiles: array[1..NombreDeTuiles, 1..3] of integer = (
   (0, 0, 0), (1, -1, 0), (4, 0, -1), (10, 1, -1), (0, 0, 1),
   (2, -1, 1), (6, -1, 2), (2, 2, -1), (2, -2, 1), (0, 1, -2),
   (1, 1, 1), (0, -2, 0), (1, 2, -2), (5, 0, -2), (2, 0, 2),
   (1, 2, 0), (6, -3, 1), (2, -1, -2), (3, -2, -1), (4, -2, 3),
   (3, -3, 2), (5, 3, -1), (2, 1, 2), (3, -1, 3), (0, 1, -3),
   (2, -3, 0), (11, 3, 0), (4, 3, -3), (3, -3, 3), (0, 4, -2),
   (3, -2, -2), (4, -4, 2), (2, 2, 2), (1, -1, -3), (3, 4, -3),
   (3, 3, 1), (3, 1, -4), (0, -1, 4), (1, 4, -1), (1, -3, 4),
   (4, 0, -4), (2, 4, 0), (2, -4, 0), (7, -4, 4), (6, 4, -4),
   (7, -2, -3), (2, 2, -5), (2, 3, -5), (5, -2, 5), (2, -3, 5),
   (6, 2, 3), (4, -3, -2), (0, 3, 2), (4, -5, 3), (1, 5, -2),
   (3, -1, -4), (4, 1, 4), (2, 4, -5), (6, 1, -5), (0, -1, 5),
   (3, -4, 5), (1, -4, -1), (2, 5, -4), (5, -5, 4), (1, 0, 5),
   (0, 5, -5), (4, -5, 5), (5, 5, 0), (10, -5, 0), (1, 3, -6),
   (2, 3, 3), (8, -6, 3), (5, -3, -3), (1, 6, -3), (3, 2, 4),
   (0, -6, 2), (1, 4, 2), (2, 6, -4), (2, -6, 4), (3, -4, 6),
   (4, -2, 6), (0, 2, -6), (2, 1, -6), (10, -1, 6), (3, 5, -6),
   (4, 5, 1), (0, -6, 1), (0, -5, -1), (3, -1, -5), (1, 6, -5),
   (2, 0, -6), (1, -6, 6), (4, -6, 0), (7, 6, 0), (2, 0, 6),
   (0, -4, 7), (1, -3, 7), (5, -7, 3), (1, 4, -7), (4, -7, 4),
   (5, 7, -4), (2, 4, 3), (11, 7, -3), (5, -4, -3), (0, -5, -2),
   (3, -7, 5), (3, 2, 5), (3, 7, -2), (0, -2, 7), (0, 2, -7),
   (2, -5, 7), (11, 5, -7), (1, -7, 1), (2, 6, -7), (0, -7, 6),
   (3, 7, -1), (3, 6, 1), (1, 1, -7), (2, -6, 7), (5, -6, -1),
   (4, 7, -6), (3, -1, -6), (2, 4, -8), (1, 8, -4), (9, -4, -4),
   (2, -4, 8), (4, 3, 5), (1, -3, -5), (5, 7, -7), (5, 5, -8),
   (6, -5, 8), (0, 8, -5), (2, 8, -3), (1, 7, 0), (2, -8, 3),
   (3, -5, -3), (2, -7, 7), (4, -8, 5), (2, 5, 3), (3, 8, -6),
   (1, 6, -8), (1, -8, 2), (3, 6, 2), (2, -8, 6), (4, 8, -1),
   (0, -8, 1), (6, -8, 7), (2, -7, -1), (2, 7, 1), (5, 8, -7),
   (1, 4, -9), (3, -5, 9), (6, 5, 4), (4, -6, 9), (0, 6, -9),
   (11, -9, 3), (4, -6, -3), (2, 9, -3), (0, 6, 3), (3, -8, 0),
   (3, -8, 8), (1, 7, -9), (1, -7, -2), (5, -9, 2), (9, 9, -7),
   (0, -8, 9), (3, 9, -1), (3, -8, -1), (2, 8, 1), (3, -7, -3),
   (1, -7, 10), (1, 7, 3), (3, 9, -9), (3, 9, 0), (0, -8, 10),
   (1, 8, -10), (7, -8, -2), (1, 8, 2), (5, -9, 10), (2, 8, -11),
   (6, -9, 11));

 procedure Placer (PX, PY : real; T : integer; var X, Y : real);
  { Position (en unités) du point (PX, PY) du chapeau numéro T }
  var O, I, J : integer; A : real;
 begin
  O := Tuiles[T, 1]; I := Tuiles[T, 2]; J := Tuiles[T, 3];
  if O >= 6 then
   PY := -PY;             { retourné }
  A := (O mod 6) * pi / 3;
  { centre de l'hexagone (I, J) de la grille de cerfs-volants }
  X := PX * cos(A) - PY * sin(A) + 3 * I;
  Y := PX * sin(A) + PY * cos(A) + R3 * (I + 2 * J);
 end;

 procedure TracerChapeau (T : integer);
  var C : integer; X, Y : real;
 begin
  Placer(ContourX[1], ContourY[1], T, X, Y);
  lc; deplacerReel(X, Y); bc;
  for C := 2 to 13 do
   begin
    Placer(ContourX[C], ContourY[C], T, X, Y); tracer(X, Y);
   end;
  Placer(ContourX[1], ContourY[1], T, X, Y); tracer(X, Y);
 end;

 function CouleurDe (O : integer) : integer;
  { Les chapeaux retournés en bleu, les autres selon leur orientation }
 begin
  if O >= 6 then
   CouleurDe := bleu
  else if O mod 3 = 0 then
   CouleurDe := jaune
  else if O mod 3 = 1 then
   CouleurDe := vert
  else
   CouleurDe := rouge;
 end;

 procedure PeindreChapeau (T : integer);
  { Peindre le chapeau depuis le centre d'un de ses cerfs-volants ; un  }
  { chapeau coupé par le bord de la fenêtre est peint depuis chacun de  }
  { ses cerfs-volants qui sont dans la fenêtre.                         }
  var K, NombreVisibles : integer; X, Y : real;
   Visible : array[1..8] of boolean;
 begin
  NombreVisibles := 0;
  for K := 1 to 8 do
   begin
    Placer(CerfsVolantsX[K], CerfsVolantsY[K], T, X, Y);
    Visible[K] := (abs(X * Unite) < 397) and (abs(Y * Unite) < 335);
    if Visible[K] then NombreVisibles := NombreVisibles + 1;
   end;
  cc(CouleurDe(Tuiles[T, 1]));
  for K := 1 to 8 do
   if Visible[K] then
    begin
     Placer(CerfsVolantsX[K], CerfsVolantsY[K], T, X, Y);
     lc; deplacerReel(X, Y); pn;
     peindre;
     if NombreVisibles = 8 then
      exit;               { chapeau entier : une seule fois suffit }
    end;
 end;

 var T : integer;
begin
 cacherRobot; autoriserSorties;
 lg(Unite); ec(1); cc(noir);
 for T := 1 to NombreDeTuiles do
  TracerChapeau(T);
 for T := 1 to NombreDeTuiles do
  PeindreChapeau(T);
 cc(noir);
 message('Un pavage par le chapeau de David Smith : 181 chapeaux, 23 retournés (en bleu)');
 st;
end.
