{$mode macpas} program HeliceEnCouleur;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Hélice coloriée, page 147.                          *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner une hélice à quatre pales en couleur }
 
 const
  TailleGrille = 18;
  EpaisseurDuBord = 2;

 procedure Demi_Cercle_Gauche (R : integer);
 begin
  lg(R); vg; vg;
 end;

 procedure Demi_Cercle_Droit (R : integer);
 begin
  lg(R); vd; vd;
 end;
 
 procedure Pale(C : integer);
 begin
  { Dessiner le pourtour de la pale }
  ec(EpaisseurDuBord); cc(Noir); 
  Demi_Cercle_Gauche (TailleGrille); 
  Demi_Cercle_Droit (TailleGrille); 
  Demi_Cercle_Droit (2 * TailleGrille);
  { Peindre l'intérieur de la pale }
  pqtd; lg(TailleGrille); lc; avf(3); cc(C); peindre; avf(-3); bc; 
 end;

 procedure Helice;
 begin
  Pale(bleu); Pale(indigo); Pale(violet); Pale(rouge); 
 end;

begin
 Helice; st;
end.