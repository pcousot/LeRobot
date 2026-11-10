{$mode macpas} program Jolygone175;
 uses Robot1, Robot2;
 {*******************************************************}
 {*                                                     *}
 {* "Premières leçons de programmation en Turbo Pascal" *}
 {* Patrick, Laurent, Radhia et Thibault COUSOT         *}
 {* Éditions McGraw-Hill, Paris, 1991.                  *}
 {* Jolygone à 175 degrés, pages 237 et 240.            *}
 {*                                                     *}
 {*******************************************************}
 const
  LongueurInitiale = 350;
  Angle = 175;
  NbrSegments = 40;
 var
  I : integer;
  J : integer;
begin
 ag; 
 lg(LongueurInitiale); pqtd; av; 
 for I := 1 to (NbrSegments - 1) do
  begin
   rt(Angle); tl(valLgTl * 0.95);
  end;
 st;
end.