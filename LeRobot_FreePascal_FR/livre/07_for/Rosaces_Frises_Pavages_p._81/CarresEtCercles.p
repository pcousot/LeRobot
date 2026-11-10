{$mode macpas} program CarresEtCercles;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces, frises et pavage, page 81.                 *}
 {*                                                     *}
 {*******************************************************}
 var 
  F : integer;
  C : integer;
begin;
 for F := 1 to 4 do
  begin
   { Dessiner un carré }
   for C := 1 to 4 do
    begin
     pqtd; av; av; 
    end;
   { Dessiner un cercle }
   for C := 1 to 4 do
    begin
     vd; 
    end;
   { Pivoter à gauche }
   pqtg;
  end;
 st; 
end.