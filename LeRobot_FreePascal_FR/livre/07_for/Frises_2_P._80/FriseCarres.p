{$mode macpas} program FriseCarres;
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
  var J : integer;
 begin
  for J := 1 to 4 do
   begin
    av; pqtd;
   end;
 end;

 procedure Frise;
  var I : integer;
 begin
  for I := 1 to 41 do
   begin
    Carre; 
    av; 
   end;
 end;
 
begin 
 ag; pqtd;
 Frise;
 st;
end.