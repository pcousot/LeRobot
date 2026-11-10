{$mode macpas} program Peniche;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Moyens de transport, page 10.                       *}
 {*                                                     *}
 {*******************************************************}

 { Dessiner un péniche }
 
 const
  TailleCarreauGrille = 11;
  NombreDeHublots = 8;

 procedure Porte;
  { Dessiner la porte de la cabine en partant et en terminant au coin }
  { inférieur droit, robot orienté vers l'ouest }
 begin
  pqtd; avf(6); pqtg; avf(3); pqtg; avf(3); lc; pqtg; av; dc; pdt; av; pqtg; 
  bc; avf(3); pqtg; avf(3); pdt;
 end;
 
 procedure Fenetre;
  { Dessiner la fenêtre de la cabine en partant et en terminant du point }
  { du  toit  au  dessus  du  coin supérieur gauche de la fenêtre, robot }
  { orienté vers l'est }
 begin
  pqtd; lc; av; bc; avf(3); pqtg; avf(2); pqtg; avf(3); pqtg; avf(2); lc; 
  pqtd; av; pqtd; bc; 
 end;
 
 procedure Cabine;
  { Dessiner la cabine en partant du coin inférieur droit, robot orienté }
  { vers  l'ouest  et  en  terminant  avec le robot vers l'ouest au coin }
  { inférieur gauche}
 begin
  av; Porte; avf(7); pqtd; avf(8); pqtg; avf(2); pdt; avf(3); Fenetre;
  avf(7); pqtd; avf(8); pqtd; avf(8);
 end;
 
 procedure Hublot;
 begin
  lc; pqtd; av; bc; pqtd; vg; vg; vg; vg; lc; pqtd; av; pqtd; bc; 
 end;
 
 procedure Dessus (N : integer);
  { Dessus de la péniche avec N hublots }
  var H : integer;
 begin
  avf((3 * N) + 4); pqtd; avf(3); vd;
  for H := 1 to N do
   begin
    avf(2); Hublot; av; 
   end;
  vd; avf(3); pqtd; avf((3 * N) + 5);
 end;
 
 procedure Coque (N : integer);
  { Dessiner la coque d'une péniche de N hublots, en partant du coin }
  { supérieur gauche }
 begin
  pqtd; av; pdt; avf(6); vg; avf((3 * N) + 16); vg; avf(6);
 end;
 
begin
 lg(TailleCarreauGrille); ad; lc; pqtg; av; bc; avf(3); Cabine; 
 Dessus(NombreDeHublots); Coque(NombreDeHublots); st; 
end.