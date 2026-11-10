{$mode macpas} program Spectre;
 uses Robot1;
 { Le « Spectre », découvert par David Smith, Joseph Samuel Myers,       }
 { Craig S. Kaplan et Chaim Goodman-Strauss (« A chiral aperiodic        }
 { monotile », 2023), quelques mois après le chapeau (voir Chapeau.p) :  }
 { une seule tuile qui recouvre tout le plan, jamais de façon            }
 { périodique, SANS jamais être retournée. À gauche, le polygone         }
 { Tile(1,1) : les 14 côtés du chapeau, tous de longueur 1 (les côtés    }
 { gardent leurs directions, multiples de 30 degrés). Des polygones      }
 { Tile(1,1) peuvent encore être retournés dans certains pavages ;       }
 { remplacer chaque côté par la même courbe en S (à droite) l'interdit : }
 { un S s'emboîte dans un S, mais pas un S retourné. C'est le Spectre.   }
 const
  Unite = 48.0;                 { longueur d'un côté, en points }
  { Le contour, côté après côté : rotation (degrés, sens direct) avant  }
  { le côté ; tous les côtés ont pour longueur 1.                        }
  Rotations: array[1..14] of real = (-60, 90, 60, 0, 60, -90, 60, 90, 60, -90, 60, 90, -60, 90);
  { Un point bien à l'intérieur de la tuile, vu du coin de départ (le   }
  { robot tourné vers le nord, x vers la droite, y vers le haut).        }
  InterieurX = 1.1;
  InterieurY = -0.1;
  { Coins de la tuile, en unités, depuis le coin de départ }
  CoinsX: array[0..13] of real = (0, -0.866, -0.366, 0.634, 1.634, 2.134, 3,
                                  3.866, 3.366, 2.366, 2.366, 1.5, 1, 0);
  CoinsY: array[0..13] of real = (0, -0.5, -1.366, -1.366, -1.366, -0.5, -1,
                                  -0.5, 0.366, 0.366, 1.366, 1.866, 1, 1);
  Courbure = 0.15;              { écart des côtés en S à la ligne droite }
  Pas = 12;                     { segments droits pour dessiner un S }

 procedure Polygone (U : real);
  { Dessiner le polygone Tile(1,1) de côtés de longueur U, en partant et }
  { en revenant au même coin, tourné vers le nord.                       }
  var C : integer;
 begin
  rt(180);                      { direction qui précède le premier côté }
  for C := 1 to 14 do
   begin
    rt(Rotations[C]); tl(U);
   end;
  rt(-180);                     { de nouveau tourné vers le nord }
 end;

 procedure PeindreTuile (U : real);
  { Peindre l'intérieur de la tuile dessinée depuis le coin du robot }
  var Angle, Distance : real;
 begin
  Angle := arctan(InterieurY / InterieurX) * 180 / pi - 90;
  Distance := sqrt(sqr(InterieurX) + sqr(InterieurY)) * U;
  lc;
  rt(Angle); tl(Distance);
  peindre;
  pdt; tl(Distance); pdt; rt(-Angle);
  bc;
 end;

 procedure CoteCourbe (AX, AY, BX, BY : real);
  { Tracer de (AX, AY) à (BX, BY) une courbe en S : elle s'écarte vers   }
  { la gauche dans sa première moitié et vers la droite dans la seconde, }
  { si bien que c'est la même courbe dans un sens ou dans l'autre.       }
  var K : integer; T, S : real;
 begin
  for K := 1 to Pas do
   begin
    T := K / Pas;
    S := Courbure * sin(2 * pi * T);
    tracer(AX + T * (BX - AX) - S * (BY - AY), AY + T * (BY - AY) + S * (BX - AX));
   end;
 end;

 procedure DessinerSpectre (X, Y : real);
  { Dessiner le Spectre, son coin de départ en (X, Y) (en unités) }
  var K, L : integer;
 begin
  lc; deplacerReel(X, Y); bc;
  for K := 0 to 13 do
   begin
    L := (K + 1) mod 14;
    CoteCourbe(X + CoinsX[K], Y + CoinsY[K], X + CoinsX[L], Y + CoinsY[L]);
   end;
 end;

begin
 cacherRobot;
 lg(Unite); ec(3);
 cc(rouge); DessinerSpectre(3, 0.75);
 lc; deplacerReel(3 + InterieurX, 0.75 + InterieurY); pn; peindre;
 lc; deplacerReel(-6, 0.75); pn; bc;
 cc(bleu); Polygone(Unite); PeindreTuile(Unite);
 message('Tile(1,1) (en bleu) et le Spectre (en rouge), qu''il n''est jamais nécessaire de retourner');
 st;
end.
