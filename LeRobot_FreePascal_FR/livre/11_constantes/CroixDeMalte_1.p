{$mode macpas} program CroixDeMalte_1;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* CroixDeMalte_1, page 125.                           *}
 {*                                                     *}
 {*******************************************************}
{ Dessiner une croix de Malte }
 
 const
  Largeur = 20;  { Largeur d'une branche  }
  Longueur = 30; { Longueur d'une branche }

 procedure BrancheVerticale; 
  { Dessiner une branche verticale avec le robot }
  { orienté au nord ou au sud }
 begin
  lgX(Largeur); lgY(Longueur); vg; pdt; av; av; pdt; vg; pqtg; 
 end; 

 procedure BrancheHorizontale; 
  { Dessiner une branche horizontale avec le robot }
  { orienté à l'est ou à l'ouest }
 begin
  lgX(Longueur); lgY(Largeur); vg; pdt; av; av; pdt; vg; pqtg; 
 end; 

 procedure CroixDeMalte; 
  var I : integer; 
 begin
  for I := 1 to 2 do
   begin
    BrancheVerticale; BrancheHorizontale; 
   end; 
 end; 

begin
 CroixDeMalte; st; 
end.
