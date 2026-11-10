{$mode macpas} program Jolygone15;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Jolygone à 15 degrés, page 237.                     *}
 {*                                                     *}
 {*******************************************************}
 const
  LongueurInitiale = 60;
  Angle = 15;
  NbrSegments = 100;
 var
  I : integer;
begin
 eb; ad; lc; avf(2); bc;
 lg(LongueurInitiale); av; 
 for I := 1 to (NbrSegments -1) do
  begin
   rt(Angle); tl(valLgTL * 0.95);
  end;
 st;
end.