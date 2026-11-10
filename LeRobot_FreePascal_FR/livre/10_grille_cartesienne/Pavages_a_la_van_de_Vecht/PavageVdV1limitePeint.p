{$mode macpas} program PavageVdV1limitePeint;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage rectangulaire à une limite, page 119.        *}
 {*                                                     *}
 {*******************************************************}

 procedure Motif;
 begin
  pqtd; avf(4); pqtd; avf(3); pqtd; av; pqtd; avf(3); pdt; avf(3);
  phtd; peindre; phtg; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; 
  pqtd; avf(3); pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; 
  pqtd; avf(3); pdt; avf(3); phtd; peindre; phtd; avf(3); lc; pdt; 
  avf(6); pdt; bc; 
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
 
 var I : integer;

begin
 ag; lgY(11); LgX(22);
 for I := 1 to 9 do
  begin
   Colonne; lgX(22 - (2 * I));
  end;
 st;
end.