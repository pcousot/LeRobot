{$mode macpas} program PavageHexagonalOndule;
 uses Robot1, Robot2, Robot3;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage du plan en noir et blanc, page 137.          *}
 {*                                                     *}
 {*******************************************************}

 const L = 15;
 
 procedure TourDuMotif;
 begin
  lg(L); phtg; vd; vg; 
  lgrt(L, 60); phtg; vd; vg; 
  pqtg; vd; vg; 
  lg(L); phtg; vd; vg; 
  lgrt(L, 60); phtg; vd; vg; 
  pqtg; vd; vg;
 end;
 
 procedure InterieurDuMotif;
 begin
  ec(2); { Pour eviter les fuites }
  lg(L); phtg; vd;
  lgrt(L, 60); phtg; vg; vd;
  lg(L); phtd; vg; 
  lgrt(L, 60); p3htg; vd;
  lg(L); phtg; vg;  vd;
  lgrt(L, 60); phtd; vg; 
  pqtg; vd; 
  pqtg; vg; vd; 
  pqtd; vg; 
  ec(1); { Plus de fuites }
 end;
 
 procedure PeindreLinterieurDuMotif;
 begin
  lc; p3htg; av; peindre; pdt; av; bc; p3htg;
 end;
 
 procedure Motif;
  { Dessiner un motif en partant et arrivant robot à l'est au coin inférieur gauche }
 begin
  TourDuMotif;
  InterieurDuMotif;
  PeindreLinterieurDuMotif;
 end;
 
 procedure AllerAuMotifSuivant;
 begin
  lc; lgrt(L, 60); avf(4); lg(L); avf(4); bc;
 end;
 
 procedure EnHaut;
 begin
  lc; lg(1); eh; lg(L); pdt; avf(4); pqtg; bc; 
 end;

 procedure AGauche;
 begin
  lc; lg(1); ag; av; lg(L); avf(1); bc;
 end;
 
 procedure Ligne;
  var I : integer;
 begin  
  for I := 1 to 3 do
   begin
    Motif; AllerAuMotifSuivant; 
   end;
  Motif; 
 end;
 
 procedure Translater;
 begin
  lc; lg(L); avf(2); lgrt(L, 60); avf(2); bc; 
 end;
 
 procedure Descendre;
 begin
  lc; pqtd; lgrt(L, 60); avf(2); pqtg; bc; 
 end;
 
begin
 EnHaut; AGauche; Ligne;
 AGauche; Translater; Descendre; Ligne;
 AGauche; Descendre; Ligne;
 AGauche; Translater; Descendre; Ligne;
 AGauche; Descendre; Ligne;
 AGauche; Translater; Descendre; Ligne;
 st;
end.