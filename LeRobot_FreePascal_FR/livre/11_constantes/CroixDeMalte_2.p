{$mode macpas} program CroixDeMalte;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Croix de Malt 10 x 15, 15 x 20, 20 x 25, 25 x 30,   *}
 {* 10 x 35, 35 x 35, page 126.                         *}
 {*                                                     *}
 {*******************************************************}

 const
  Espacement = 10; { Distance (en pixels) entre deux croix }
 
 procedure BrancheVerticale(Longueur, Largeur : integer);
 begin
  lgX(Largeur); lgY(Longueur); vg; pdt; avf(2); pdt; vg; pqtg;
 end;

 procedure BrancheHorizontale(Longueur, Largeur : integer);
 begin
  lgX(Longueur); lgY(Largeur); vg; pdt; av; av; pdt; vg; pqtg;
 end;

 procedure CroixDeMalte(Largeur, Longueur : integer);
  var I : integer;
 begin
  { Partant du bord ouest de la croix, décaler le robot à droite }
  { au centre de la croix }
  lg(1); lc; pqtd; avf(Longueur); pqtg; bc;
  { Dessiner la croix de Malte à quatre branches }
  for I := 1 to 2 do
   begin
    BrancheVerticale(Longueur, Largeur); BrancheHorizontale(Longueur, Largeur);
   end;
  { Décaler le robot à droite à l'est de la croix }
  lg(1); lc; pqtd; avf(Longueur + Espacement); pqtg; bc;
 end;
 
begin
 ag; 
 CroixDeMalte(10, 15);
 CroixDeMalte(15, 20);
 CroixDeMalte(20, 25);
 CroixDeMalte(25, 30);
 CroixDeMalte(10, 35);
 CroixDeMalte(35, 35);
 st;
end.