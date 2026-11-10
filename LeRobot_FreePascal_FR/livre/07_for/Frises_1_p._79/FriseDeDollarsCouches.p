{$mode macpas} program FriseDeDollarsCouches;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 { Rejoindre l'extrémité droite de la frise }
 lc; ad; pqtg; av; av; pqtd; bc; 
 for I := 1 to 10 do
  begin
   { Dessiner un dollar couché }
     { Arc de l'extrémité droite du $ }
     p3htg; vg; phtg;
     { Corps en S de $ }
     vg; vg; vg; vd; vd; vd; 
     { Arc de l'extrémité gauche du $ }
     phtd; vd; p3htd; 
   { Rejoindre le $ de gauche }
    lc; pqtg; av; av; pqtd; bc; 
 end;
 st;
end.