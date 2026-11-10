{$mode macpas} program Carre_1;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Carre_1, page 73.                                   *}
 {*                                                     *}
 {*******************************************************}

 procedure Cote;
  { Dessiner un côté du carré et pivoter à droite }
  var J : integer;
 begin
  for J := 1 to 4 do
   begin
    av; 
   end;
  pqtd; 
 end;
 
 procedure Carre;
  { Dessiner un carré }
  var I : integer;
 begin
  for I := 1 to 4 do
   begin
    Cote; 
   end;
 end;
 
begin
 Carre; st; 
end.
