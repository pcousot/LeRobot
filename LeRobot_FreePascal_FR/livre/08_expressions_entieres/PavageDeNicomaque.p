{$mode macpas} program PavageDeNicomaque;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage de Nicomaque, pages 94, 96.                  *}
 {*                                                     *}
 {*******************************************************}

 { Paver un carré à l'aide de couronnes successives constituées }
 { de carrés de tailles 1, 2, 3, ... en partant du centre.      }
 
 var
  I : integer;
  J : integer;
  K : integer;
  L : integer;
  M : integer;
 
begin 
 for I := 1 to 4 do
  begin
   { Dessiner les 4 côtés de la Ième couronne en les pavant avec }
   { des carrés de taille I.                                     }
   for J := 1 to 4 do
    begin
     { Dessiner un côté de la Ième couronne, pavé de I carrés de }
     { longueur de côté I, le  robot partant du premier carré et }
     { arrivant  au  dernier  carré dans le même coin et dans la }
     { même direction qu'au départ.                              }
      { Dessiner I - 1 carrés de la Ième couronne                }
       for K := 1 to I - 1 do
        begin
         { Dessiner un carré de longueur I,  le robot partant et }
         { arrivant au même coin et dans la même direction.      }
         for L := 1 to 4 do
          begin
           for M := 1 to I do
            begin
             av;
            end;
           pqtd;
          end;
         { Avancer jusqu'au carré suivant de la Ième couronne.   }
         pqtd;
         for L := 1 to I do
          begin
           av;
          end;
         pqtg;
        end;
      { Dessiner le Ième carré de longueur I de la Ième couronne. }
       for K := 1 to 4 do
        begin
         for L := 1 to I do
          begin
           av;
          end;
         pqtd;
        end;
      { Pivoter d'un quart de tour pour placer le robot au début }
      { du côté suivant de la Ième couronne.                     }
      pqtd;
    end;
   { Rejoindre le point de départ de la (I + 1)ème couronne.  }
   pqtg;
   for J := 1 to I do
    begin
     av;
    end;
   pqtd;
   for J := 1 to I do
    begin
     av;
    end;
  end;
 st;
end.