{$mode macpas} program CroixTreflee;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 12, page 59.                               *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner une croix tréflée }
 
 procedure Branche;
 begin
  av; av; av; av; 
  pqtd; vg; vg; vd; pdt; vd; vg; vg; pqtd; 
  av; av; av; av; 
 end;
 
 procedure Croix;
 begin
  Branche; pqtd; Branche; pqtd; Branche; pqtd; Branche; pqtd;
 end;
 
begin
 Croix; st; 
end.