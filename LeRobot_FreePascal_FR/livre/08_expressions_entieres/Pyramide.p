{$mode macpas} program Pyramide;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pyramide, page 90.                                  *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner une pyramide de 5 étages. }
var
 I : integer; 
 J : integer; 
begin
 { Orienter le robot à l'ouest. }
 pqtg; 
 for I := 1 to 5 do
  begin
   { Partant du coin inférieur gauche d'un étage avec le robot }
   { orienté à l'ouest,  dessiner  le coin inférieur gauche de }
   { l'étage inférieur et pivoter à l'est.                     }
     av; pqtg; av; pqtg;
   { Dessiner le Ième étage rectangulaire. }
     { Côté inférieur   } 
       for J := 1 to ((2 * I) - 1) do
        begin
         av;
        end; 
     { Extrémité droite }
       pqtg; av; pqtg; 
     { Côté supérieur   }
       for J := 1 to ((2 * I) - 1) do
        begin
         av;
        end; 
   { Redescendre au coin inférieur gauche et orienter le robot }
   { à l'ouest.                                                }
     pqtg; av; pqtd; 
  end;
 st;
end.