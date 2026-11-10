{$mode macpas} program Jolygone60;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Jolygone à 60 degrés, page 237.                     *}
 {*                                                     *}
 {*******************************************************}
 const
  LongueurInitiale = 150;
  Angle = 60;
  NbrSegments = 80;
 var
  I : integer;
begin
 eb; lc; avf(3); bc; 
 lg(LongueurInitiale); av; 
 for I := 1 to (NbrSegments -1) do
  begin
   rt(Angle); tl(valLgTL * 0.95);
  end;
 st;
end.