{$mode macpas} program FriseDeScouches;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces, frises et pavage, page 81.                 *}
 {*                                                     *}
 {*******************************************************}
 { Frise de S couchés }
  var I,J : integer;
begin
 { Rejoindre le point de départ de la frise de S couchés }
 lc; ag; pqtd; av; av; av; pqtd; bc;
 for I := 1 to 5 do
  begin
   { S couché de gauche }
   for J := 1 to 2 do
    begin
     vd; vd; vd; phtd;  vd; 
     lc; p3htg; av; pqtg;  bc;
    end;  
   lc; pqtg; av; av; av; av; pqtg;bc; 
   { S miroir couché de droite }
   for J := 1 to 2 do
    begin
     vg; vg; vg; phtg; vg; 
     lc; p3htd; av; pqtd;  bc;
    end;
 { Rejoindre le point de départ du couple suivant de S couchés }
  lc; pqtd; av; av; av; av; pqtd; bc; 
 end;  
 st;
end.