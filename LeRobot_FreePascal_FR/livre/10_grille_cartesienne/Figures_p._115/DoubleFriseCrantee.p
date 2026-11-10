{$mode macpas} program DoubleFriseCrantee;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Double frise crantée, page 115.                     *}
 {*                                                     *}
 {*******************************************************}

 procedure Cran;
 begin
  pqtg; av; pqtd; av; pqtd; av; pqtg;
 end;
 
 procedure GrandeBarre;
 begin
  avf(3); Cran; avf(3); 
 end;
 
 procedure PetiteBarre;
 begin
  avf(2); Cran; avf(2);
 end;
 
 procedure Descente;
 begin
  pqtd; avf(2); pqtg;
 end;

 procedure  Montee;
 begin
  pqtg; avf(2); pqtd;
 end;
  
 procedure Frise;
  var J : integer;
 begin
  for J := 1 to 13 do
   begin
    GrandeBarre; Descente; PetiteBarre; Montee;
   end;
 end;

begin
 lg(3); 
 { Frise supérieure (de gauche à droite} ag; pqtd; Frise;
 { Frise inférieure (de droite à gauche} lc; av; ps; avf(3); pqtd; 
 bc; Frise; st;
end.