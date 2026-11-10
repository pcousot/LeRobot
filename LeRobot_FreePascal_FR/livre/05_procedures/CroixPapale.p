{$mode macpas} 
program CroixPapale;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 12, page 59.                               *}
 {*                                                     *}
 {*******************************************************}

 procedure Branche1;
  { Dessiner une branche de longueur 1 }
 begin
  pqtd; av; pqtg; av; pqtg; av; pqtd; 
 end;
 
 procedure Branche2;
  { Dessiner une branche de longueur 2 }
 begin
  pqtd; av; av; pqtg; av; pqtg; av; av; pqtd; 
 end;
 
 procedure DemiCroix;
  { Dessiner une demi-croix }
 begin
  av; Branche1; av; Branche2; av; Branche1; av; pqtg; av;
 end;
 
 procedure Croix;
  { Dessiner une croix papale }
 begin
  DemiCroix; pqtg; DemiCroix;
 end;
 
begin
 Croix; st; 
end.