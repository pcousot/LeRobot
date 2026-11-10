{$mode macpas} program PointsDarret;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Points  d'arrêt,  quadrillage  et  grillage  sur un *}
 {* écran réduit, page 193.                             *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner la grille de tous les points d'arrêts possibles du robot }
 
 procedure AuBord;
  { Avancer tout droit jusqu'au bord du cadre de déplacement }
  { du robot.                                                }
 begin
  while (not tb) do
   begin 
    av;
   end; 
 end;
 
 procedure VerticaleNordSud;
  { Le robot étant au bord nord orienté vers le sud, marquer les }
  { points  d'arrêt  sur la verticale et l'avancer vers l'est et }
  { le réorienter au nord, si possible.                          }
 begin
  dp;
  while (not tb) do
   begin
    av; dp;
   end;
  pqtd; 
  if not tb then
   begin
    av; pqtd; 
   end;
 end;
 
 procedure VerticaleSudNord;
  { Le robot étant au bord sud orienté vers le nord, marquer les }
  { points  d'arrêt  sur la verticale et l'avancer vers l'est et }
  { le réorienter au sud, si possible.                           }
 begin
  dp;
  while (not tb) do
   begin
    av; dp;
   end;
  pqtg; 
  if not tb then
   begin
    av; pqtg; 
   end;
 end;
 
 procedure dg;
 begin
  { Rejoindre le bord nord }
  lc; AuBord;
  { Rejoindre le coin nord-est }
  pqtd; AuBord;
  { Orienter le robot au sud }
  pqtd;
  { Marquer les verticales, d'est en ouest }
  while (not tb) do
   begin
    VerticaleNordSud;
    VerticaleSudNord;
   end;
  { Remettre le robot au centre orienté vers le nord }
  ce; pn;
 end;

begin
 dg; st;
end.