{$mode macpas} program RectangleEtEllipse;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rectangle et ellipse sur un quadrillage 40 x 20,    *}
 {* pages 112-113.                                      *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner un rectangle et une ellipse juxtaposés. }
begin
 { Taille de la grille } lgX(40); lgY(20); ag;
 { Grille } dg;
 { Rectangle } av; pqtd; av; pqtd; av; pqtd; av; pqtd;
 { Décalage à droite. } lc; pqtd; av; av; pqtg; bc; 
 { Ellipse } vd; vd; vd; vd; 
 st;
end.