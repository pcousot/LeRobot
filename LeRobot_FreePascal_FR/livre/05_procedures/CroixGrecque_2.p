{$mode macpas} program CroixGrecque_2;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quelques dessins géométriques simples, page 6.      *}
 {* CroixGrecque_2, page 54.                            *}
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
  { Dessiner le côté gauche, l'extrémité puis le côté droit d'une }
  { branche, et orienter le robot en direction de la branche sui- }
  { vante.                                                        }
 begin
  Cote; Extremite; Cote; pqtd; 
 end;
 
 procedure Croix;
 begin
  Branche; Branche; Branche; Branche; 
 end;
 
begin
 Croix; st; 
end.