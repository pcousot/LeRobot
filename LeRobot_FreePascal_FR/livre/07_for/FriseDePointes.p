{$mode macpas} program FriseDePointes;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* FriseDePointes, page 70.                            *}
 {*                                                     *}
 {*******************************************************}
 var J : integer;
begin 
 ag; pqtd; 
 for J := 1 to 32 do
  begin
   lc; av; bc; pdt; vd; pdt; av; av; pdt; vd; 
  end;
 st;
end.