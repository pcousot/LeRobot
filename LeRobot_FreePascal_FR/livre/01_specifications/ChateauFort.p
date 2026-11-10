{$mode macpas} program ChateauFort;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Château fort, page 6.                               *}
 {*                                                     *}
 {*******************************************************}

 procedure Tour;
 { Dessiner une tour en partant du bas à gauche }
 begin
  { Dessiner le bord gauche }
    bc; av; av; av; av; av; av; av; av; av; av; av; av; av;
  { Dessiner les créneaux de la tour }
    pqtg; av; pqtd; av; av; pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; av; pqtg; av;
    pqtg; av; pqtd; av; pqtd; av; av; pqtd; av; av; av; av;
  { Dessiner la fenêtre }  
    pdt; av; pqtd; lc; av; bc; av; av; pqtg; av; pqtg; av; av; pqtg; av; pqtd; lc; av; bc;
    pqtd; av; av;
  { Dessiner le bord droit }  
    pqtd; av; av; av; av; av; av; av; av; av; av; av; av; av;
  { Dessiner le bas }
    pqtd; av; av; av;
 end;

 procedure Creneau;
  { Dessine un creneau et un machicoulis }
 begin
  av; pqtg; av; pqtd; av; pqtd; av; lc; av; bc; av; pdt; av; lc; av; pqtd; bc;
 end;

begin

 { Deplacer le robot sans dessiner au coin inferieur gauche du cadre }
  { Descendre }
    lc; pdt; av; av; av; av; av; av; av; av; av; 
  { Aller a gauche }
    pqtd; av; av; av; av; av; av; av; av; av; av; av; av; av; av; av; pqtd; 
 Tour;
 {Dessiner les créneaux du mur }
  { Rejoindre le 1er creneau à gauche }
    pdt; av; av; av; pqtg; av; av; av; av; av; av; av; av; pqtd; 
    Creneau; Creneau; Creneau; Creneau;
  { Donjon }
    { Côté gauche }
      pqtg; av; av; av; av; av; av; av; 
    { Toit }
      phtd; av; av; av; av; pqtd; av; av; av; av; phtd; pqtd; av; av; av; av; pqtg; lc; av; bc; 
      av; lc; av; av; bc; av; pdt; lc; av; av; av; av; av; pqtg; bc; av; av; av; av; pdt; av; av;
      av; av; av; av; av; av; pqtd; 
    { Cote Droit }
      av; av; av; av; av; av; av; 
    { Rejoindre le troisieme creneau }
      lc; pqtd; av; av; av; av; av; av; av; av; pdt; bc;
      Creneau; Creneau; Creneau; Creneau; Creneau; Creneau; Creneau; Creneau;
 { Descendre au pied de la tour }
   pqtd; av; av; av; av; av; av; av; av; pdt; 
 Tour;
 { Dessiner le sol à droite du pont-levis }
   av; av; av; av; av; av; av; av; av; av; pqtd; 
 { Dessiner le pont levis }
  { Dessiner le tour }
    av; av; av; phtg; av; av; pqtg; av; av; phtg; av; av; av; pqtg; 
    av; av; av; av; pqtg; av; av; av; pqtg; av; av; av; av; 
  { Dessiner la grille }
    phtg; pqtg; av; av; av; pqtg; av; pqtg; av; av; pqtg; av; av; pqtg; 
    av; pqtg; av; av; av; phtd; pqtd; av; pqtd; av; av; av; av; pqtg; av; 
    pqtg; av; av; av; av; pqtd; av; pqtd; av; pqtd; av; av; av; pqtg; av; 
    pqtg; av; av; av; pqtd; av; pqtd; av; av; av; pqtg; av; pqtg; av; av; 
    av; pqtd; 
  { Dessiner le sol a gauche du pont-levis }
    av; av; av; av; av; av; av; av; av; av; 
 st; 
end. {Robot}