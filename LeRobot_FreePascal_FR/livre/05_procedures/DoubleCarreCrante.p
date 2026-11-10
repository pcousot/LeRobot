{$mode macpas} program DoubleCarreCrante;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Exercice 12, page 59.                               *}
 {*                                                     *}
 {*******************************************************}

 procedure EnBasAGauche;
 begin
  lc; pdt; av; av; av; av; av; av; av; av; av; pqtd; 
  av; av; av; av; av; av; av; av; av; av; pqtd; bc; 
 end;

 procedure Cran;
 begin
  pqtg; av; pqtd; av; pqtd; av; pqtg;
 end;
 
 procedure GrandeBarre;
 begin
  av; av; av; Cran; av; av; av;
 end;
 
 procedure PetiteBarre;
 begin
  av; av; Cran; av; av;
 end;
 
 procedure Descendre;
 begin
  pqtd; av; av; pqtg;
 end;

 procedure  Monter;
 begin
  pqtg; av; av; pqtd;
 end;

 procedure CoteExterieur;
 begin
  GrandeBarre; Descendre; PetiteBarre; Monter; GrandeBarre;
 end;
   
 procedure CoteInterieur;
 begin
  PetiteBarre; Monter; GrandeBarre;  Descendre; PetiteBarre;
 end;
 
begin
 EnBasAGauche;
 CoteExterieur; pqtd; CoteExterieur; pqtd; 
 CoteExterieur; pqtd; CoteExterieur; pqtd;
 lc; av; pqtd; av; bc; 
 CoteInterieur; pqtg; CoteInterieur; pqtg; 
 CoteInterieur; pqtg; CoteInterieur; pqtg; 
 st;
end.