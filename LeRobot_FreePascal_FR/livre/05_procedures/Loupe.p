{$mode macpas} program Loupe;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 12, page 59.                               *}
 {*                                                     *}
 {*******************************************************}

 procedure  RejoindreDepart;
  { Monter au point de départ, en bas à gauche }
  { du verre de la loupe }
 begin
  lc; av; av; av; bc;
 end;
 
 procedure BordInterieurDuVerre;
  { Dessiner le bord intérieur du verre de la }
  { loupe }
 begin
  av; av; av; av; av; vd; 
  av; av; av; av; av; vd; 
  av; av; av; av; av; vd; 
  av; av; av; av; av; vd; 
 end;
 
 procedure RejoindreBordExterieur;
  { Rejoindre le bord extérieur du support du }
  { verre de la loupe }
 begin
  pqtg; lc; av; pqtg; av; pdt; bc; 
 end;

 procedure BordExterieurDuVerre;
  { Dessiner le bord extérieur du support du }
  { verre de la loupe }
 begin
  av; av; av; av; av; av; av; vd; 
  av; av; av; av; av; av; av; vd; 
  av; av; av; av; av; av; av; vd; 
  av; av; av; av; av; av; av; vd; 
 end;

 procedure RejoindreHautDuManche;
  { Rejoindre le haut du manche à gauche }
 begin
  pdt; vg; av; av; pqtd; 
 end;

 procedure PremCan;
  { Dessiner la première canelure du manche }
 begin
  vg; av; vg;  
  lc; pqtg; av; av; av; pqtg; bc; 
 end;

 procedure CanSuiv;
  { Dessiner une canelure suivante du manche }
 begin
  av; vg; av; vg; av; 
  lc; pqtg; av; av; av; pqtg; av; bc; 
 end;
 
 procedure Manche;
  { Dessiner le manche canelé de la loupe }
 begin
  PremCan; CanSuiv; CanSuiv; CanSuiv; CanSuiv; CanSuiv; CanSuiv; 
  CanSuiv; CanSuiv; CanSuiv; CanSuiv;
 end;

begin
 { Dessiner la loupe }
 RejoindreDepart;
 BordInterieurDuVerre;
 RejoindreBordExterieur;
 BordExterieurDuVerre;
 RejoindreHautDuManche;
 Manche;
 st;
end.