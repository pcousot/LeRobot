{$mode macpas} program PavageVdV2limites;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage rectangulaire à deux limites, page 120.      *}
 {*                                                     *}
 {*******************************************************}

 { Pavage irrégulier inspiré d'un motif de N. J. van de Vecht }

 procedure Motif;
  { motif de N. J. van de Vecht }
 begin
  pqtd; avf(4); pqtd; avf(3); pqtd; av; pqtd; avf(3); pdt; avf(3);
  av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; avf(3); 
  pqtd; av; pqtd; av; pqtg; av; pqtg; av; pqtd; av; pqtd; avf(3); 
  pdt; avf(3); pqtd; avf(3); lc; pdt; avf(6); pdt; bc; 
 end;
 
 procedure Colonne;
  var I : integer;
 begin
  lgY(1); eh; lgY(11);
  for I := 1 to 4 do
   begin
    Motif;
   end;
  pqtd; avf(4); pqtg;
 end;
 
 var I : integer;

begin
 lgX(1); ag; lgX(0);
 for I := 1 to 7 do
  begin
   Colonne; lgX((2 * I));
  end;
 for I := 1 to 7 do
  begin
   Colonne; lgX(14 - (2 * I));
  end;
 Colonne; 
 st;
end.