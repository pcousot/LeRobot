{$mode macpas} program PavageVdV2limitesPeint;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage rectangulaire à deux limites, page 120.      *}
 {*                                                     *}
 {*******************************************************}

 procedure Motif;
 begin
  pqtd; avf(4); pqtd; avf(3); pqtd; av; pqtd; avf(3); pdt; avf(3);
  av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; avf(3); 
  pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; avf(3); 
  pdt; avf(3); pqtd; avf(3); lc; pdt; avf(6); pdt; bc; 
 end;
 
 procedure Colonne;
  var I : integer;
 begin
  eh;
  for I := 1 to 4 do
   begin
    Motif;
   end;
  pqtd; avf(4); pqtg;
 end;

 procedure MotifPeint;
 begin
  pqtd; avf(4); pqtd; avf(3); pqtd; av; pqtd; avf(3); pdt; avf(3);
  phtd; peindre; phtg; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; 
  pqtd; avf(3); pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; 
  pqtd; avf(3); pdt; avf(3); phtd; peindre; phtd; avf(3); lc; pdt; 
  avf(6); pdt; bc; 
 end;
 
 procedure ColonnePeinte;
  var I : integer;
 begin
  eh;
  for I := 1 to 4 do
   begin
    MotifPeint;
   end;
  pqtd; avf(4); pqtg;
 end;
 
 var I : integer;

begin
 ag; lgY(11); 
 lgX(0); Colonne;
 for I := 1 to 7 do
  begin
   lgX(2 * I); ColonnePeinte; 
  end;
 for I := 1 to 6 do
  begin
   lgX(14 - (2 * I)); ColonnePeinte; 
  end;
 lgX(0); Colonne;
 st;
end.