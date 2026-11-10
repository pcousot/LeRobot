{$mode macpas} program PavageVdVRegulier;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Pavage régulier inspiré par un motif ornemental de  *}
 {* N. J. van de Vecht, page 118.                       *}
 {*                                                     *}
 {*******************************************************}

 { Pavage régulier inspiré d'un motif de N. J. van de Vecht }

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
 
 var I : integer;

begin
 ag; lg(11); eh; avf(-24); avf(24); 
 for I := 1 to 11 do
  begin
   Colonne;
  end;
 avf(24);
 st;
end.