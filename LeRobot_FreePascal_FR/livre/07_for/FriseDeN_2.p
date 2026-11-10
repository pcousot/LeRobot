{$mode macpas} program FriseDeN_2;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FriseDeN_2, page 68.                                *}
 {*                                                     *}
 {*******************************************************}
 var J : integer;
begin 
 ag;
 for J := 1 to 16 do
  begin
   av; av; pdt; vg; vd; pdt; 
  end;
 st;
end.