{$mode macpas} program SpiraleTrapezoidale;
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
 { Dessiner une spirale trapézoïdale }
 var
  I : integer;
  J : integer;
begin
 av; pqtd; 
 for I := 1 to 9 do
  begin
   { Dessiner le côté supérieur }
   av; 
   { Dessiner un côté droit }
   phtd; 
   for J := 1 to (2 * I) do
    begin
     av;
    end;
   { Dessiner le côté inférieur }
   p3htd;
   for J := 1 to ((4 * I) + 2) do
    begin
     av;
    end;
   { Dessiner un côté gauche }
   p3htd;
   for J := 1 to ((2 * I) + 1) do
    begin
     av;
    end;
   phtd; 
  end;
 st;
end.