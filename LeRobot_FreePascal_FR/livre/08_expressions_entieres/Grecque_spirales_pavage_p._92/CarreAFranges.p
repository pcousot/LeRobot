{$mode macpas} program CarreAFranges;
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
  K : integer;
begin
 { Monter }
 lc; for I := 1 to 3 do
  begin
   av; 
  end;
 bc;
 { Dessiner le carré à franges }
 for I := 1 to 4 do
  begin
   { Dessiner un côté du carré avec 5 franges de longueurs I + 1, }
   { I + 2, ..., I + 5.                                           }
   for J := 1 to 5 do
    begin
     { Dessiner une frange de longueur (I + J). }
     for K := 1 to (I + J) do
      begin
       av;
      end; 
     pdt;
     for K := 1 to (I + J) do
      begin
       av;
      end;
     { Passer à la frange suivante. }
     pqtg; av; pqtg; 
    end;
   { Tourner le robot perpendiculairement au côté suivant. } 
   pqtd; 
  end;
 st;
end.