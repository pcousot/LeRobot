{$mode macpas} program CroixPotencee;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 12, page 59.                               *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner une croix potencée }

 procedure T;
 { Dessine une branche de la croix (en forme de T) }
 begin
  av; av; pqtg; av; pqtd; av; pqtd; av; av; av; pqtd; av; 
  pqtd; av; pqtg; av; av; pqtg; 
 end;

begin
 T; T; T; T; st; 
end.