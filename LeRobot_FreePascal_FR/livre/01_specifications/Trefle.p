{$mode macpas} program Trefle;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quelques dessins géométriques simples, page 6.      *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner la couleur 'Trèfle' }
begin
 { Feuille du haut }
 phtd; vg; vg; vg;
 { Feuille droite }
 lc; av; bc; vg; vg; vg; 
 { Feuille gauche }
 lc; av; bc; vd; vd; vd; 
 { Pied }
 phtd; lc; av; phtg; bc; 
 vd;  p3htg; av; p3htg; vd; 
 st; 
end.
