{$mode macpas} program Helice;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Hélice, page 116.                                   *}
 {*                                                     *}
 {*******************************************************}
 { Dessiner une hélice à quatre pales }
  var I : integer;
begin
 for I := 1 to 4  do
  begin
   lg(15); vg; vg;
   vd; vd;
   lg(15 * 2); vd; vd;
   pqtd;
 end;
 st;
end.