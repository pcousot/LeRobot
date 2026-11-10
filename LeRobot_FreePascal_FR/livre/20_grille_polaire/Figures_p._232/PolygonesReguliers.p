{$mode macpas} program PolygonesReguliers;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Polygones réguliers, page 232.                      *}
 {*                                                     *}
 {*******************************************************}

 const TailleQuadrillage = 24;
  
 procedure Polygone(N : integer);
  { Dessiner un polygone regulier de  N >= 1 cotés }
   var I : integer;
 begin
  for I := 1 to N do
   begin
    av; rt(360 / N);
   end;
 end;
 
 var
  I : integer;
  J : integer;

begin
 for I := 1 to 3 do
  begin
   for J := 1 to 3 do
    begin
     lg(TailleQuadrillage); 
     eh; translater(0, -((I * I) - (I div 3) + 1));
     ag; translater((4 * J), 0);
     pe;
     Polygone(((3 * (I - 1)) + J) + 2);
    end;
  end;
 st;
end.
