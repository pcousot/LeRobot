{$mode macpas} program FleurStyliseeCouleur;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FleurStyliseeCouleur, page 133.                     *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner et peindre une fleur stylisée en couleur }
 const
  TailleGrille = 12;
  EpaisseurTige = 3;
  EpaisseurBord = 1;
begin
 eb; lg(TailleGrille);
 { Bas de la tige } ec(EpaisseurTige); pqtd; vg; av; av; av; 
 { Feuille droite }
  { Dessiner le pourtour } ec(EpaisseurBord); vd; pqtd; vd;
  { Peindre l'intérieur } cc(vert); phtg; peindre; p3htd;
 { Feuille gauche }
  { Dessiner le pourtour } cc(noir); vg; pqtg; vg;
  { Peindre l'intérieur } cc(vert); phtd; peindre; p3htg; 
 { Haut de la tige } cc(noir); ec(EpaisseurTige); av; av; av; av;
 { Coeur }
  { Dessiner le pourtour du coeur }
    ec(EpaisseurBord); pqtd; vg; vg; vg; vg;
  { Pétales }
    cc(noir); pqtd; vg; vg; vg; cc(violet); phtd; peindre; phtd; 
    cc(noir); pqtd; vg; vg; vg; cc(violet); phtd; peindre; phtd; 
    cc(noir); pqtd; vg; vg; vg; cc(violet); phtd; peindre; phtd; 
    cc(noir); pqtd; vg; vg; vg; cc(violet); phtd; peindre; phtd;
  { Peindre l'intérieur du coeur }
    pqtd; cc(jaune); peindre;
 st; 
end.