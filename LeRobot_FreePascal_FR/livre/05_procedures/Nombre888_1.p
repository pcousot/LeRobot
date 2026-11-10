{$mode macpas} program Nombre888_1;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quelques dessins géométriques simples, page 6.      *}
 {* Nombre888_1, page 54.                               *}
 {*                                                     *}
 {*******************************************************}

{ Dessiner le nombre 888 dans le }
{ style des montres digitales.   }

begin
 { Dessiner le 8 des centaines }
 av; pqtd; av; pqtg; av; pqtg; av; pqtg; av; pqtg; av; pqtd; av; pqtd;
 av;
 { Prévoir un espace et réorienter le robot vers le nord }
 lc; pqtd; pqtd; av; av; pqtg; bc; 
 { Dessiner le 8 des dizaines }
 av; pqtd; av; pqtg; av; pqtg; av; pqtg; av; pqtg; av; pqtd; av; pqtd;
 av;
 { Prévoir un espace et réorienter le robot vers le nord }
 lc; pqtd; pqtd; av; av; pqtg; bc; 
 { Dessiner le 8 des unités }
 av; pqtd; av; pqtg; av; pqtg; av; pqtg; av; pqtg; av; pqtd; av; pqtd;
 av;
 st; 
end.