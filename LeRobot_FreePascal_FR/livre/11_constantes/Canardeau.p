{$mode macpas} program Canardeau;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Canardeau sortant de son oeuf, page 128.            *}
 {*                                                     *}
 {*******************************************************}

 const G = 6; { Taille de la grille }
 
 procedure Tete;
 begin
  { Haut gauche du crâne }
  lgx(G * 3); lgy(G * 6); vd;
  { Duvets }
  pqtg; lgx(G * 2); lgy(G * 4); vg; pdt; lc; av; pqtd; av; bc; pdt; vd;
  lc; pdt; av; pqtg; av; bc; lgx(G); lgy(G * 6); pdt; vd;
  { Haut droit du crâne } 
  lc; pdt; av; pqtg; av; bc; pqtg; lgx(G * 3); lgy(G * 6); vd; lg(G);
  {Contour des yeux}
  lc; phtd; av; p3htd; bc; lgy(G * 3); vg; vg; lg(G); av; pdt; av; 
  lgy(G * 3); vg; vg; p3htg;
  { Oeil droit }
  lgy(G); lc; av; bc; ec(2); dp;
  { Oeil gauche }
  lc; phtd; avf(2); bc; dp; ec(1);
  { Se placer pour dessiner les joues }
  lc; phtd; av; pqtg; bc;
 end;
    
 procedure Joues;
 begin
  lg(G * 5); vd; lg(G * 3); vd; lg(G * 5); vd; lgx(G * 4); lgy(G); 
  vg; lg(G * 5); vd; lg(G * 3); vd; lg(G * 5); vd; lgx(G * 2); 
  lgy(G); phtd; vg; vg; lg(G);
  { Se placer pour dessiner la bouche }
  lc; p3htd; av; bc;
 end;

 procedure Bouche;
 begin
  { Commisure droite des lèvres }
  vd; vg; pdt; vd; pqtg; 
  { Lèvres }
  lg(G * 2); vg; lgy(G); vd; lg(G * 2); vg;
  { Commisure gauche des lèvres }
  pqtd; lg(G); vd; pdt; vg; vd;
  {Se placer pour dessiner le cou}
  lc; p3htg; avf(2); pqtd; bc;
 end;

 procedure Cou;
 begin
  { Côté gauche }
  lgy(G * 8); av; pdt; av;
  { Côté droit }
  lc; pqtd; lgx(G*2); av; bc; pqtd; av; lg(G);
 end; 
 
 procedure CoquillePleine;
  var I : integer;
 begin
  { Bord supérieur droit }
  phtg; av; pqtg; lgy(G * 2);
  for I := 1 to 3 do
   begin
    av; pqtd; av; pqtg;
   end;
  p3htd;
  { Fond }
  lgx(G * 8); lgy(G * 14); vd; vd;
  { Bord supérieur gauche }
  phtd; lgx(G); lgy(G * 2);
  for I := 1 to 3 do
   begin
    av; pqtd; av; pqtg;
   end;
  { Milieu }
  lg(G * 2); av; pqtd; av; lg(G);
  { Se placer pour dessiner la coquille vide }
  lc; phtg; avf(10); pqtd; avf(3); phtg; bc; 
 end;   
  
 procedure CoquilleVide;
  var I : integer;
 begin
  { Bord supérieur gauche }
  lgx(G); lgy(G * 2);
  for I := 1 to 3 do
   begin
    av; pqtg; av; pqtd;
   end;
  { Milieu }
  lg(G * 2); av; pqtg; av;
  { Bord supérieur droit }
  pqtd; lgx(G); lgy(G * 2);
  for I := 1 to 3 do
   begin
    av; pqtg; av; pqtd;
   end;
  phtd;
  { Fond }
  lgx(G * 8); lgy(G * 11); vd; vd;
  lg(G);
 end;   

begin
 lg(G); lc; avf(10);bc;
 Tete; Joues; Bouche; Cou; CoquillePleine; CoquilleVide;
 st;
end.