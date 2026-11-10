{$mode macpas}  program PavageHexagonesEntrelaces;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage d'hexagones entrelacés, page 178.            *}
 {*                                                     *}
 {*******************************************************}

 const
  UniteTailleGrille = 2;
  NombreDeLignes= 8;
  NombreDeColonnes= 6;
       
 procedure Hexagone;     
  var
   I : integer;
   J : integer;
 begin
  { lgX(UniteTailleGrille * 4), lgY(UniteTailleGrille * 8) et }
  { l'orientation nord pour l'hexagone vertical.              }
  { lgX(UniteTailleGrille * 8), lgY(UniteTailleGrille * 4) et }
  { l'orientation ouest pour l'hexagone horizontal.           }
  for I := 1 to 2 do
   begin
    for J := 1 to 3 do
     begin
      phtd; av; 
     end;
    phtd;
   end;
 end;

 procedure PavageHexagonesVerticaux;
  var
   L : integer;
   C : integer;
 begin
  lg(UniteTailleGrille); ag; eh;
  lgX(UniteTailleGrille * 4); lgY(UniteTailleGrille * 8);
  lc; pdt; av; pdt; bc;  
  for L := 1 to NombreDeLignes do
   begin
    for C := 1 to (NombreDeColonnes - 1) do
     begin
       Hexagone;
      { Aller au Hexagone suivant } 
      lc; pqtd; avf(4); pqtg; bc;
     end;
    if odd(L) then
     begin
      Hexagone;
     end;
   { Aller à la ligne suivante } 
   lc; lg(UniteTailleGrille); ag; 
   lgX(UniteTailleGrille * 4); lgY(UniteTailleGrille * 8);
   if odd(L) then
    begin
     pdt; av; pqtg; avf(2); pqtg; 
    end 
   else
    begin
     pdt; av; pdt;
    end;
   bc;
  end;
 end;


 procedure PavageHexagonesHorizontaux;
  var
   L : integer;
   C : integer;
 begin 
  lg(UniteTailleGrille); ag; eh;
  lc; p3htd; lg(UniteTailleGrille * 14); av; p3htd; bc;
  lgY(UniteTailleGrille * 4); lgX(UniteTailleGrille * 8); 
  for L := 1 to  NombreDeLignes do
   begin
    for C := 1 to (NombreDeColonnes - 2) do
     begin
      Hexagone;
      { Aller au Hexagone suivant } 
      lc; pdt; avf(2); pdt; bc;
     end;
    if odd(L) then 
     begin
      Hexagone;
     end;
    { Aller a la ligne suivante } 
   lc; lg(UniteTailleGrille); ag;
   pdt; lgX(UniteTailleGrille * 6); av; pdt; 
   lgY(UniteTailleGrille * 4); lgX(UniteTailleGrille * 8); 
   if odd(L) then 
    begin
     pqtg; avf(2); pqtg; avf(2); pdt; 
    end 
   else 
    begin
     pqtg; avf(2); pqtg; av; pdt;
    end;
   bc;
  end;
 end;

begin
 PavageHexagonesVerticaux; PavageHexagonesHorizontaux; st; 
end.