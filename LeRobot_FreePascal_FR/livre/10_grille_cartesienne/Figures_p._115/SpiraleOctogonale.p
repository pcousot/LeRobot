{$mode macpas} program SpiraleOctogonale;
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
 lg(1);
 for I := 1 to 93 do
  begin
   lg(I); av;
   phtd; 
  end;
 st;
end.