{$mode macpas} program Canards;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Canards, page 271.                                  *}
 {*                                                     *}
 {*******************************************************}

 procedure Canard(L : real);
  { Dessiner  un  canard  sur une }
  { grille  de  taille   L   sans }
  { changer la grille originelle. }
  var LX : real; LY : real;
 begin
  { Mémoriser les dimensions de la grille originelle }
    LX := valLgX; LY := valLgY;
  { Dessiner un canard avec une grille de taille L } lg(L); 
    { Ligne de flottaison } avf(19); 
    { Queue } lgX(3 * L); lgY(7 * L); phtg; av; pdt; lgX(4 * L); 
    lgY(2 * L); av; 
    { Dos } lgX(6 * L); lgY(3 * L); p3htd; vg; 
    lgX(4 * L); lgY(L); vg; pdt; 
    { Tête } lg(L); avf(2); lg(3 * L); vg; vg; 
    { Oeil } lc; pqtg; av; dc; pdt; av; pqtg; bc;
    { Bec } lgX(2 * L); lgY(L); av; phtd; av; pqtg; av; 
    { Poitrail } lgX(2 * L); lgY(6 * L); av; phtg; 
    { Placer le robot à l'arrière du canard } lg(L); avf(18);
  { Restituer la grille originelle }
    lgX(LX); lgY(LY);
 end;
 
begin
 lg(6); pe; Canard(3); av; Canard(2); av; Canard(1); av; Canard(1); st;
end.