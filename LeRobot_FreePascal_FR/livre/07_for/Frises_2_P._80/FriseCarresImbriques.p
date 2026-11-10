{$mode macpas} program FriseCarresImbriques;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure Carre;
  var J :integer;
 begin
  for J:= 1 to 4 do
   begin
    av; pqtd;
   end;
 end;

 procedure Frise;
  var K :integer;
 begin
  { S'orienter au NE }
  phtd;
  for K := 1 to 41 do 
   begin
    carre;
    { Avancer au milieu du carré }
    lc; phtd; av; bc;
    { S'orienter au NE }
    phtg; 
   end;
 end;
 
begin 
 ag; Frise; st;
end.