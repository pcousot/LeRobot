{$mode macpas} program FriseSerpentineBarree;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (2), page 80.                                *}
 {*                                                     *}
 {*******************************************************}

 procedure MotifHaut;
 begin
  vd; pqtd; av; pdt; av; pqtd; vd;
 end;
  
 procedure MotifBas;
 begin
  vg; pqtg; av; pdt; av; pqtg; vg;
 end;
  
 procedure Frise;
  var I : integer;
 begin
  for I := 1 to 10 do
   begin
    MotifHaut; MotifBas;
   end;
 end;
  
begin
 ag; Frise; st;
end.