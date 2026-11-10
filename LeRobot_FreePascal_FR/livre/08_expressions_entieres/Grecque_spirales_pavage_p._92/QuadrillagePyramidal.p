{$mode macpas} program QuadrillagePyramidal;
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
 { Dessiner 16 lignes de carrés juxtaposés horizontalement }
 EH; pqtd; 
 for I := 1 to 16 do
  begin
   { Dessiner une ligne de ((2 * I) + 1) carrés juxtaposés horizon- }
   { talement, en partant en haut à gauche et en arrivant en haut à }
   { droite, le robot étant dans les deux cas orienté vers l'est.   }
   for J := 1 to ((2 * I) - 1) do
    begin
     { Dessiner un carré, en partant du coin supérieur gauche et en }
     { arrivant  au  coin  supérieur droit, le robot étant dans les }
     { deux cas orienté vers l'est.                                 }
     for K := 1 to 4 do
      begin
       av; pqtd; 
      end;
     av;
    end;
   { Revenir, sans dessiner, au début de la ligne suivante, le robot }
   { étant orienté vers l'est au départ et à l'arrivée.              }
   lc; pdt; 
   for J := 1 to (2 * I) do
    begin
     av;
    end;
   pqtg; av; pqtg; bc; 
  end;
 st;
end.