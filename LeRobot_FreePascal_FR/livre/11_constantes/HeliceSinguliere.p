{$mode macpas} program HeliceSinguliere;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* HeliceSinguliere, page 128.                         *}
 {*                                                     *}
 {*******************************************************}
{ Dessiner une hélice singulière }
 
 const
  Xbase = 13; { Dimension horizontale de la grille de base }
  Ybase = 8; { Dimension verticale de la grille de base }
  NombreDeFeuilles = 8; { Nombre de feuilles dans une pale }
  NombreDePales = 4; { Nombre de pales de l'hélice singulière }
  
 procedure Pale;
  var I : integer;
 begin
  for I := 1 to NombreDeFeuilles do 
   begin
    { Dessiner un quart d'ellipse, de dimension (Xbase*I, Ybase*I) }
    { sans changer l'orientation initiale du robot                 }
    lgX(Xbase * I); lgY(Ybase * I); 
    av; pqtg; av; pqtg; vg; pqtg; 
   end;
 end;
 
 var J : integer;
 
begin
 for J := 1 to NombreDePales do
  begin
   Pale; pqtd; 
  end;
 st;
end.