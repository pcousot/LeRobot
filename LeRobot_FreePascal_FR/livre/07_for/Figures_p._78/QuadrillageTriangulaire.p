{$mode macpas} program QuadrillageTriangulaire;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Quadrillages, carrés, spirale et tuyaux d'orgue,    *}
 {* page 78 et QuadrillageTriangulaire, page 82.        *}
 {*                                                     *}
 {*******************************************************}

var
 I : integer; 
 J : integer;
 K : integer;
begin
 { Dessiner 10 lignes de carrés juxtaposés horizontalement }
 pqtd; 
 for I := 1 to 10 do
  begin
   { Dessiner une ligne de  I  carrés juxtaposés horizontalement, }
   { en partant en haut à gauche et en arrivant en haut à droite, }
   { le robot étant dans les deux cas orienté vers l'est.         }
   for J := 1 to I do
    begin
     { Dessiner un carré, en partant du coin supérieur gauche et en }
     { arrivant  au  coin  supérieur droit, le robot étant dans les }
     { deux cas orienté vers l'est.                                 }
     for K := 1 to 4 do
      begin
       av; pqtd; 
      end;
     av;
    end;
   { Revenir, sans dessiner, au début de la ligne suivante, le robot }
   { étant orienté vers l'est au départ et à l'arrivée.              }
   lc; pdt; 
   for J := 1 to I do
    begin
     av;
    end;
   pqtg; av; pqtg; bc; 
  end;
 st;
end.