{$mode macpas} program Lunettes;
 uses Robot1, Robot2;

 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Paire de lunettes, page 107.                        *}
 {*                                                     *}
 {*******************************************************}

 procedure Verre;
 begin
  vd; avf(5); vd; avf(2); vd; avf(5); vd; avf(2); vd; avf(5); vd; pdt;
 end;

 procedure Pont;
 begin
  vd; vd; pdt;
 end;

 procedure Branche;
 begin
  phtd; avf(7);phtd; vd; avf(3); vd;
  pdt;
  vg; avf(3); vg; phtg; avf(7); p3htd;
 end;

begin
 lg(6); Branche; Verre; Pont; Verre; Branche; st;
end.