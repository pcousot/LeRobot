{$mode macpas} program MosaiqueAlhambra1;
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
  TailleLigne = 7;
  NombreDeLignes = 6;
  
 procedure Motif;
  { Au départ et à l'arrivée du dessin du motif, le robot est au pied }
  { du motif, orienté au nord. }
 begin
  vd; pqtg; vg; vg; pqtg; vd; pdt; 
  lc; av; peindre; avf(-1); bc; 
 end;

 procedure MotifSuivant;
  { Déplacer le robot du pied d'un motif au suivant, le robot étant }
  { orienté au nord. }
 begin
  lc; pqtd; avf(2); pqtg; bc; 
 end;
 
 procedure Ligne;
  { Ligne de pavés }
  var I : integer;
 begin
  for I := 1 to (TailleLigne - 1) do
   begin
    Motif; MotifSuivant;
   end;
  Motif; 
 end;
 
 procedure ALaLigne;
  { Ligne de pavés }
  var I : integer;
 begin
  lc; pqtd; avf(-(2 * (TailleLigne - 1))); pqtg; avf(-2); bc; 
 end;
 
 procedure Pavage;
  var I : integer;
 begin
  for I := 1 to (NombreDeLignes - 1) do
   begin
    Ligne; ALaLigne;
   end;
  Ligne; 
 end;
 
begin
 lc; ag; eh; pqtd; av; pqtd; avf(2); pdt; bc; 
 Pavage; st;
end.