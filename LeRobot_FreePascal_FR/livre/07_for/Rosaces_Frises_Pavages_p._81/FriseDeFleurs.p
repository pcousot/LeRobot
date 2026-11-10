{$mode macpas} program FriseDeFleurs;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces, frises et pavage, page 81.                 *}
 {*                                                     *}
 {*******************************************************}
  var I : integer; J : integer;
begin
 ag; lc; pqtd; av; av; bc;
 for I := 1 to 8 do
  begin
   for J := 1 to 8 do
    begin
     vd; av; av; vd; phtd;
    end;
   lc;
   for J := 1 to 5 do
    begin
     av;
    end;
   bc; 
 end; 
 st;
end.
