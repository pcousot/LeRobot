{$mode macpas} program FriseFlechesEtCarres;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure Carre;
  var J :integer;
 begin
  for J:= 1 to 4 do
   begin
    av; pqtd;
   end;
 end;

 procedure Frise;
  var K :integer;
 begin
  phtd; 
  for K := 1 to 7 do 
   begin
    { Dessiner la flèche gauche }
    av; pdt; av; pqtg; av; pdt; av; p3htd; av; av;
     phtg; Carre; phtd; 
    { Traverser le losange d'ouest en est }
    lc; av; av; bc;
    { Dessiner la flèche droite }
    av; av; p3htg; av; pdt; av; pqtd; av; pdt; av;
   end;
 end;
 
begin 
 ag; Frise; st; 
end.