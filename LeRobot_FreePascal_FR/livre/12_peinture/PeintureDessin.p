{$mode macpas} program PeintureDessin;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Etapes de la peinture d'un dessin, page 132.      *}
 {*                                                     *}
 {*******************************************************}
 const
  TailleQuadrillage = 24;
begin
 lg(TailleQuadrillage);
 { Demi cercle inférieur } pqtd; vg; vg;
 { Demi cercle supérieur } vd; vd; 
 lg(TailleQuadrillage * 2);
 { Cercle du pourtour } vd; vd; vd; vd;
 { Peindre } pqtg; peindre;
 st; 
end.