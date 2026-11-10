{$mode macpas} program MosaiqueAlhambra2;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Mosaique de l'Alhambra, page 135.                   *}
 {*                                                     *}
 {*******************************************************}
 
 const
  TailleGrille = 4;
  TailleLigne = 7;
  NombreDeLignes = 8; { pair }
 
 procedure Motif;
 begin
  lg(TailleGrille); av; pqtd; av; 
  lgX(2 * TailleGrille); lgY(3 * TailleGrille); pqtg; vd;
  lc; avf(-1); bc; vd; 
  lg(TailleGrille); pqtg; av; pqtd; av; pdt; 
 end;
 
 procedure MotifSuivant;
 begin
  lc; lg(TailleGrille); pqtd; avf(2); pqtg; bc; 
 end;
 
 procedure Ligne;
  var I : integer;
 begin
  for I := 1 to TailleLigne do
   begin
    Motif; MotifSuivant;
   end;
 end;
 
 procedure RetourDebutDeLigneImpaire;
 begin
  lc; pqtg; avf((4 * TailleLigne) + (2 * (TailleLigne - 1))); pqtd; bc; 
 end;
 
 procedure RetourDebutDeLignePaire;
 begin
  lc; pqtg; avf(((4 * TailleLigne) + (2 * TailleLigne)) + 3); pqtd; bc; 
 end;
 
 procedure Pavage;
  var I : integer;
 begin
  for I := 1 to (NombreDeLignes div 2) do
   begin
    Ligne; 
    av; pqtd; av; lc; avf(-3); pqtg; avf(-1); bc;
    RetourDebutDeLigneImpaire;
    lc; avf(-3); bc; pqtd; av; pqtd; av; pqtg; lc; avf(2); pqtg; bc;  
    Ligne;
    RetourDebutDeLignePaire; 
    lc; avf(-4); bc;
   end;
 end;
 
 procedure Cadre;
 begin
  lc; avf(4); bc;
  avf(4 * NombreDeLignes); pqtd; avf((4 * TailleLigne) + (2 * (TailleLigne - 1)) + 3); pqtd; 
  avf(4 * NombreDeLignes); pqtd; avf((4 * TailleLigne) + (2 * (TailleLigne - 1)) + 3); pqtd; 
 end;
 
 procedure Coloriage;
  var
   I : integer;
   J : integer;
 begin
  lc; avf(2); pqtd; av;
  for I := 1 to ((NombreDeLignes div 2) - 1) do
   begin
    for J := 1 to TailleLigne do
     begin
      peindre; avf(6);
     end;
    peindre;
    pqtg; avf(8); pqtg; avf(6 * TailleLigne); pdt; 
   end;
  for J := 1 to TailleLigne do
   begin
    peindre; avf(6);
   end;
  peindre;
 end;
 
begin
 lc; lg(TailleGrille); ag; eh; avf(-4); bc; 
 Pavage; Cadre; Coloriage; st;
end.