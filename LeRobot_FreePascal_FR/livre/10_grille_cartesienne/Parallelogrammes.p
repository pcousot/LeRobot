{$mode macpas} program Parallelogrammes;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Parallélogrammes, page 113-114.                     *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 { Définir la taille de la grille 40 x 20. }
 lgX(40); lgY(20);
 { Dessiner huit parallélogrammes en faisant pivoter leur coin infé- }
 { rieur gauche d'un quart de tour autour du centre de la grille.    }
 for I := 1 to 8 do
  begin
   av; pqtd; av; pqtd; av; pqtd; av; phtd;
  end;
 st;
end.