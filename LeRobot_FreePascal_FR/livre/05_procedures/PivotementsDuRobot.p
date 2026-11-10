{$mode macpas} program PivotementsDuRobot;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quelques dessins géométriques simples, page 6.      *}
 {* Commandes du robot définies par des procédures,     *}
 {* page 58.                                            *}
 {*                                                     *}
 {*******************************************************}

 procedure pqtd; 
  { Faire pivoter le robot sur place d'un quart de tour à droite }
 begin
  phtd; phtd; 
 end;
 
 procedure pqtg; 
  { Faire pivoter le robot sur place d'un quart de tour à gauche }
 begin
  phtg; phtg; 
 end;
 
 procedure p3htd; 
  { Faire pivoter le robot sur place de 3 huitèmes de tour à droite }
 begin
  pqtd; phtd; 
 end;
 
 procedure p3htg; 
  { Faire pivoter le robot sur place de 3 huitèmes de tour à gauche }
 begin
  pqtg; phtg; 
 end;
 
begin
 av; pqtd; av; pqtg; av; p3htd; av; p3htg; av; 
 st; 
end.
