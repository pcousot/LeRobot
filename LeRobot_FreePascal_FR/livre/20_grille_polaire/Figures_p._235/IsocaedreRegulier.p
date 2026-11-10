{$mode macpas} program IsocaedreRegulier;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Développements des solides de Platon, page 235.     *}
 {*                                                     *}
 {*******************************************************}

 const Cote = 25;

 procedure TriangleEquilateral;
  { Dessiner un triangle équilatéral en partant du coin gauche de la }
  { base et ramener le robot au coin droit de la base.  Le robot est }
  { orienté au nord dans les deux cas.                               }
 begin
  lgRT(Cote, 60); phtd; av; pqtd; av; p3htd; avf(2); pdt; avf(2); pqtg; 
 end;
  
 procedure  DoubleRangeeDeTriangles ;
  { Dessiner une double rangée de 5 triangles équilatéraux, les }
  { triangles des deux rangées ayant même bases.                }
  var
   I : integer;
   J : integer;
 begin
  for I :=1 to 2 do
   begin
    for J :=1 to 5 do
     begin
      TriangleEquilateral;
     end;
    pdt;
   end;
 end;
 
 procedure  Isocaedre;
 begin   
  DoubleRangeeDeTriangles;
  { Descendre au départ de la deuxième double rangée de triangles }
  lc; pdt; av; pqtd; av; pqtd; bc;
  DoubleRangeeDeTriangles ;   
 end;
 
begin
 Isocaedre;
 st;
end.