{$mode macpas} program PolygoneRegulier;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Polygones réguliers, pages 232 et 239.              *}
 {*                                                     *}
 {*******************************************************}

 const
  TailleQuadrillage = 30;
  NombreDeCotes = 7;
  
 procedure Polygone(N : integer);
  { Dessiner un polygone régulier de  N >= 1 cotés }
   var I : integer;
 begin
  for I := 1 to N do
   begin
    av; rt(360 / N);
   end;
 end;
 
begin
 lg(TailleQuadrillage); Polygone(NombreDeCotes); st;
end.
