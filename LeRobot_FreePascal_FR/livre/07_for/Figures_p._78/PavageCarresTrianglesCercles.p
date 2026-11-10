{$mode macpas} program PavageCarresTrianglesCercles;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage de carrés, triangles et cercles, page 78 et  *}
 {* PavageCarresTrianglesCercles, page 83.              *}
 {*                                                     *}
 {*******************************************************}

 procedure Carre;
  { Dessiner un carré de côté de taille 2, le robot partant du coin }
  { inférieur  gauche tourné vers l'est, et arrivant crayon baissé  }
  { au coin inférieur droit également orienté à l'est.              }
 begin
  { Dessiner le carré.                                              }
  av; av; pqtg; av; av; pqtg; av; av; pqtg; av; av; pqtg;
  { Avancer au coin inférieur droit.                                }
  av; av; 
 end;
 
 procedure Triangles;
  { Dessiner  deux triangles opposés par un sommet inscrits dans un }
  { carré invisible du quadrillage de côté 2, en  partant  du  coin }
  { inférieur  gauche du carré tourné vers l'est, et en arrivant au }
  { coin inférieur droit, crayon baissé et tourné vers l'est.       }
 begin
  lc; av; bc;
  pqtg; av; av; p3htg; av; p3htg; av; av; p3htd; av; p3htg;
  lc; av; bc; 
 end;
 
 procedure Cercle;
  { Dessiner  un  cercle de rayon 1 inscrit dans un carré invisible }
  { du quadrillage de côté 2, en partant du coin  inférieur  gauche }
  { du  carré  tourné  vers l'est, et en arrivant au coin inférieur }
  { droit du carré, crayon baissé et tourné vers l'est.             }
 begin 
  lc; av; bc; 
  vg; vg; vg; vg; 
  lc; av; bc; 
 end;
 
 procedure LigneCarre;
 { Dessiner une ligne constituée d'un motif répété 7 fois, le motif }
 { étant  formé d'un carré, de triangles et d'un cercle juxtaposés, }
 { le robot partant du coin inférieur gauche de  la  ligne  orienté }
 { vers l'est, et arrivant au coin inférieur droit également orien- }
 { té à l'est.                                                      }
  var I : integer;
 begin
  for I := 1 to 7 do
   begin
    { Le robot est crayon baissé, à l'est, en bas à gauche du motif }
    Carre; Triangles; Cercle; 
   end;
 end;
 
 procedure LigneTriangles;
 { Dessiner une ligne constituée d'un motif répété 7 fois, le motif }
 { étant  formé de triangles, d'un cercle et d'un carré juxtaposés, }
 { le robot partant du coin inférieur gauche de  la  ligne  orienté }
 { vers l'est, et arrivant au coin inférieur droit également orien- }
 { té à l'est.                                                      }
  var I : integer;
 begin
  for I := 1 to 7 do
   begin
    { Le robot est crayon baissé, à l'est, en bas à gauche du motif }
    Triangles; Cercle; Carre; 
   end;
 end;
 
 procedure LigneCercle;
 { Dessiner une ligne constituée d'un motif répété 7 fois, le motif }
 { étant  formé d'un cercle, de triangles et d'un carré juxtaposés, }
 { le robot partant du coin inférieur gauche de  la  ligne  orienté }
 { vers l'est, et arrivant au coin inférieur droit également orien- }
 { té à l'est.                                                      }
  var I : integer;
 begin
  for I := 1 to 7 do
   begin 
   { Le robot est crayon baissé, à l'est, en bas à gauche du motif }
    Cercle; Carre; Triangles; 
   end;
 end;
 
 procedure AlaLigne;
  { Ramener  le  robot  du coin inférieur droit d'une ligne au coin }
  { inférieur gauche de la ligne suivante sans  changer  l'orienta- }
  { tion  du  robot à l'est, sans dessiner et en baissant le crayon }
  { au début de la ligne suivante.                                  }
 begin
  lc; ag; pqtd; av; av; pqtg; bc;
 end;
 
 procedure Pavage;
  { Paver  l'écran  de  11 lignes commençant par un carré, puis par }
  { des triangles puis par un cercle constituées de motifs  répéti- }
  { tifs formés d'un carré suivi d'un cercle et de triangles juxta- }
  { posés en partant du coin supérieur droit et en arrivant au coin }
  { inférieur droit de l'écran, avec le robot tourné vers l'est.    }
  var J : integer;
 begin
  { Dessiner les lignes 1 à 9 de haut en bas.                       }
  for J := 1 to 3 do
   begin
    AlaLigne; LigneCarre;
    AlaLigne; LigneTriangles;
    AlaLigne; LigneCercle;
   end;
  { Dessiner les lignes 10 puis 11.                                 }
  AlaLigne; LigneCarre;
  AlaLigne; LigneTriangles;
end;
 
begin
 { Placer le robot au coin supérieur droit orienté vers l'est.      }
 eh; ad; pqtd;
 { Paver l'écran, terminer au coin inférieur droit orienté à l'est. }
 Pavage; st; 
end.