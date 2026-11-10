{$mode macpas} program SpiralePleine;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Grecque, spirales, pavage triangulaire et carré à   *}
 {* franges, page 92.                                   *}
 {*                                                     *}
 {*******************************************************}
 var
  I : integer; 
  J : integer;
begin
 { Dessiner le côté 'extérieur' de la spirale pleine }
 for I := 1 to 10 do
  begin
   for J := 1 to (2 * I) do
    begin
     av; 
    end;
    pqtd; 
  end;
 { Dessiner l'extrémité du grand bout }
 av; pqtd; av; 
 { Dessiner le côté 'intérieur' de la spirale pleine }
 for I := 1 to 9 do
  begin
   for J := 1 to (20 - (2 * I)) do
    begin
     av; 
    end;
    pqtg; 
  end;
 { Dessiner l'extrémité du petit bout }
 av; pqtd; av;
 st;
end.