{$mode macpas} program CroixDouble;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 12, page 59.                               *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner une croix double }

 procedure Br;
  { Dessine une branche de la croix }
 begin
  pqtg; av; av;pqtd; av; pqtd; av; av; pqtg; 
 end;

 procedure Mc;
  { Dessine la moitié de la croix }
 begin
  av; av; 
  Br;
  av; 
  Br;
  av; av; 
  pqtd; av; pqtd; 
 end;
 
 procedure Croix;
 begin
  Mc; Mc; 
 end;

begin
 Croix; st; 
end.