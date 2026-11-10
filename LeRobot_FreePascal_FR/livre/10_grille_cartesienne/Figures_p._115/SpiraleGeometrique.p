{$mode macpas} program SpiraleGeometrique;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Spirales et cercles concentriques, page 115 et 122. *}
 {*                                                     *}
 {*******************************************************}
 var I : integer;
begin
 pdt; 
 for I := 1 to 12 do
  begin
   lg(I * I); vg;
  end;
 st; 
end.