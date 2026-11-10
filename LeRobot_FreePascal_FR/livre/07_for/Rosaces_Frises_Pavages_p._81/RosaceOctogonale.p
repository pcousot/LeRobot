{$mode macpas} program RosaceOctogonale;
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
 for I := 1 to 8 do
  begin
   for J := 1 to 8 do
    begin
     av; phtd;
    end;
   phtg; 
 end; 
 st;
end.
