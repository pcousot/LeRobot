{$mode macpas} program FriseDeZ;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 var M : integer;
begin
 ag;
 for M := 1 to 5 do
  begin
   { Z penché à gauche }
   phtd; av; p3htd; av; av; p3htg; av; 
   { Motif suivant }
   lc; phtg; av; bc;
   { Z droit }
   pqtd; av; pqtd; av; av; pqtg; av;  
   { Motif suivant }
   lc; pqtg; av; bc; 
   { Z inversé penché à droite }
   p3htd; av; p3htg; av; av; p3htd; av; 
   { Motif suivant }
   lc; phtd; av; pqtg; bc;
   { Z droit inversé }
   av; pqtg; av; av; pqtd; av;
   { Motif suivant }
   lc; pqtd; av; pdt; bc;
  end;
 st;
end.