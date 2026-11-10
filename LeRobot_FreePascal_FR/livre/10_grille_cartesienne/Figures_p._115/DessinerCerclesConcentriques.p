{$mode macpas} program DessinerCerclesConcentriques;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirales et cercles concentriques, page 115.        *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner des cercles concentriques de diamètres 3, 6, ... }

 procedure Cercle;
 begin
  lc; av; pqtg; bc; vg; vg;
  vg; vg; lc; pqtg; av; pdt; bc;
 end;

 procedure CerclesConcentriques;
  var I : integer;
 begin
  for I := 1 to 12 do
   begin
    lg(3 * I);
    Cercle;
   end;
 end;

begin
 CerclesConcentriques; st;
end.