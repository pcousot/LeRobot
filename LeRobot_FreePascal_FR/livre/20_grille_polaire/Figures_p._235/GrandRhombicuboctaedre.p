{$mode macpas} program GrandRhombicuboctaedre;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Développement du grand rhombicuoctaèdre, page 235.  *}
 {*                                                     *}
 {*******************************************************}

 const C = 12;

 procedure Carre;
  var I : integer;
 begin
  lg(C);
  for I := 1 to 4 do 
   begin
    av; pqtd;
   end;
 end;
 
 procedure Hexagone;
  var I : integer;
 begin
  pqtd;
  for I := 1 to 2 do 
   begin
    lg(C); av; lgRT(C,60); phtg; av; pqtg; av; phtg;
   end;
  pqtg;
 end;
 
 procedure Octogone;
  var I : integer;
 begin
  pqtd;
  for I := 1 to 4 do 
   begin
    lg(C); av; lgRT(C,45); phtg; av; phtg;
   end;
  pqtg;
 end;

 procedure CarreEtHexagonesEmpiles;
  { Dessiner un carré avec un hexagone au dessus et au dessous }
 begin
  Hexagone; pqtd; lg(C); av; pqtd; Carre; av; Hexagone; 
 end;
 
 procedure OctogoneEtCarresEmpiles;
  { Dessiner un octogone avec un carré au dessus et au dessous }
 begin
  Carre; pqtd; av; pqtd; Octogone; lc; av; lg(C); av; lgRT(C,45);
  av; bc; Carre;
 end;
 
 var I : integer;
 
begin
 ag; lc; avf(2); pqtd; avf(2); pqtg; bc; 
 for I := 1 to 4 do 
 begin
  OctogoneEtCarresEmpiles; lc; p3htg; lgRT(C,45); av; phtg; lg(C);
  av; bc; CarreEtHexagonesEmpiles; lc; pdt; lg(C); av; lgRT(C,45);
  phtd; av; phtg; bc;
 end;
 lc; lg(C); av; pqtg;
 for I := 1 to 6 do 
  begin
   lgRT(C,45); av;lg(C); av;
  end;
 pqtd; bc; Octogone; lc; pdt; avf(2); lg(C); avf(3); pqtg; av; pqtd;
 bc; Octogone;
 st;
end.