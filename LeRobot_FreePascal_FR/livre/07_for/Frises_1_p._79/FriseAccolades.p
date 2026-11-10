{$mode macpas} program FriseAccolades;
 uses Robot1, Robot2;
 
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Frises (1), page 79.                                *}
 {*                                                     *}
 {*******************************************************}
 
 procedure Accolade;
 begin
  vd; vg; pqtd; pqtd; vg; vd; pqtd; pqtd; 
 end;

 var I : integer;

begin
 ag;
 for I := 1 to 10 do
  begin
   Accolade;
  end;
 st; 
end.