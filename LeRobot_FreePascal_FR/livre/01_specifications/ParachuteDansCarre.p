{$mode macpas} program ParachuteDansCarre;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quelques dessins géométriques simples, page 6.      *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner un parachute dans un carré }
begin
 { Parachute }
 vd; pqtg; vg; vg; pqtg; vd; 
 { Carre }
 pqtg; av; pqtg; av; av; pqtg; av; av; pqtg; av; av; pqtg; av; 
 st;
end.