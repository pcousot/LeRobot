{$mode macpas} program CroixDeSaintAndre;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 12, page 59.                               *}
 {*                                                     *}
 {*******************************************************}

 procedure Cote;
 begin
  av; av; av; 
 end;
 
 procedure Extremite;
 begin
  pqtg; av; pqtg; 
 end;
 
 procedure Branche;
 begin
  Cote; Extremite; Cote; pqtd; 
 end;
 
 procedure CroixGrecque;
 begin
  Branche; Branche; Branche; Branche; 
 end;
 
 procedure CroixStAndre;
 begin
  phtd; CroixGrecque; 
 end;

begin
 CroixStAndre; st; 
end.