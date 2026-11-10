{$mode macpas} program RosaceOctogoneEtCarres;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Rosaces, frises et pavage, page 81.                 *}
 {*                                                     *}
 {*******************************************************}
 var
  I : integer;
  J : integer;
begin
 for I := 1 to 8 do
  begin
   av; av; phtg;
   for J := 1 to 4 do
    begin
     av; pqtd;
    end;
   p3htg; av; p3htg;
  end;
 st;
end.