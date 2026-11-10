{$mode macpas} program Chapeau;
 uses Robot1;
 { Le « chapeau », découvert par David Smith en novembre 2022, dont      }
 { l'apériodicité a été démontrée avec Joseph Samuel Myers, Craig S.     }
 { Kaplan et Chaim Goodman-Strauss (« An aperiodic monotile », 2023) :   }
 { une seule tuile qui recouvre tout le plan, mais jamais de façon       }
 { périodique. Il est formé de huit cerfs-volants de la grille           }
 { hexagonale de cerfs-volants : ses 13 côtés ont pour longueurs 1 et    }
 { racine de 3 (un côté, de longueur 2, est formé de deux côtés de       }
 { longueur 1 alignés), et ses coins tournent de 60 ou 90 degrés. Pour   }
 { paver le plan, certains chapeaux doivent être retournés : l'image du  }
 { chapeau dans un miroir (l'« anti-chapeau ») est dessinée à droite.    }
 const
  Unite = 36.0;                 { longueur 1, en points }
  R3 = 1.7320508075688772;      { racine de 3 }
  { Le contour, côté après côté : rotation (degrés, sens direct) avant }
  { le côté, puis longueur du côté.                                     }
  Rotations: array[1..13] of real = (-60, 90, 60, 60, -90, 60, 90, 60, -90, 60, 90, -60, 90);
  Longueurs: array[1..13] of real = (R3, 1, 2, 1, R3, R3, 1, 1, R3, R3, 1, 1, R3);
  { Un point bien à l'intérieur du chapeau, vu du coin de départ (le  }
  { robot tourné vers le nord, x vers la droite, y vers le haut).      }
  InterieurX = 1.6;
  InterieurY = 0.5;

 procedure DessinerChapeau (U, Miroir : real);
  { Dessiner un chapeau de côtés de longueur U, en partant et en       }
  { revenant au même coin, tourné vers le nord ; Miroir = -1 dessine   }
  { son image dans un miroir.                                          }
  var C : integer;
 begin
  rt(Miroir * 180);             { direction qui précède le premier côté }
  for C := 1 to 13 do
   begin
    rt(Miroir * Rotations[C]); tl(Longueurs[C] * U);
   end;
  rt(-Miroir * 180);            { de nouveau tourné vers le nord }
 end;

 procedure PeindreChapeau (U, Miroir : real);
  { Peindre l'intérieur du chapeau dessiné depuis le coin du robot }
  var Angle, Distance : real;
 begin
  Angle := arctan(InterieurY / InterieurX) * 180 / pi - 90;
  Distance := sqrt(sqr(InterieurX) + sqr(InterieurY)) * U;
  lc;
  rt(Miroir * Angle); tl(Distance);
  peindre;
  pdt; tl(Distance); pdt; rt(-Miroir * Angle);
  bc;
 end;

begin
 cacherRobot;
 lg(Unite); lc; deplacerReel(-6.5, 1.5); bc;
 ec(3);
 cc(bleu); DessinerChapeau(Unite, 1); PeindreChapeau(Unite, 1);
 lc; pqtd; tl(11 * Unite); pqtg; bc;
 cc(rouge); DessinerChapeau(Unite, -1); PeindreChapeau(Unite, -1);
 message('Le chapeau de David Smith (en bleu) et son image dans un miroir (en rouge)');
 st;
end.
