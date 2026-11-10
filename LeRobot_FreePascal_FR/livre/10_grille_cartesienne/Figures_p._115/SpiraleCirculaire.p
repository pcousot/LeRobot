{$mode macpas} program SpiraleCirculaire;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirales et cercles concentriques, page 115.        *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 for I := 1 to 46 do
  begin
   lg(3 * I); vd;
  end;
 st; 
end.