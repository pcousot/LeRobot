{$mode macpas} program FriseBesicles;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure Besicles;
 begin
  av; av; pqtd; av; pqtd; av; pqtd; av; av; 
  pqtd; av; av; av; pqtd;
  av; av; pqtd; av; pqtd; av; pqtd; av; av;
 end;
 
 procedure Frise;
  var l :integer;
 begin
  pqtd;
  for l := 1 to 8 do
   begin
    Besicles;
   end;
 end;
 
begin 
 ag; Frise; st;
end.