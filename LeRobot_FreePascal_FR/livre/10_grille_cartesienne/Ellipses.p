{$mode macpas} program Ellipses;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Ellipses, page 113-114.                             *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 { Définir la taille de la grille 40 x 20. }
 lgX(40); lgY(20);
 { Dessiner huit ellipses en faisant pivoter leur grand axe d'un }
 { quart de tour autour du centre de la grille.                  }
 for I := 1 to 8 do
  begin
   phtd; vd; vd; vd; vd;
  end;
 st;
end.