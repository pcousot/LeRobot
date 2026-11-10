{$mode macpas} program PetitRhombicuboctaedre;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Développement du petit rhombicuoctaèdre, page 235.  *}
 {*                                                     *}
 {*******************************************************}

 const C = 20;
 
 procedure TriangleEquilateral;
 begin
  lgRT(C, 60); phtg; av; pqtg; av; p3htg; avf(2); pqtg;
 end;
 
 procedure Carre;
  var I : integer;
 begin
  lg(C);
  for I := 1 to 4 do 
   begin
    av; pqtd;
   end; 
 end;
 
 procedure CarresEmpiles;
 begin
  Carre; pqtd; av; pqtd; Carre; av; Carre; 
 end;
 
 procedure CarreEtTrianglesEmpiles;
 begin
  TriangleEquilateral; pdt; Carre;lc; phtd; av; phtg; bc; 
  TriangleEquilateral;
 end;
 
 var I : integer;
begin
 ag; lc; avf(2); bc; 
 for I := 1 to 4 do 
  begin
   CarresEmpiles; CarreEtTrianglesEmpiles;
  end;
 lc; lg(C); av; pqtg;
 for I := 1 to 3 do 
  begin
   lgRT(C, 60); avf(2); lg(C); av;
  end;
 pqtd; bc; Carre; pdt; avf(3); pqtg; av; pqtd; Carre;
 st;
end.